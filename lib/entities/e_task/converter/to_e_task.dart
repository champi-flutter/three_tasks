import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';

/// [ETask] への変換器
class ToETask {
  static EDailyTask toEDailyTask<DailyTask extends DailyTaskBase>(
      DailyTask dailyTask,
      )
  {
    final title = dailyTask.title;
    final isChecked = dailyTask.isChecked;
    final labelId = dailyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return EDailyTask(
        id: dailyTask.id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        date: dailyTask.date,
      );
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${dailyTask.runtimeType}）\n[ToETask.toEDailyTask]",
      );
    }
  }

  static EWeeklyTask toEWeeklyTask<WeeklyTask extends WeeklyTaskBase>(
      WeeklyTask weeklyTask) {
    final title = weeklyTask.title;
    final isChecked = weeklyTask.isChecked;
    final labelId = weeklyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return EWeeklyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${weeklyTask.runtimeType}）\n[ToETask.toEWeeklyTask]",
      );
    }
  }

  static EMonthlyTask toEMonthlyTask<MonthlyTask extends MonthlyTaskBase>(
      MonthlyTask monthlyTask)
  {
    final title = monthlyTask.title;
    final isChecked = monthlyTask.isChecked;
    final labelId = monthlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return EMonthlyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${monthlyTask.runtimeType}）\n[ToETask.toEMonthlyTask]",
      );
    }
  }


  static EYearlyTask toEYearlyTask<YearlyTask extends YearlyTaskBase>(
      YearlyTask yearlyTask) {
    final title = yearlyTask.title;
    final isChecked = yearlyTask.isChecked;
    final labelId = yearlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return EYearlyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${yearlyTask.runtimeType}）\n[ToETask.toEYearlyTask]",
      );
    }
  }

}
