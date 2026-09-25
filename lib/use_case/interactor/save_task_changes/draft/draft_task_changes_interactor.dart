import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/draft_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク情報の変更を下書きとして保有する処理フローを実装するクラス
class DraftTaskChangesInteractor
    with NotificationFromUseCase
    implements DraftTaskChangesUseCase {
  // todo コンストラクタ
  DraftTaskChangesInteractor({
    required NotificationService notificationService,
    required LoadingService loadingService,
    required DailyTasksPresenter dailyTasksPresenter,
  })  : _dailyTasksPresenter = dailyTasksPresenter,
        notificationService = notificationService,
        _loadingService = loadingService;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final DailyTasksPresenter _dailyTasksPresenter;

  /// ローディングの呼び出し口
  final LoadingService _loadingService;

  /// 通知送信先（[NotificationUseCase]）のインスタンス
  @override
  final NotificationService notificationService;

  /// タスク情報の変更を下書きとして保有する処理フロー
  ///
  /// 変更の反映の完了まで `await` する。
  @override
  Future<Result<void, Exception>> execute({
    required TaskList<ETask> draft,
  }) =>
      _loadingService.loadAsync<Result<void, Exception>>(
        () async {
          try {
            // データの反映を Presenter に依頼する
            await _publishTasks(draft);
            return Success(null);
          } catch (e, st) {
            final errorMsg = "$e\n$st";
            notifyError(content: errorMsg, specifiesLayer: true);
            return Failure(Exception(errorMsg));
          }
        },
      );

  /// データを反映させるプライベートメソッド
  Future<void> _publishTasks(TaskList<ETask> newDraft) async {
    // Map<K, List<ETask>> の形で集計する
    final Map<Date, List<EDailyTask>> tallyDailyTasksMap = {};
    final Map<UniqueWeek, List<EWeeklyTask>> tallyWeeklyTasksMap = {};
    final Map<Month, List<EMonthlyTask>> tallyMonthlyTasksMap = {};
    final Map<int, List<EYearlyTask>> tallyYearlyTasksMap = {};
    // eTask の網羅性チェック
    for (final eTaskEntry in newDraft) {
      final ETask eTask = eTaskEntry.value;
      switch (eTask) {
        case EDailyTask(date: final Date key):
          tallyDailyTasksMap.addNullable(key: key, value: eTask);
        case EWeeklyTask(week: final UniqueWeek key):
          tallyWeeklyTasksMap.addNullable(key: key, value: eTask);
        case EMonthlyTask(month: final Month key):
          tallyMonthlyTasksMap.addNullable(key: key, value: eTask);
        case EYearlyTask(year: final int key):
          tallyYearlyTasksMap.addNullable(key: key, value: eTask);
      }
    }
    // 集計したデータを Presenter に渡す形に（ List から TaskList に）変換する
    final Map<Date, TaskList<EDailyTask>> eDailyTasksMap =
        tallyDailyTasksMap.map(
      (key, tasks) => MapEntry(key, TaskList<EDailyTask>.fromIterable(tasks)),
    );
    final Map<UniqueWeek, TaskList<EWeeklyTask>> eWeeklyTasksMap =
        tallyWeeklyTasksMap.map(
      (key, tasks) => MapEntry(key, TaskList<EWeeklyTask>.fromIterable(tasks)),
    );
    final Map<Month, TaskList<EMonthlyTask>> eMonthlyTasksMap =
        tallyMonthlyTasksMap.map(
      (key, tasks) => MapEntry(key, TaskList<EMonthlyTask>.fromIterable(tasks)),
    );
    final Map<int, TaskList<EYearlyTask>> eYearlyTasksMap =
        tallyYearlyTasksMap.map(
      (key, tasks) => MapEntry(key, TaskList<EYearlyTask>.fromIterable(tasks)),
    );

    // 流れてきたデータの単位に対応した Presenter を呼び出す
    if (eDailyTasksMap.isNotEmpty) {
      await _dailyTasksPresenter.handleDailyTasksUpdating(eDailyTasksMap);
    }
    if (eWeeklyTasksMap.isNotEmpty) {
      await _weeklyTasksPresenter.handleWeeklyTasksUpdating(eWeeklyTasksMap);
    }
    if (eMonthlyTasksMap.isNotEmpty) {
      await _monthlyTasksPresenter.handleMonthlyTasksUpdating(eMonthlyTasksMap);
    }
    if (eYearlyTasksMap.isNotEmpty) {
      await _yearlyTasksPresenter.handleYearlyTasksUpdating(eYearlyTasksMap);
    }
  }
}
