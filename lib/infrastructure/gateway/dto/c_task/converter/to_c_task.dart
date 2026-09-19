
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';

class ToCTask {
  static CTask toCTask<Task extends TaskBase>(
      Task task,
      ) {
    final title = task.title;
    final isChecked = task.isChecked;
    final labelId = task.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return switch (task) {
        DailyTaskBase() => toCDailyTask(task),
        WeeklyTaskBase() => toCWeeklyTask(task),
        MonthlyTaskBase() => toCMonthlyTask(task),
        YearlyTaskBase() => toCYearlyTask(task),
        TaskBase() => throw Exception(
          "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${task.runtimeType}）\n[ToCTask.toCTask]",
        ),
      };
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${task.runtimeType}）\n[ToCTask.toCTask]",
      );
    }
  }

  /// [CDailyTask] へ変換
  static CDailyTask toCDailyTask<DailyTask extends DailyTaskBase>(
      DailyTask dailyTask,
      ) {
    final title = dailyTask.title;
    final isChecked = dailyTask.isChecked;
    final labelId = dailyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return CDailyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${dailyTask.runtimeType}）\n[ToCTask.toCDailyTask]",
      );
    }
  }

  static CWeeklyTask toCWeeklyTask<WeeklyTask extends WeeklyTaskBase>(
      WeeklyTask weeklyTask,
      ) {
    final title = weeklyTask.title;
    final isChecked = weeklyTask.isChecked;
    final labelId = weeklyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return CWeeklyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${weeklyTask.runtimeType}）\n[ToCTask.toCWeeklyTask]",
      );
    }
  }

  static CMonthlyTask toCMonthlyTask<MonthlyTask extends MonthlyTaskBase>(
      MonthlyTask monthlyTask) {
    final title = monthlyTask.title;
    final isChecked = monthlyTask.isChecked;
    final labelId = monthlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return CMonthlyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${monthlyTask.runtimeType}）\n[ToCTask.toCMonthlyTask]",
      );
    }
  }

  static CYearlyTask toCYearlyTask<YearlyTask extends YearlyTaskBase>(
      YearlyTask yearlyTask) {
    final title = yearlyTask.title;
    final isChecked = yearlyTask.isChecked;
    final labelId = yearlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return CYearlyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${yearlyTask.runtimeType}）\n[ToCTask.toCYearlyTask]",
      );
    }
  }
}