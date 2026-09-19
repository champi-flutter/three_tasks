import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

/// [QTask] から値を取り出して [ETask] へ変換する
class QToETask {
  /// [QTask] から値を取り出して [ETask] へ変換する
  static ETask toETask(QTask task) {
    return switch (task) {
      QDailyTask() => toEDailyTask(task),
      QWeeklyTask() => toEWeeklyTask(task),
      QMonthlyTask() => toEMonthlyTask(task),
      QYearlyTask() => toEYearlyTask(task),
    };
  }

  /// [EDailyTask] へ変換
  static EDailyTask toEDailyTask(QDailyTask dailyTask) {
    // エンティティのプロパティの型に適合させる
    final Date adaptedDate = dailyTask.dateInt.toDate();
    return EDailyTask(
      id: dailyTask.id,
      title: dailyTask.title,
      isChecked: dailyTask.isChecked,
      labelId: dailyTask.labelId,
      date: adaptedDate,
    );
  }

  static EWeeklyTask toEWeeklyTask(QWeeklyTask weeklyTask) {
    // エンティティのプロパティの型に適合させる
    final Date firstDate = weeklyTask.firstDateInt.toDate();
    final UniqueWeek adaptedWeek = UniqueWeek.fromDate(
      currentDate: firstDate,
      firstDate: firstDate,
    );
    return EWeeklyTask(
      id: weeklyTask.id,
      title: weeklyTask.title,
      isChecked: weeklyTask.isChecked,
      labelId: weeklyTask.labelId,
      week: adaptedWeek,
    );
  }

  static EMonthlyTask toEMonthlyTask(QMonthlyTask monthlyTask) {
    // エンティティのプロパティの型に適合させる
    // todo data_converter に toMonth を実装（2026/09/11）＞＞
    final Month adaptedMonth = monthlyTask.monthInt.toMonth();
    return EMonthlyTask(
      id: monthlyTask.id,
      title: monthlyTask.title,
      isChecked: monthlyTask.isChecked,
      labelId: monthlyTask.labelId,
      month: adaptedMonth,
    );
  }

  static EYearlyTask toEYearlyTask(QYearlyTask yearlyTask) {
    return EYearlyTask(
      id: yearlyTask.id,
      title: yearlyTask.title,
      isChecked: yearlyTask.isChecked,
      labelId: yearlyTask.labelId,
      year: yearlyTask.year,
    );
  }
//
// /// [TaskUpdateParameter] から [ETask] に変換する
// static ETask newETask(TaskUpdateParameter updater) {
//   final ETask targetETask = updater.taskOrigin;
//   return switch (targetETask) {
//   EDailyTask() => targetETask.copyWith(
//     title: updater.newTitle?? targetETask.title,
//     isChecked: updater.newChecked?? targetETask.isChecked,
//     labelId: updater.newLabelId?? targetETask.labelId,
//   ),
//     EWeeklyTask() => targetETask.copyWith(
//       title: updater.newTitle?? targetETask.title,
//       isChecked: updater.newChecked?? targetETask.isChecked,
//       labelId: updater.newLabelId?? targetETask.labelId,
//     ),
//     EMonthlyTask() => targetETask.copyWith(
//       title: updater.newTitle?? targetETask.title,
//       isChecked: updater.newChecked?? targetETask.isChecked,
//       labelId: updater.newLabelId?? targetETask.labelId,
//     ),
//     EYearlyTask() => targetETask.copyWith(
//       title: updater.newTitle?? targetETask.title,
//       isChecked: updater.newChecked?? targetETask.isChecked,
//       labelId: updater.newLabelId?? targetETask.labelId,
//     ),
//   };
// }
}

