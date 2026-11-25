import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_data/i_task/converter/i_to_e_task.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';

class WeeklyTaskListTypeConverter {
  // static TaskList<EWeeklyTask> toTaskList(
  //   WeeklyTaskList<EWeeklyTask> weeklyTaskList,
  // ) {}

  /// エンティティの `TaskList<EWeeklyTask>` から placeholder2 を省いて
  /// [WeeklyTaskList] に変換する
  static WeeklyTaskList<EWeeklyTask> removePlaceholder2(
    TaskList<EWeeklyTask> taskList,
  ) {
    // InputData の固定長リストを可変長のエンティティリストに変換する
    final List<EWeeklyTask> variableETaskList = taskList.toValueList(
      growable: true,
    );
    // placeholder2 のままでいるタスクを省く（エンティティのロジック）
    variableETaskList.removeWhere(
      (eTask) => eTask.willRemainPlaceholder2,
    );
    // 固定長に変換する
    return WeeklyTaskList(variableETaskList);
  }

  WeeklyTaskListTypeConverter._();
}
