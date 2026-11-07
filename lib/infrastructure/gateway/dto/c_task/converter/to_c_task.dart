
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';

class EToCTask {
  static CTask toCTask<Task extends TaskBase>(
      ETask task,
      ) {
    return switch (task) {
      EDailyTask() => toCDailyTask(task),
      EWeeklyTask() => toCWeeklyTask(task),
      EMonthlyTask() => toCMonthlyTask(task),
      EYearlyTask() => toCYearlyTask(task),
    };
  }

  /// [CDailyTask] へ変換
  static CDailyTask toCDailyTask(EDailyTask dailyTask) {
    return CDailyTask(
      id: dailyTask.id,
      title: dailyTask.title,
      isChecked: dailyTask.isChecked,
      labelId: dailyTask.labelId,
      date: dailyTask.date,
      review: dailyTask.review,
    );
  }

  static CWeeklyTask toCWeeklyTask(EWeeklyTask weeklyTask) {
    return CWeeklyTask(
      id: weeklyTask.id,
      title: weeklyTask.title,
      isChecked: weeklyTask.isChecked,
      labelId: weeklyTask.labelId,
      week: weeklyTask.week,
      review: weeklyTask.review,
    );
  }

  static CMonthlyTask toCMonthlyTask(EMonthlyTask monthlyTask) {
    return CMonthlyTask(
      id: monthlyTask.id,
      title: monthlyTask.title,
      isChecked: monthlyTask.isChecked,
      labelId: monthlyTask.labelId,
      month: monthlyTask.month,
      review: monthlyTask.review,
    );
  }

  static CYearlyTask toCYearlyTask(EYearlyTask yearlyTask) {
    return CYearlyTask(
      id: yearlyTask.id,
      title: yearlyTask.title,
      isChecked: yearlyTask.isChecked,
      labelId: yearlyTask.labelId,
      year: yearlyTask.year,
      review: yearlyTask.review,
    );
  }
}