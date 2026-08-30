import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';

part 'task_update_parameter.freezed.dart';

@freezed
abstract class TaskUpdateParameter with _$TaskUpdateParameter {
  const TaskUpdateParameter._();

  const factory TaskUpdateParameter({
    required VTask targetVTask,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) = _TaskUpdateParameter;
}

@freezed
abstract class WeeklyTaskUpdateParameter with _$WeeklyTaskUpdateParameter {
  const WeeklyTaskUpdateParameter._();

  const factory WeeklyTaskUpdateParameter({
    required VWeeklyTask targetVTask,
    Date? newStart,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) = _WeeklyTaskUpdateParameter;

  /// [TaskUpdateParameter] に変換
  TaskUpdateParameter generalize() => TaskUpdateParameter(
        targetVTask: targetVTask,
        newTitle: newTitle,
        newChecked: newChecked,
        newLabelId: newLabelId,
      );
}

extension PrameterChangesSpecificToWeeklyTasks on List<WeeklyTaskUpdateParameter> {
  /// 指定したインデックスの [targetVTask] を [VWeeklyTask.copyWith] で更新する
  List<WeeklyTaskUpdateParameter> Function({
  String? task,
  UniqueWeek? week,
  int? id,
  bool? isChecked,
  int? labelId,
  }) copyVTaskWith(int index) {
    // 「List<WeeklyTaskUpdateParameter> を返す関数」を返す
    return ({
      // VTask の各プロパティは non-nullable なので、null = 未指定
      String? task,
      UniqueWeek? week,
      int? id,
      bool? isChecked,
      int? labelId,
    }) {
      final current = this[index];
      final updatedVTask = current.targetVTask.copyWith(
        task: task ?? current.targetVTask.task,
        week: week ?? current.targetVTask.week,
        id: id ?? current.targetVTask.id,
        isChecked: isChecked ?? current.targetVTask.isChecked,
        labelId: labelId ?? current.targetVTask.labelId,
      );

      final newList = [...this];
      newList[index] = current.copyWith(targetVTask: updatedVTask);
      return newList;
    };
  }
}
