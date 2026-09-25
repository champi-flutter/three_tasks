import 'package:custom_core_types/custom_core_types.dart';

/// タスク制御用 DTO
class TaskControlParameter {
  const TaskControlParameter({
    this.newTitle,
    this.newChecked,
    this.newLabelId,
  });

  /// タスクタイトル
  final String? newTitle;

  /// チェックされているかどうか
  final bool? newChecked;

  /// 登録されているラベルの ID
  ///
  /// ラベル未登録の状態を null => -1 に変更
  final int? newLabelId;
}

class WeeklyTaskControlParameter extends TaskControlParameter {
  WeeklyTaskControlParameter({
    super.newTitle,
    super.newChecked,
    super.newLabelId,
    this.newStart,
  });

  Date? newStart;
}

// part 'task_control_parameter.freezed.dart';

// /// タスク更新用
// @freezed
// abstract class TaskControlParameter
//     with BaseTaskUpdater, _$TaskControlParameter {
//   const TaskControlParameter._();
//
//   const factory TaskControlParameter({
//     required ListEntry<VTask> taskEntry,
//     String? newTitle,
//     bool? newChecked,
//     int? newLabelId,
//   }) = _TaskControlParameter;
// }
//
// class TaskControlParameterList extends FixedList<TaskControlParameter> {
//   TaskControlParameterList(
//     TaskControlParameter on0,
//     TaskControlParameter on1,
//     TaskControlParameter on2,
//   ) : super.fill(
//           3,
//           (i) => switch (i) {
//             0 => on0,
//             1 => on1,
//             2 => on2,
//             // length を 3 で指定しているため例外はないが、網羅性のために記載
//             _ =>
//               throw RangeError('[TaskControlParameterList] インデックス $i は範囲外です。'),
//           },
//         );
//
//   TaskControlParameterList.fromPosition(
//     TaskList<VTask> state,
//     int position,
//     TaskControlParameter parameter,
//   ) : super.fill(
//           3,
//           (i) => (i == position)
//               ? parameter
//               : TaskControlParameter(taskEntry: state[i]),
//         );
//
//   /// [Iterable] から [TaskList] を生成するコンストラクタ
//   TaskControlParameterList.fromIterable(Iterable<TaskControlParameter> iterable)
//       : assert(
//           iterable.length == 3,
//           "[TaskControlParameterList.fromIterable] 要素数が不適当です",
//         ),
//         super.fromIterable(
//           3,
//           iterable,
//         );
//
//   @override
//   // TODO: implement deepCopy
//   FixedList<TaskControlParameter> get deepCopy => throw UnimplementedError();
// }
//
// // /// タスク更新用
// // @freezed
// // abstract class TaskStateUpdater with _$TaskStateUpdater {
// //   const TaskStateUpdater._();
// //
// //   const factory TaskStateUpdater({
// //     required TaskControlParameterList parameterList,
// //   }) = _TaskStateUpdater;
// // }
//
// @freezed
// abstract class WeeklyTaskControlParameter
//     with BaseTaskUpdater, _$WeeklyTaskControlParameter {
//   const WeeklyTaskControlParameter._();
//
//   const factory WeeklyTaskControlParameter({
//     required VWeeklyTask taskOrigin,
//     Date? newStart,
//     String? newTitle,
//     bool? newChecked,
//     int? newLabelId,
//   }) = _WeeklyTaskControlParameter;
//
// //
// // /// [TaskUpdateParameter] に変換
// // TaskControlParameter generalize() =>
// //     TaskControlParameter(
// //       targetTask: targetTask,
// //       newTitle: newTitle,
// //       newChecked: newChecked,
// //       newLabelId: newLabelId,
// //     );
// }
