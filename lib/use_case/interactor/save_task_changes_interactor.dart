import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク情報の変更を保存する処理フローを実装するクラス
class SaveTaskChangesInteractor implements SaveTaskChangesUseCase {
  SaveTaskChangesInteractor({
    required DataRepository dataRepository,
    required DailyTasksCacheHandler dailyTasksCacheHandler,
    required NotificationUseCase notificationUseCase,
  })  : _repository = dataRepository,
  _dailyTasksCacheHandler = dailyTasksCacheHandler,
        _notificationUseCase = notificationUseCase;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  final DailyTasksCacheHandler _dailyTasksCacheHandler;

  /// 通知送信先（[NotificationUseCase]）のインスタンス
  final NotificationUseCase _notificationUseCase;

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
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  @override
  Future<Result<void, Exception>> execute({
    required List<TaskUpdateParameter> taskInfo,
  })
  // 折りたたみ用
  async {
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
          _cacheChanges(newTaskList);
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
  }

  /// 変更をキャッシュするプライベートメソッド
  void _cacheChanges(List<DTask> newTaskList){
    // 日単位の値
    final Map<Date, List<DDailyTask>> resultDay = {};
    // 週単位の値
    final List<DWeeklyTask> resultWeek = [];
    for (DTask task in newTaskList) {
      switch (task) {
        case DDailyTask():
        // 対象日付の key のリストに task を追加
          resultDay.addNullable(key: task.date, value: task);
        case DWeeklyTask():
        // 週単位の値に追加
          resultWeek.add(task);
        case DMonthlyTask():
          _;
        case DYearlyTask():
          _;
      }
    }
    // 日単位の分があればキャッシュを更新
    if (resultDay.isNotEmpty) {
      _dailyTasksCacheHandler.update(resultDay);
    }
    // todo 週、月、年単位の場合のストリーム（2026/08/06）＞＞
    // 週単位の分があればキャッシュを更新
    if (resultWeek.isNotEmpty) {
      _;
    }
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
