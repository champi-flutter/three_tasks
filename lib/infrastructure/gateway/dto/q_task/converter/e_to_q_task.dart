import 'package:data_converter/data_converter.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

/// [QTask] への変換器
class EToQTask {
  static QTask toQTask(ETask task)  {
    return switch (task) {
      EDailyTask() => toQDailyTask(task),
      EWeeklyTask() => toQWeeklyTask(task),
      EMonthlyTask() => toQMonthlyTask(task),
      EYearlyTask() => toQYearlyTask(task),
    };
  }

  /// [QDailyTask] へ変換
  static QDailyTask toQDailyTask(EDailyTask dailyTask) {
    return QDailyTask(
      id: dailyTask.id,
      title: dailyTask.title,
      isChecked: dailyTask.isChecked,
      labelId: dailyTask.labelId,
      dateInt: dailyTask.date.toIntIdentifier(),
      review: dailyTask.review,
    );
  }

  static QWeeklyTask toQWeeklyTask(EWeeklyTask weeklyTask) {
    return QWeeklyTask(
      id: weeklyTask.id,
      title: weeklyTask.title,
      isChecked: weeklyTask.isChecked,
      labelId: weeklyTask.labelId,
      firstDateInt: weeklyTask.week.firstDateOfWeek.toIntIdentifier(),
      review: weeklyTask.review,
    );
  }

  static QMonthlyTask toQMonthlyTask(EMonthlyTask monthlyTask) {
    return QMonthlyTask(
      id: monthlyTask.id,
      title: monthlyTask.title,
      isChecked: monthlyTask.isChecked,
      labelId: monthlyTask.labelId,
      monthInt: monthlyTask.month.toIntIdentifier(),
      review: monthlyTask.review,
    );
  }

  static QYearlyTask toQYearlyTask(EYearlyTask yearlyTask) {
    return QYearlyTask(
      id: yearlyTask.id,
      title: yearlyTask.title,
      isChecked: yearlyTask.isChecked,
      labelId: yearlyTask.labelId,
      year: yearlyTask.year,
      review: yearlyTask.review,
    );
  }

  // /// [TaskUpdateParameter] から [ETask] に変換する
  // static QTask newQTask<Updater extends BaseTaskUpdater>(Updater updater) {
  //   // updater が持つ TaskBase を QTask に変換する
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
