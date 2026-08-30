import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';

class TasksController {
  TasksController({required SaveTaskChangesUseCase saveTaskChangesUseCase,})
      : _saveTaskChangesUseCase = saveTaskChangesUseCase;

  /// タスク変更保存フローへのアクセス
  final SaveTaskChangesUseCase _saveTaskChangesUseCase;

  Future<void> saveTaskChanges({
    required List<TaskUpdateParameter> taskInfo,
  })async{
    await _saveTaskChangesUseCase.execute(taskInfo: taskInfo);
  }
}
