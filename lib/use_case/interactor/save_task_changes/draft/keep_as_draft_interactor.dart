import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/keep_as_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク情報の変更を下書きとして保有する処理フローを実装するクラス
class KeepAsDraftInteractor
    with NotificationFromUseCase
    implements KeepAsDraftUseCase {
  KeepAsDraftInteractor({
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
  ///   1. パラメータを [VTask] のリストに変換する
  ///   2. タスクの単位に対応した Presenter を呼び出して、データを保存せずに画面に反映させる。
  ///
  /// 変更の反映の完了まで `await` する。
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  @override
  Future<Result<void, Exception>> execute({
    required List<TaskUpdateParameter> taskInfo,
  }) =>
      _loadingService.loadAsync<Result<void, Exception>>(
            () async {
          try {
            if (taskInfo.isEmpty) {
              throw Exception("無効な値です");
            }
            // 各パラメータペアを個別に DTask に変換する
            final List<VTask> newDraft = taskInfo.map(_toVTask).toList();
            // データの反映を Presenter に依頼する
            await _publishTasks(newDraft);
            return Success(null);
          } catch (e, st) {
            final errorMsg = "$e\n$st";
            notifyError(content: errorMsg, specifiesLayer: true);
            return Failure(Exception(errorMsg));
          }
        },
      );

  /// パラメータから表示型に変換するプライベートメソッド
  VTask _toVTask(TaskUpdateParameter parameter) {
    final targetVTask = parameter.targetVTask;
    final String? newTitle = parameter.newTitle;
    final bool? newChecked = parameter.newChecked;
    final int? newLabelId = parameter.newLabelId;
    return switch (targetVTask) {
      VDailyTask() => VDailyTask(
        task: newTitle?? targetVTask.task,
        isChecked: newChecked?? targetVTask.isChecked,
        labelId: newLabelId?? targetVTask.labelId,
        date: targetVTask.date,
        id: targetVTask.id,
      ),
      VWeeklyTask() => VWeeklyTask(
        task: newTitle?? targetVTask.task,
        isChecked: newChecked?? targetVTask.isChecked,
        labelId: newLabelId?? targetVTask.labelId,
        week: targetVTask.week,
        id: targetVTask.id,
      ),
      VMonthlyTask() => VMonthlyTask(
        task: newTitle?? targetVTask.task,
        isChecked: newChecked?? targetVTask.isChecked,
        labelId: newLabelId?? targetVTask.labelId,
        month: targetVTask.month,
        id: targetVTask.id,
      ),
      VYearlyTask() => VYearlyTask(
        task: newTitle?? targetVTask.task,
        isChecked: newChecked?? targetVTask.isChecked,
        labelId: newLabelId?? targetVTask.labelId,
        year: targetVTask.year,
        id: targetVTask.id,
      ),
    };
  }

  /// データを反映させるプライベートメソッド
  Future<void> _publishTasks(List<VTask> newDraft) async {
    // 各単位のデータ Map
    final Map<Date, List<VDailyTask>> vDailyTasksMap = {};
    final Map<UniqueWeek, List<VWeeklyTask>> vWeeklyTasksMap = {};
    final Map<Month, List<VMonthlyTask>> vMonthlyTasksMap = {};
    final Map<int, List<VYearlyTask>> vYearlyTasksMap = {};
    // VTask の網羅性チェック
    for(VTask vTask in newDraft){
      switch(vTask){
        case VDailyTask(date: final Date key):
          vDailyTasksMap.addNullable(key: key, value: vTask);
        case VWeeklyTask(week: final UniqueWeek key):
          vWeeklyTasksMap.addNullable(key: key, value: vTask);
        case VMonthlyTask(month: final Month key):
          vMonthlyTasksMap.addNullable(key: key, value: vTask);
        case VYearlyTask(year: final int key):
          vYearlyTasksMap.addNullable(key: key, value: vTask);
      }
    }
    // 流れてきたデータの単位に対応した Presenter を呼び出す
    if(vDailyTasksMap.isNotEmpty){
      await _dailyTasksPresenter.handleDailyTasksUpdating(vDailyTasksMap);
    }
    if(vWeeklyTasksMap.isNotEmpty){
      await _weeklyTasksPresenter.handleWeeklyTasksUpdating(vWeeklyTasksMap);
    }
    if(vMonthlyTasksMap.isNotEmpty){
      await _monthlyTasksPresenter.handleMonthlyTasksUpdating(vMonthlyTasksMap);
    }
    if(vYearlyTasksMap.isNotEmpty){
      await _yearlyTasksPresenter.handleYearlyTasksUpdating(vYearlyTasksMap);
    }
  }
}
