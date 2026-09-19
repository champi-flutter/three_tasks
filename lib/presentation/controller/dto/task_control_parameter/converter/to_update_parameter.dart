// import 'package:three_tasks/use_case/input_parameter/task_update_parameter/task_update_parameter.dart';
// import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
//
// /// [TaskUpdateParameter] への変換器
// class ToTaskUpdateParameter {
//   /// [TaskControlParameter] から [TaskUpdateParameter] に変換するメソッド
//   static TaskUpdateParameter toUpdateParameter(
//     TaskControlParameter controlParameter,
//   )
//   // 折りたたみ用
//   {
//     return TaskUpdateParameter(
//       id: controlParameter.id,
//       rec: controlParameter.rec,
//       newTitle: controlParameter.newTitle,
//       newChecked: controlParameter.newChecked,
//       newLabelId: controlParameter.newLabelId,
//     );
//   }
//
//   /// [WeeklyTaskControlParameter] から [WeeklyTaskUpdateParameter] に変換するメソッド
//   static WeeklyTaskUpdateParameter toWeeklyUpdateParameter(
//       WeeklyTaskControlParameter controlParameter,
//       )
//   // 折りたたみ用
//   {
//     return WeeklyTaskUpdateParameter(
//       id: controlParameter.id,
//       newTitle: controlParameter.newTitle,
//       newChecked: controlParameter.newChecked,
//       newLabelId: controlParameter.newLabelId,
//     );
//   }
// }
//
// // class ToUpdateParameter {
// //   static TaskUpdateParameter toUpdateParameter<VTaskType extends VTask>(
// //       TaskControlParameter<VTaskType> controlParameter) {
// //     final VTask vTask = controlParameter.targetTask;
// //     final ETask convertedETask = switch(vTask){
// //       VDailyTask() => ToETask.toEDailyTask<VDailyTask>(vTask),
// //
// //     }
// //     return TaskUpdateParameter(
// //       // todo （2026/09/07）＞＞
// //       targetTask: convertedETask,
// //       newTitle:,
// //       newChecked:,
// //       newLabelId:,
// //     );
// //   }
// // }
