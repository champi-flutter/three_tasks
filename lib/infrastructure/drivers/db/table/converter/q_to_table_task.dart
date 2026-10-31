

import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

class QToTableTask {

  /// [QDailyTask] から [DayTask] への変換
  static DayTask toDayTaskRecord(QDailyTask qTask) {
    return DayTask(
      title: qTask.title,
      date: qTask.dateInt,
      id: qTask.id,
      isChecked: qTask.isChecked,
      labelId: qTask.labelId,
      result: qTask.review.result,
      next: qTask.review.next,
    );
  }

  /// [QWeeklyTask] から [WeeklyTask] への変換
  static WeeklyTask toWeeklyTaskRecord(QWeeklyTask qTask) {
    return WeeklyTask(
      title: qTask.title,
      firstDate: qTask.firstDateInt,
      id: qTask.id,
      isChecked: qTask.isChecked,
      labelId: qTask.labelId,
      result: qTask.review.result,
      next: qTask.review.next,
    );
  }

  /// [QMonthlyTask] から [MonthlyTask] への変換
  static MonthlyTask toMonthlyTaskRecord(QMonthlyTask qTask) {
    return MonthlyTask(
      title: qTask.title,
      month: qTask.monthInt,
      id: qTask.id,
      isChecked: qTask.isChecked,
      labelId: qTask.labelId,
      result: qTask.review.result,
      next: qTask.review.next,
    );
  }

  /// [QYearlyTask] から [YearlyTask] への変換
  static YearlyTask toYearlyTaskRecord(QYearlyTask qTask) {
    return YearlyTask(
      title: qTask.title,
      year: qTask.year,
      id: qTask.id,
      isChecked: qTask.isChecked,
      labelId: qTask.labelId,
      result: qTask.review.result,
      next: qTask.review.next,
    );
  }
}