
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateways/dto/s_task/s_task.dart';
import 'package:three_tasks/use_case/input_parameter/task_update_parameter.dart';

extension ToSTaskList on List<TaskUpdateParameter>{
  /// [TaskUpdateParameter] のリストから [STask] のリストに変換する
  List<STask> toSTaskList()=> map<STask>(_toSTask).toList();

  /// [TaskUpdateParameter] から [STask] に変換するプライベートメソッド
  STask _toSTask(TaskUpdateParameter parameter) {
    final targetTask = parameter.targetTask;
    final newTitle = parameter.newTitle;
    final newChecked = parameter.newChecked;
    final newLabelId = parameter.newLabelId;
    return switch (targetTask) { // region
      EDailyTask() => SDailyTask(
        title: newTitle,
        isChecked: newChecked,
        labelId: newLabelId,
        date: targetTask.date,
        id: targetTask.id,
      ),
      EWeeklyTask() => SWeeklyTask(
        title: newTitle,
        isChecked: newChecked,
        labelId: newLabelId,
        week: targetTask.week,
        id: targetTask.id,
      ),
      EMonthlyTask() => SMonthlyTask(
        title: newTitle,
        isChecked: newChecked,
        labelId: newLabelId,
        month: targetTask.month,
        id: targetTask.id,
      ),
      EYearlyTask() => SYearlyTask(
        title: newTitle,
        isChecked: newChecked,
        labelId: newLabelId,
        year: targetTask.year,
        id: targetTask.id,
      ),
    // endregion
    };
  }
}