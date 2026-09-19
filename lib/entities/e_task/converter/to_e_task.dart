import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/base_task_updater.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_parameter/task_update_parameter/task_update_parameter.dart';

/// [ETask] への変換器
abstract class ToETask<Task extends TaskBase> {
  ETask toETask(
    Task task,
  );

  /// [EDailyTask] へ変換
  EDailyTask toEDailyTask(
    Task dailyTask,
  );

  EWeeklyTask toEWeeklyTask(
    Task weeklyTask,
  );

  EMonthlyTask toEMonthlyTask(Task monthlyTask);

  EYearlyTask toEYearlyTask(Task yearlyTask);
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


// class ToETask {
//   static ETask toETask<Task extends TaskBase>(
//       Task task,
//       ) {
//     final title = task.title;
//     final isChecked = task.isChecked;
//     final labelId = task.labelId;
//     if (title != null && isChecked != null && labelId != null) {
//       return switch (task) {
//         DailyTaskBase() => toEDailyTask(task),
//         WeeklyTaskBase() => toEWeeklyTask(task),
//         MonthlyTaskBase() => toEMonthlyTask(task),
//         YearlyTaskBase() => toEYearlyTask(task),
//         TaskBase() => throw Exception(
//           "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${task.runtimeType}）\n[ToETask.toETask]",
//         ),
//       };
//     }
//     // null のパラメータを含む場合は例外を投げる
//     else {
//       throw Exception(
//         "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${task.runtimeType}）\n[ToETask.toETask]",
//       );
//     }
//   }
//
//   /// [EDailyTask] へ変換
//   static EDailyTask toEDailyTask<DailyTask extends DailyTaskBase>(
//       DailyTask dailyTask,
//       ) {
//     final title = dailyTask.title;
//     final isChecked = dailyTask.isChecked;
//     final labelId = dailyTask.labelId;
//     if (title != null && isChecked != null && labelId != null) {
//       return EDailyTask(
//         id: dailyTask.id,
//         title: title,
//         isChecked: isChecked,
//         labelId: labelId,
//         date: dailyTask.date,
//       );
//     }
//     // null のパラメータを含む場合は例外を投げる
//     else {
//       throw Exception(
//         "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${dailyTask.runtimeType}）\n[ToETask.toEDailyTask]",
//       );
//     }
//   }
//
//   static EWeeklyTask toEWeeklyTask<WeeklyTask extends WeeklyTaskBase>(
//       WeeklyTask weeklyTask,
//       ) {
//     final title = weeklyTask.title;
//     final isChecked = weeklyTask.isChecked;
//     final labelId = weeklyTask.labelId;
//     if (title != null && isChecked != null && labelId != null) {
//       return EWeeklyTask(
//         id: weeklyTask.id,
//         title: title,
//         isChecked: isChecked,
//         labelId: labelId,
//         week: weeklyTask.week,
//       );
//     }
//     // null のパラメータを含む場合は例外を投げる
//     else {
//       throw Exception(
//         "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${weeklyTask.runtimeType}）\n[ToETask.toEWeeklyTask]",
//       );
//     }
//   }
//
//   static EMonthlyTask toEMonthlyTask<MonthlyTask extends MonthlyTaskBase>(
//       MonthlyTask monthlyTask) {
//     final title = monthlyTask.title;
//     final isChecked = monthlyTask.isChecked;
//     final labelId = monthlyTask.labelId;
//     if (title != null && isChecked != null && labelId != null) {
//       return EMonthlyTask(
//         id: monthlyTask.id,
//         title: title,
//         isChecked: isChecked,
//         labelId: labelId,
//         month: monthlyTask.month,
//       );
//     }
//     // null のパラメータを含む場合は例外を投げる
//     else {
//       throw Exception(
//         "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${monthlyTask.runtimeType}）\n[ToETask.toEMonthlyTask]",
//       );
//     }
//   }
//
//   static EYearlyTask toEYearlyTask<YearlyTask extends YearlyTaskBase>(
//       YearlyTask yearlyTask) {
//     final title = yearlyTask.title;
//     final isChecked = yearlyTask.isChecked;
//     final labelId = yearlyTask.labelId;
//     if (title != null && isChecked != null && labelId != null) {
//       return EYearlyTask(
//         id: yearlyTask.id,
//         title: title,
//         isChecked: isChecked,
//         labelId: labelId,
//         year: yearlyTask.year,
//       );
//     }
//     // null のパラメータを含む場合は例外を投げる
//     else {
//       throw Exception(
//         "ARGUMENT_ERROR: このクラスは ETask に変換できません。（${yearlyTask.runtimeType}）\n[ToETask.toEYearlyTask]",
//       );
//     }
//   }
// //
// // /// [TaskUpdateParameter] から [ETask] に変換する
// // static ETask newETask(TaskUpdateParameter updater) {
// //   final ETask targetETask = updater.taskOrigin;
// //   return switch (targetETask) {
// //   EDailyTask() => targetETask.copyWith(
// //     title: updater.newTitle?? targetETask.title,
// //     isChecked: updater.newChecked?? targetETask.isChecked,
// //     labelId: updater.newLabelId?? targetETask.labelId,
// //   ),
// //     EWeeklyTask() => targetETask.copyWith(
// //       title: updater.newTitle?? targetETask.title,
// //       isChecked: updater.newChecked?? targetETask.isChecked,
// //       labelId: updater.newLabelId?? targetETask.labelId,
// //     ),
// //     EMonthlyTask() => targetETask.copyWith(
// //       title: updater.newTitle?? targetETask.title,
// //       isChecked: updater.newChecked?? targetETask.isChecked,
// //       labelId: updater.newLabelId?? targetETask.labelId,
// //     ),
// //     EYearlyTask() => targetETask.copyWith(
// //       title: updater.newTitle?? targetETask.title,
// //       isChecked: updater.newChecked?? targetETask.isChecked,
// //       labelId: updater.newLabelId?? targetETask.labelId,
// //     ),
// //   };
// // }
// }
