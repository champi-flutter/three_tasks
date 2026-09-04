import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';

part 'task_update_parameter.freezed.dart';

@freezed
abstract class TaskUpdateParameter with _$TaskUpdateParameter {
  const TaskUpdateParameter._();

  const factory TaskUpdateParameter({
    required ETask targetTask,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) = _TaskUpdateParameter;
}

@freezed
abstract class WeeklyTaskUpdateParameter with _$WeeklyTaskUpdateParameter {
  const WeeklyTaskUpdateParameter._();

  const factory WeeklyTaskUpdateParameter({
    required EWeeklyTask targetTask,
    Date? newStart,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) = _WeeklyTaskUpdateParameter;

  /// [TaskUpdateParameter] に変換
  TaskUpdateParameter generalize() => TaskUpdateParameter(
        targetTask: targetTask,
        newTitle: newTitle,
        newChecked: newChecked,
        newLabelId: newLabelId,
      );
}

extension PrameterChangesSpecificToWeeklyTasks on List<WeeklyTaskUpdateParameter> {
  /// 指定したインデックスの [targetTask] を [VWeeklyTask.copyWith] で更新する
  List<WeeklyTaskUpdateParameter> Function({
  String? title,
  UniqueWeek? week,
  int? id,
  bool? isChecked,
  int? labelId,
  }) copyVTaskWith(int index) {
    // 「List<WeeklyTaskUpdateParameter> を返す関数」を返す
    return ({
      // VTask の各プロパティは non-nullable なので、null = 未指定
      String? title,
      UniqueWeek? week,
      int? id,
      bool? isChecked,
      int? labelId,
    }) {
      final current = this[index];
      final updatedVTask = current.targetTask.copyWith(
        title: title ?? current.targetTask.title,
        week: week ?? current.targetTask.week,
        id: id ?? current.targetTask.id,
        isChecked: isChecked ?? current.targetTask.isChecked,
        labelId: labelId ?? current.targetTask.labelId,
      );

      final newList = [...this];
      newList[index] = current.copyWith(targetTask: updatedVTask);
      return newList;
    };
  }
}
