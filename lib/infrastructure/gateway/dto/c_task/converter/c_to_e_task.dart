
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';

/// [CTask] から値を取り出して [ETask] へ変換する
class CToETask {
  /// [CTask] から値を取り出して [ETask] へ変換する
  static ETask toETask(CTask task) {
    return switch (task) {
      CDailyTask() => toEDailyTask(task),
      CWeeklyTask() => toEWeeklyTask(task),
      CMonthlyTask() => toEMonthlyTask(task),
      CYearlyTask() => toEYearlyTask(task),
    };
  }

  /// [EDailyTask] へ変換
  static EDailyTask toEDailyTask(CDailyTask dailyTask) {
    return EDailyTask(
      id: dailyTask.id,
      title: dailyTask.title,
      isChecked: dailyTask.isChecked,
      labelId: dailyTask.labelId,
      date: dailyTask.date,
    );
  }

  static EWeeklyTask toEWeeklyTask(CWeeklyTask weeklyTask) {
    return EWeeklyTask(
      id: weeklyTask.id,
      title: weeklyTask.title,
      isChecked: weeklyTask.isChecked,
      labelId: weeklyTask.labelId,
      week: weeklyTask.week,
    );
  }

  static EMonthlyTask toEMonthlyTask(CMonthlyTask monthlyTask) {
    return EMonthlyTask(
      id: monthlyTask.id,
      title: monthlyTask.title,
      isChecked: monthlyTask.isChecked,
      labelId: monthlyTask.labelId,
      month: monthlyTask.month,
    );
  }

  static EYearlyTask toEYearlyTask(CYearlyTask yearlyTask) {
    return EYearlyTask(
      id: yearlyTask.id,
      title: yearlyTask.title,
      isChecked: yearlyTask.isChecked,
      labelId: yearlyTask.labelId,
      year: yearlyTask.year,
    );
  }
}

