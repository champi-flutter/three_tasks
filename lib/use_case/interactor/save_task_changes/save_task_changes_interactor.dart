import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク情報の変更を保存する処理フローを実装するクラス
class SaveTaskChangesInteractor implements SaveTaskChangesUseCase {
  SaveTaskChangesInteractor({
    required DataRepository dataRepository,
    required DailyTasksCacheHandler dailyTasksCacheHandler,
    required NotificationService notificationService,
    required LoadingService loadingService,
    required WeeklyTasksCacheHandler weeklyTasksCacheHandler,
  })  : _weeklyTasksCacheHandler = weeklyTasksCacheHandler,
        _repository = dataRepository,
        _dailyTasksCacheHandler = dailyTasksCacheHandler,
        _notificationUseCase = notificationService,
        _loader = loadingService;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// 日単位タスクのキャッシュハンドラのインスタンス
  final DailyTasksCacheHandler _dailyTasksCacheHandler;

  /// 週単位タスクのキャッシュハンドラのインスタンス
  final WeeklyTasksCacheHandler _weeklyTasksCacheHandler;

  /// ローディングの呼び出し口
  final LoadingService _loader;

  /// 通知送信先（[NotificationUseCase]）のインスタンス
  final NotificationService _notificationUseCase;

  // todo 通知関連
  /// エラー通知メソッド
  void _notifyError({
    required String content,
    bool specifiesLayer = false,
  })
  // 折りたたみ用
  {
    _notificationUseCase.notifyInfo(
      layer: specifiesLayer ? NotificationFrom.viewModel : null,
      type: NotificationType.error,
      notification: content,
    );
  }

  /// タスク情報の変更を保存する処理フロー
  ///   1. パラメータの [VTask] を [DTask] に変換する
  ///   2. リポジトリにテータの保存を依頼する
  ///   3. キャッシュハンドラの `update` を実行する
  ///
  /// 変更の反映の完了まで `await` する。
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  @override
  Future<Result<void, Exception>> execute({
    required List<TaskUpdateParameter> taskInfo,
  }) =>
      _loader.loadAsync<Result<void, Exception>>(
        () async {
          try {
            if (taskInfo.isEmpty) {
              throw Exception("無効な値です");
            }
            // 各パラメータペアを個別に DTask に変換する
            final List<DTask> newTaskList = taskInfo.map(_toDTask).toList();
            // リポジトリにデータの保存を依頼する
            final Result<void, Exception> result =
                await _repository.saveTaskChanges(newTaskList: newTaskList);
            // 保存が成功した場合に、キャッシュを更新する
            switch (result) {
              case Success():
                // 反映完了まで await
                await _cacheChanges(newTaskList);
              case Failure(
                  exception: Exception error,
                ):
                throw error;
            }
            return result;
          } catch (e) {
            _notifyError(content: "$e", specifiesLayer: true);
            return Failure(Exception(e));
          }
        },
      );

  /// 変更をキャッシュするプライベートメソッド
  ///
  /// 変更の反映の完了まで await する。
  Future<void> _cacheChanges(List<DTask> newTaskList) async {
    // Date と日単位タスクリストデータ（index とタスクデータとの Map ）との Map
    final Map<Date, Map<int, DataEntry<int, DDailyTask>>> resultDay = {};
    // 週単位の値
    final Map<UniqueWeek, Map<int, DataEntry<int, DWeeklyTask>>> resultWeek =
        {};
    // for 文中の対象の index
    int index = 0;
    for (DTask task in newTaskList) {
      switch (task) {
        case DDailyTask():
          // 対象日付の key のリストに index と 日単位タスク の組み合わせを追加する
          resultDay.addNullable(
            key: task.date,
            subKey: index,
            value: (
              id: task.id,
              value: task,
            ),
          );
        case DWeeklyTask():
          // 対象日付の key のリストに index と 週単位タスク の組み合わせを追加する
          resultWeek.addNullable(
            key: task.week,
            subKey: index,
            value: (
              id: task.id,
              value: task,
            ),
          );
        case DMonthlyTask():
          _;
        case DYearlyTask():
          _;
      }
      index++;
    }
    // 日単位の分があればキャッシュを更新
    if (resultDay.isNotEmpty) {
      // key は通常1つのみ
      for (final entry in resultDay.entries) {
        // 反映まで await
        await _dailyTasksCacheHandler.update(
          key: entry.key,
          valueMap: entry.value,
        );
      }
    }
    // 週単位の分があればキャッシュを更新
    if (resultWeek.isNotEmpty) {
      // key は通常1つのみ
      for (final entry in resultWeek.entries) {
        // 反映まで await
        await _weeklyTasksCacheHandler.update(
          key: entry.key,
          valueMap: entry.value,
        );
      }
    }
    // todo 月、年単位の場合のストリーム（2026/08/06）＞＞
  }

  /// DTOに変換するプライベートメソッド
  DTask _toDTask(TaskUpdateParameter vTask) {
    final targetVTask = vTask.targetVTask;
    final newTitle = vTask.newTitle;
    final newChecked = vTask.newChecked;
    final newLabelId = vTask.newLabelId;
    return switch (targetVTask) {
      VDailyTask() => DDailyTask(
          task: newTitle,
          isChecked: newChecked,
          labelId: newLabelId,
          date: targetVTask.date,
          id: targetVTask.id,
        ),
      VWeeklyTask() => DWeeklyTask(
          task: newTitle,
          isChecked: newChecked,
          labelId: newLabelId,
          week: targetVTask.week,
          id: targetVTask.id,
        ),
      VMonthlyTask() => DMonthlyTask(
          task: newTitle,
          isChecked: newChecked,
          labelId: newLabelId,
          month: targetVTask.month,
          id: targetVTask.id,
        ),
      VYearlyTask() => DYearlyTask(
          task: newTitle,
          isChecked: newChecked,
          labelId: newLabelId,
          year: targetVTask.year,
          id: targetVTask.id,
        ),
    };
  }
}
