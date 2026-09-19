
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/s_task/s_task.dart';
import 'package:three_tasks/use_case/input_parameter/task_update_parameter/task_update_parameter.dart';

class ToSTask{
  /// [TaskUpdateParameter] から [STask] に変換するプライベートメソッド
  static STask toSTask(TaskUpdateParameter parameter) {
    final ETask targetTask = parameter.taskOrigin;
    final String? newTitle = parameter.newTitle;
    final bool? newChecked = parameter.newChecked;
    final int? newLabelId = parameter.newLabelId;
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