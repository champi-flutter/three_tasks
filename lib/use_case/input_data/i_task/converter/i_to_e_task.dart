
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';

/// [ITask] から値を取り出して [ETask] へ変換する
class IToETask {
  /// [ITask] から値を取り出して [ETask] へ変換する
  static ETask toETask(ITask task) {
    return switch (task) {
      IDailyTask() => toEDailyTask(task),
      IWeeklyTask() => toEWeeklyTask(task),
      IMonthlyTask() => toEMonthlyTask(task),
      IYearlyTask() => toEYearlyTask(task),
    };
  }

  /// [EDailyTask] へ変換
  static EDailyTask toEDailyTask(IDailyTask dailyTask) {
    return EDailyTask(
      id: dailyTask.id,
      title: dailyTask.title,
      isChecked: dailyTask.isChecked,
      labelId: dailyTask.labelId,
      date: dailyTask.date, review: dailyTask.review,
    );
  }

  static EWeeklyTask toEWeeklyTask(IWeeklyTask weeklyTask) {
    return EWeeklyTask(
      id: weeklyTask.id,
      title: weeklyTask.title,
      isChecked: weeklyTask.isChecked,
      labelId: weeklyTask.labelId,
      week: weeklyTask.week,
      review: weeklyTask.review,
    );
  }

  static EMonthlyTask toEMonthlyTask(IMonthlyTask monthlyTask) {
    return EMonthlyTask(
      id: monthlyTask.id,
      title: monthlyTask.title,
      isChecked: monthlyTask.isChecked,
      labelId: monthlyTask.labelId,
      month: monthlyTask.month,
      review: monthlyTask.review,
    );
  }

  static EYearlyTask toEYearlyTask(IYearlyTask yearlyTask) {
    return EYearlyTask(
      id: yearlyTask.id,
      title: yearlyTask.title,
      isChecked: yearlyTask.isChecked,
      labelId: yearlyTask.labelId,
      year: yearlyTask.year,
      review: yearlyTask.review,
    );
  }
}

