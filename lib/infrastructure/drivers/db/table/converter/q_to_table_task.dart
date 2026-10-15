

import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

class QToTableTask {

  /// [QDailyTask] から [DayTask] への変換
  static DayTask toDayTaskRecord(QDailyTask qTask) {
    return DayTask(
      task: qTask.title,
      date: qTask.dateInt,
      id: qTask.id,
      isChecked: qTask.isChecked,
      labelId: qTask.labelId,
    );
  }

  /// [QWeeklyTask] から [WeeklyTask] への変換
  static WeeklyTask toWeeklyTaskRecord(QWeeklyTask qTask) {
    return WeeklyTask(
      task: qTask.title,
      firstDate: qTask.firstDateInt,
      id: qTask.id,
      isChecked: qTask.isChecked,
      labelId: qTask.labelId,
    );
  }

  /// [QMonthlyTask] から [MonthlyTask] への変換
  static MonthlyTask toMonthlyTaskRecord(QMonthlyTask qTask) {
    return MonthlyTask(
      task: qTask.title,
      month: qTask.monthInt,
      id: qTask.id,
      isChecked: qTask.isChecked,
      labelId: qTask.labelId,
    );
  }
}