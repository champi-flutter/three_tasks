
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';

extension ToEntity on VTask{
  ETask toETask()=>switch (this) { // region
    VDailyTask(date: final Date date) => EDailyTask(
      title: title,
      isChecked: isChecked,
      labelId: labelId,
      date: date,
      id: id,
    ),
    VWeeklyTask(week: final UniqueWeek week) => EWeeklyTask(
      title: title,
      isChecked: isChecked,
      labelId: labelId,
      week: week,
      id: id,
    ),
    VMonthlyTask(month: final Month month) => EMonthlyTask(
      title: title,
      isChecked: isChecked,
      labelId: labelId,
      month: month,
      id: id,
    ),
    VYearlyTask(year: final int year) => EYearlyTask(
      title: title,
      isChecked: isChecked,
      labelId: labelId,
      year: year,
      id: id,
    ),
  // endregion
  };
}