//
// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:three_tasks/data_foundation/task_base/base_task_updater.dart';
// import 'package:three_tasks/data_foundation/task_base/task_list.dart';
// import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
// import 'package:three_tasks/entities/e_task/e_task.dart';
// import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
// import 'package:three_tasks/presentation/view_state/v_task/converter/v_to_e_task.dart';
// import 'package:three_tasks/view_models/controller/dto/task_control_parameter/task_control_parameter.dart';
//
// class SetNewETask {
//   /// [TaskUpdateParameter] から [ETask] に変換する
//   static TaskList<ETask> toETaskList(TaskControlParameterList updater) {
//     // updater が持つ TaskBase を ETask に変換する
//     final ETask targetETask = VToETask.toETask(updater.taskOrigin);
//     switch (targetETask) {
//       case EDailyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = updater.newTitle ?? targetETask.title;
//         targetETask.isChecked = updater.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = updater.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//       case EWeeklyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = updater.newTitle ?? targetETask.title;
//         targetETask.isChecked = updater.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = updater.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//       case EMonthlyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = updater.newTitle ?? targetETask.title;
//         targetETask.isChecked = updater.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = updater.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//       case EYearlyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = updater.newTitle ?? targetETask.title;
//         targetETask.isChecked = updater.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = updater.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//     }
//   }
//
//   /// [TaskUpdateParameter] から [ETask] に変換する
//   static ETask toETask(TaskControlParameter parameter) {
//     // updater が持つ TaskBase を ETask に変換する
//     final ETask targetETask = VToETask.toETask(parameter.taskEntry.value);
//     switch (targetETask) {
//       case EDailyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = parameter.newTitle ?? targetETask.title;
//         targetETask.isChecked = parameter.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = parameter.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//       case EWeeklyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = parameter.newTitle ?? targetETask.title;
//         targetETask.isChecked = parameter.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = parameter.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//       case EMonthlyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = parameter.newTitle ?? targetETask.title;
//         targetETask.isChecked = parameter.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = parameter.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//       case EYearlyTask():
//       // エンティティのプロパティの値を更新する
//         targetETask.title = parameter.newTitle ?? targetETask.title;
//         targetETask.isChecked = parameter.newChecked ?? targetETask.isChecked;
//         targetETask.labelId = parameter.newLabelId ?? targetETask.labelId;
//         // 各種別タスクの型で返す
//         return targetETask;
//     }
//   }
//
//   /// [TaskUpdateParameter] から [EWeeklyTask] に変換する
//   static EWeeklyTask toEWeeklyTask(WeeklyTaskControlParameter updater) {
//     // updater が持つ TaskBase を ETask に変換する
//     final EWeeklyTask targetETask = VToETask.toEWeeklyTask(updater.taskOrigin);
//     // エンティティのプロパティの値を更新する
//     targetETask.title = updater.newTitle ?? targetETask.title;
//     targetETask.isChecked = updater.newChecked ?? targetETask.isChecked;
//     targetETask.labelId = updater.newLabelId ?? targetETask.labelId;
//     final Date? newFirstDate = updater.newStart;
//     if(newFirstDate != null){
//       targetETask.week = UniqueWeek.fromDate(
//         currentDate: newFirstDate,
//         firstDate: newFirstDate,
//       );
//     }
//     // 各種別タスクの型で返す
//     return targetETask;
//   }
// }