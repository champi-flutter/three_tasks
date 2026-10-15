// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:three_tasks/domain/entity/e_task/converter/to_e_task.dart';
// import 'package:three_tasks/domain/entity/e_task/e_task.dart';
// import 'package:three_tasks/infrastructure/gateway/dto/f_task/f_task.dart';
// import 'package:three_tasks/infrastructure/gateway/dto/q_task/converter/q_to_e_task.dart';
// import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';
//
// extension EDailyTaskDataEntry<QTaskType extends QTask> on List<QTaskType> {
//   /// [FDailyTask] のリストを [EDailyTask] の [DataEntry] に変換するメソッド
//   DataEntry<int, ETask> toDataEntry(int index) {
//     final qTask = this[index];
//     return switch (qTask) {
//       QDailyTask() => DataEntry<int, EDailyTask>(
//           id: qTask.id,
//           value: QToETask.toEDailyTask(qTask),
//         ),
//       QWeeklyTask() => DataEntry<int, EWeeklyTask>(
//         id: qTask.id,
//         value: QToETask.toEWeeklyTask(qTask),
//       ),
//       QMonthlyTask() => DataEntry<int, EMonthlyTask>(
//         id: qTask.id,
//         value: QToETask.toEMonthlyTask(qTask),
//       ),
//       QYearlyTask() => DataEntry<int, EYearlyTask>(
//         id: qTask.id,
//         value: QToETask.toEYearlyTask(qTask),
//       ),
//     };
//   }
// }
