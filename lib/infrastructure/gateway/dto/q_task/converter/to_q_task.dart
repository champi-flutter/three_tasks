import 'package:data_converter/data_converter.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

/// [QTask] への変換器
class ToQTask {
  static QTask toQTask<Task extends TaskBase>(
      Task task,
      ) {
    final title = task.title;
    final isChecked = task.isChecked;
    final labelId = task.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return switch (task) {
        DailyTaskBase() => toQDailyTask(task),
        WeeklyTaskBase() => toQWeeklyTask(task),
        MonthlyTaskBase() => toQMonthlyTask(task),
        YearlyTaskBase() => toQYearlyTask(task),
        TaskBase() => throw Exception(
          "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${task.runtimeType}）\n[ToQTask.toQTask]",
        ),
      };
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${task.runtimeType}）\n[ToQTask.toQTask]",
      );
    }
  }

  /// [QDailyTask] へ変換
  static QDailyTask toQDailyTask<DailyTask extends DailyTaskBase>(
      DailyTask dailyTask,
      ) {
    final title = dailyTask.title;
    final isChecked = dailyTask.isChecked;
    final labelId = dailyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return QDailyTask(
        id: dailyTask.id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        dateInt: dailyTask.date.toIntIdentifier(),
      );
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${dailyTask.runtimeType}）\n[ToQTask.toQDailyTask]",
      );
    }
  }

  static QWeeklyTask toQWeeklyTask<WeeklyTask extends WeeklyTaskBase>(
      WeeklyTask weeklyTask,
      ) {
    final title = weeklyTask.title;
    final isChecked = weeklyTask.isChecked;
    final labelId = weeklyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return QWeeklyTask(
        id: weeklyTask.id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        firstDateInt: weeklyTask.week.firstDateOfWeek.toIntIdentifier(),
      );
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${weeklyTask.runtimeType}）\n[ToQTask.toQWeeklyTask]",
      );
    }
  }

  static QMonthlyTask toQMonthlyTask<MonthlyTask extends MonthlyTaskBase>(
      MonthlyTask monthlyTask) {
    final title = monthlyTask.title;
    final isChecked = monthlyTask.isChecked;
    final labelId = monthlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return QMonthlyTask(
        id: monthlyTask.id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        // todo data_converter に Month.toIntIdentifier を実装（2026/09/11）＞＞
        monthInt: monthlyTask.month.toIntIdentifier(),
      );
    }
    // null のパラメータを含む場合は例外を投げる
    else {
      throw Exception(
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${monthlyTask.runtimeType}）\n[ToQTask.toQMonthlyTask]",
      );
    }
  }

  static QYearlyTask toQYearlyTask<YearlyTask extends YearlyTaskBase>(
      YearlyTask yearlyTask) {
    final title = yearlyTask.title;
    final isChecked = yearlyTask.isChecked;
    final labelId = yearlyTask.labelId;
    if (title != null && isChecked != null && labelId != null) {
      return QYearlyTask(
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
        "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${yearlyTask.runtimeType}）\n[ToQTask.toQYearlyTask]",
      );
    }
  }

  // /// [TaskUpdateParameter] から [ETask] に変換する
  // static QTask newQTask<Updater extends BaseTaskUpdater>(Updater updater) {
  //   // updater が持つ TaskBase を ETask に変換する
  //   final QTask targetQTask = ToQTask(updater.taskOrigin);
  //   return switch (targetQTask) {
  //     QDailyTask() => targetQTask.copyWith(
  //       title: updater.newTitle?? targetETask.title,
  //       isChecked: updater.newChecked?? targetETask.isChecked,
  //       labelId: updater.newLabelId?? targetETask.labelId,
  //     ),
  //     QWeeklyTask() => targetETask.copyWith(
  //       title: updater.newTitle?? targetETask.title,
  //       isChecked: updater.newChecked?? targetETask.isChecked,
  //       labelId: updater.newLabelId?? targetETask.labelId,
  //     ),
  //     QMonthlyTask() => targetETask.copyWith(
  //       title: updater.newTitle?? targetETask.title,
  //       isChecked: updater.newChecked?? targetETask.isChecked,
  //       labelId: updater.newLabelId?? targetETask.labelId,
  //     ),
  //     QYearlyTask() => targetETask.copyWith(
  //       title: updater.newTitle?? targetETask.title,
  //       isChecked: updater.newChecked?? targetETask.isChecked,
  //       labelId: updater.newLabelId?? targetETask.labelId,
  //     ),
  //   };
  // }
}
