// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:three_tasks/data_foundation/task_base/base_task_updater.dart';
// import 'package:three_tasks/entities/e_task/e_task.dart';
// import 'package:three_tasks/enum/task_recurrence.dart';
//
// part 'task_update_parameter.freezed.dart';
//
// /// 保存が必要なタスクの変更を示すパラメータ
// @freezed
// abstract class TaskUpdateParameter
//     with _$TaskUpdateParameter, BaseTaskUpdater<ETask> {
//   const TaskUpdateParameter._();
//
//   const factory TaskUpdateParameter({
//     required ETask taskOrigin,
//     String? newTitle,
//     bool? newChecked,
//     int? newLabelId,
//   }) = _TaskUpdateParameter;
// }
//
// /// 週タスク特有の変更に対応したパラメータ
// @freezed
// abstract class WeeklyTaskUpdateParameter with _$WeeklyTaskUpdateParameter, BaseTaskUpdater{
//   const WeeklyTaskUpdateParameter._();
//
//   const factory WeeklyTaskUpdateParameter({
//     required EWeeklyTask taskOrigin,
//     Date? newStart,
//     String? newTitle,
//     bool? newChecked,
//     int? newLabelId,
//   }) = _WeeklyTaskUpdateParameter;
//
//   /// [TaskUpdateParameter] に変換
//   TaskUpdateParameter generalize() =>
//       TaskUpdateParameter(
//         taskOrigin: taskOrigin,
//         newTitle: newTitle,
//         newChecked: newChecked,
//         newLabelId: newLabelId,
//       );
// }
//
// // region copyWith の重ねがけ
// // extension PrameterChangesSpecificToWeeklyTasks
// //     on List<WeeklyTaskUpdateParameter> {
// //   /// 指定したインデックスの [targetTask] を [VWeeklyTask.copyWith] で更新する
// //   List<WeeklyTaskUpdateParameter> Function({
// //     String? title,
// //     UniqueWeek? week,
// //     int? id,
// //     bool? isChecked,
// //     int? labelId,
// //   }) copyVTaskWith(int index) {
// //     // 「List<WeeklyTaskUpdateParameter> を返す関数」を返す
// //     return ({
// //       // VTask の各プロパティは non-nullable なので、null = 未指定
// //       String? title,
// //       UniqueWeek? week,
// //       int? id,
// //       bool? isChecked,
// //       int? labelId,
// //     }) {
// //       final current = this[index];
// //       final updatedVTask = current.targetTask.copyWith(
// //         title: title ?? current.targetTask.title,
// //         week: week ?? current.targetTask.week,
// //         id: id ?? current.targetTask.id,
// //         isChecked: isChecked ?? current.targetTask.isChecked,
// //         labelId: labelId ?? current.targetTask.labelId,
// //       );
// //
// //       final newList = [...this];
// //       newList[index] = current.copyWith(targetTask: updatedVTask);
// //       return newList;
// //     };
// //   }
// // }
// // endregion
