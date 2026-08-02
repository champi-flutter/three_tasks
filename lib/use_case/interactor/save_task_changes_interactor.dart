import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク情報の変更を保存する処理フローを実装するクラス
class SaveTaskChangesInteractor implements SaveTaskChangesUseCase{
  SaveTaskChangesInteractor({
    required DataRepository dataRepository,
    // required
  }) : _repository = dataRepository;
  final DataRepository _repository;

  // todo riverpod_wrapper の修正を待つ（2026/08/02）＞＞
  /// 通知送信先（[EventNotifier]）のインスタンス
  EventNotifier get _readEventNotifier => _ref.read(eventProvider);

  // todo 通知関連
  /// エラー通知メソッド
  void _notifyError({
    required String content,
    bool specifiesLayer = false,
  })
  // 折りたたみ用
  {
    _readEventNotifier.notifyInfo(
      layer: specifiesLayer ? NotificationFrom.viewModel : null,
      type: NotificationType.error,
      notification: "[SaveTaskChangesInteractor] $content",
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
      if(taskInfo.isEmpty){
        throw Exception("無効な値です");
      }
      // 各パラメータペアを個別に DTask に変換
      final List<DTask> newTaskList = taskInfo.map(_toDTask).toList();
      // リポジトリにデータの保存を依頼
      return await _repository.saveTaskChanges(newTaskList: newTaskList);
    } catch (e) {
      _notifyError(content: "$e", specifiesLayer: true);
      return Failure(Exception(e));
    }
  }

  /// DTOに変換するプライベートメソッド
  DTask _toDTask(TaskUpdateParameter vTask){
    final targetVTask = vTask.targetVTask;
  final newTitle = vTask.newTitle;
  final newChecked = vTask.newChecked;
  final newLabelId = vTask.newLabelId;
    return switch (targetVTask) {
      VDayTask() => DDayTask(
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
