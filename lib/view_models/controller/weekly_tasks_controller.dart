import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';

class WeeklyTasksController {
  WeeklyTasksController({
    required SaveWeeklyTaskChangesUseCase saveWeeklyTaskChangesUseCase,
  })
      : _saveWeeklyTaskChangesUseCase = saveWeeklyTaskChangesUseCase;

  /// タスク変更保存フローへのアクセス
  final SaveWeeklyTaskChangesUseCase _saveWeeklyTaskChangesUseCase;

  /// 週タスク固有のタスク変更保存フローを実装する
  Future<void> saveTaskChanges({
    required List<WeeklyTaskUpdateParameter> taskInfo,
  })async{
    await _saveWeeklyTaskChangesUseCase.execute(taskInfo: taskInfo);
  }
}
