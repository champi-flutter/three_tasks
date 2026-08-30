import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';

class WeeklyTasksController {
  WeeklyTasksController({
    required SaveTaskChangesUseCase saveTaskChangesUseCase,
  })
      : _saveTaskChangesUseCase = saveTaskChangesUseCase;

  /// タスク変更保存フローへのアクセス
  final SaveTaskChangesUseCase _saveTaskChangesUseCase;

  /// 週タスク固有のタスク変更保存フローを実装する
  Future<void> saveTaskChanges({
    required List<TaskUpdateParameter> taskInfo,
  })async{
    await _saveTaskChangesUseCase.execute(taskInfo: taskInfo);
  }
}
