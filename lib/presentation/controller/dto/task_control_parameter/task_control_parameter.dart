import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/task_base/base_task_updater.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';

part 'task_control_parameter.freezed.dart';

/// タスク更新用
@freezed
abstract class TaskControlParameter with BaseTaskUpdater, _$TaskControlParameter{
  const TaskControlParameter._();

  const factory TaskControlParameter({
    required VTask taskOrigin,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) = _TaskControlParameter;
}

@freezed
abstract class WeeklyTaskControlParameter with BaseTaskUpdater, _$WeeklyTaskControlParameter{
  const WeeklyTaskControlParameter._();

  const factory WeeklyTaskControlParameter({
    required VWeeklyTask taskOrigin,
    Date? newStart,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) = _WeeklyTaskControlParameter;

  //
  // /// [TaskUpdateParameter] に変換
  // TaskControlParameter generalize() =>
  //     TaskControlParameter(
  //       targetTask: targetTask,
  //       newTitle: newTitle,
  //       newChecked: newChecked,
  //       newLabelId: newLabelId,
  //     );
}

