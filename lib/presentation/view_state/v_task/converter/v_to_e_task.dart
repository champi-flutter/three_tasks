
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';

class VToETask{
  static ETask toETask(VTask task)=>switch (task) {
    // region
    VDailyTask() => toEDailyTask(task),
    VWeeklyTask() => toEWeeklyTask(task),
    VMonthlyTask() => toEMonthlyTask(task),
    VYearlyTask() => toEYearlyTask(task),
  // endregion
  };

  static EDailyTask toEDailyTask(VDailyTask vTask)=>EDailyTask(
    id: vTask.id,
    title: vTask.title,
    isChecked: vTask.isChecked,
    labelId: vTask.labelId,
    date: vTask.date,
  );

  static EWeeklyTask toEWeeklyTask(VWeeklyTask vTask)=>EWeeklyTask(
    id: vTask.id,
    title: vTask.title,
    isChecked: vTask.isChecked,
    labelId: vTask.labelId,
    week: vTask.week,
  );

  static EMonthlyTask toEMonthlyTask(VMonthlyTask vTask)=>EMonthlyTask(
    id: vTask.id,
    title: vTask.title,
    isChecked: vTask.isChecked,
    labelId: vTask.labelId,
    month: vTask.month,
  );

  static EYearlyTask toEYearlyTask(VYearlyTask vTask)=>EYearlyTask(
    id: vTask.id,
    title: vTask.title,
    isChecked: vTask.isChecked,
    labelId: vTask.labelId,
    year: vTask.year,
  );
}