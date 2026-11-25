import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/use_case/output_data/o_task/o_task.dart';

/// タスクの OutputData への変換器
class TaskOutputConverter {
  static OTask toOTask(ETask eTask) => switch (eTask) {
        // region
        EDailyTask() => toODailyTask(eTask),
        EWeeklyTask() => toOWeeklyTask(eTask),
        EMonthlyTask() => toOMonthlyTask(eTask),
        EYearlyTask() => toOYearlyTask(eTask),
        // endregion
      };

  static ODailyTask toODailyTask(
    EDailyTask dailyTask,
  ) =>
      ODailyTask(
        id: dailyTask.id,
        title: dailyTask.title,
        isChecked: dailyTask.isChecked,
        labelId: dailyTask.labelId,
        review: dailyTask.review,
        date: dailyTask.date,
        isFetched: dailyTask.isFetched,
      );

  static OWeeklyTask toOWeeklyTask(
    EWeeklyTask weeklyTask,
  ) =>
      OWeeklyTask(
        id: weeklyTask.id,
        title: weeklyTask.title,
        isChecked: weeklyTask.isChecked,
        labelId: weeklyTask.labelId,
        week: weeklyTask.week,
        review: weeklyTask.review,
        isFetched: weeklyTask.isFetched,
        isPlaceholder2: weeklyTask.isPlaceholder2,
        shouldIdentify: weeklyTask.shouldIdentify,
        willRemainPlaceholder2: weeklyTask.willRemainPlaceholder2,
      );

  static OMonthlyTask toOMonthlyTask(EMonthlyTask monthlyTask) => OMonthlyTask(
        id: monthlyTask.id,
        title: monthlyTask.title,
        isChecked: monthlyTask.isChecked,
        labelId: monthlyTask.labelId,
        review: monthlyTask.review,
        month: monthlyTask.month,
        isFetched: monthlyTask.isFetched,
      );

  static OYearlyTask toOYearlyTask(EYearlyTask yearlyTask) => OYearlyTask(
        id: yearlyTask.id,
        title: yearlyTask.title,
        isChecked: yearlyTask.isChecked,
        labelId: yearlyTask.labelId,
        review: yearlyTask.review,
        year: yearlyTask.year,
        isFetched: yearlyTask.isFetched,
      );

  TaskOutputConverter._();
}
