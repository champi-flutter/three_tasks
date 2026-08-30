import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';

class WeeklyTasksController {
  WeeklyTasksController({
    required SaveTaskChangesUseCase saveTaskChangesUseCase,
  })
      : _saveTaskChangesUseCase = saveTaskChangesUseCase;

  /// タスク変更保存フローへのアクセス
  final SaveTaskChangesUseCase _saveTaskChangesUseCase;

  Future<void> saveTaskChanges({
    required List<TaskUpdateParameter> taskInfo,
  })async{
    final List<TaskUpdateParameter> blank = taskInfo.where((item) => item.targetVTask.id == -2).toList();

    await _saveTaskChangesUseCase.execute(taskInfo: taskInfo);
  }
}
