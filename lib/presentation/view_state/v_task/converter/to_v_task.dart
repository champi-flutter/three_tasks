import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';

/// [VTask] への変換器
class EToVTask {
  static VDailyTask toVDailyTask(
    EDailyTask dailyTask,
  ) =>
      VDailyTask(
        id: dailyTask.id,
        title: dailyTask.title,
        isChecked: dailyTask.isChecked,
        labelId: dailyTask.labelId,
        date: dailyTask.date,
        isFetched: dailyTask.isFetched,
      );

  static VWeeklyTask toVWeeklyTask<WeeklyTask extends WeeklyTaskBase>(
      WeeklyTask weeklyTask) {
    final title = weeklyTask.title;
    final isChecked = weeklyTask.isChecked;
    final labelId = weeklyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return VWeeklyTask(
        id: weeklyTask.id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        week: weeklyTask.week,
      );
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは VTask に変換できません。（${weeklyTask.runtimeType}）\n[ToVTask.toVWeeklyTask]",
      );
    }
  }

  static VMonthlyTask toVMonthlyTask<MonthlyTask extends MonthlyTaskBase>(
      MonthlyTask monthlyTask) {
    final title = monthlyTask.title;
    final isChecked = monthlyTask.isChecked;
    final labelId = monthlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return VMonthlyTask(
        id: monthlyTask.id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        month: monthlyTask.month,
      );
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは VTask に変換できません。（${monthlyTask.runtimeType}）\n[ToVTask.toVMonthlyTask]",
      );
    }
  }

  static VYearlyTask toVYearlyTask<YearlyTask extends YearlyTaskBase>(
      YearlyTask yearlyTask) {
    final title = yearlyTask.title;
    final isChecked = yearlyTask.isChecked;
    final labelId = yearlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return VYearlyTask(
        id: yearlyTask.id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        year: yearlyTask.year,
      );
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは VTask に変換できません。（${yearlyTask.runtimeType}）\n[ToVTask.toVYearlyTask]",
      );
    }
  }
}

// extension VTaskCaster on List<VTask>{
//   List<P> pass<P extends VTask>()=>cast<P>();
// }
