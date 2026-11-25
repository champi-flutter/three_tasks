import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_data/o_task/o_task.dart';

/// [VTask] への変換器
class OToVTask {
  static VDailyTask toVDailyTask(
      ODailyTask dailyTask,
  ) =>
      VDailyTask(
        id: dailyTask.id,
        title: dailyTask.title,
        isChecked: dailyTask.isChecked,
        labelId: dailyTask.labelId,
        review: dailyTask.review,
        date: dailyTask.date,
        isFetched: dailyTask.isFetched,
      );

  static VWeeklyTask toVWeeklyTask(
      OWeeklyTask weeklyTask,
  ) =>
      VWeeklyTask(
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

  static VMonthlyTask toVMonthlyTask(EMonthlyTask monthlyTask) => VMonthlyTask(
        id: monthlyTask.id,
        title: monthlyTask.title,
        isChecked: monthlyTask.isChecked,
        labelId: monthlyTask.labelId,
        review: monthlyTask.review,
        month: monthlyTask.month,
        isFetched: monthlyTask.isFetched,
      );

  static VYearlyTask toVYearlyTask(EYearlyTask yearlyTask) => VYearlyTask(
        id: yearlyTask.id,
        title: yearlyTask.title,
        isChecked: yearlyTask.isChecked,
        labelId: yearlyTask.labelId,
        review: yearlyTask.review,
        year: yearlyTask.year,
        isFetched: yearlyTask.isFetched,
      );
}

