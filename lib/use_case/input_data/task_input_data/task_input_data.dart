


import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';

/// タスクリストの InputData
class TaskInputData extends FixedListSnapshot<ITask, TaskList<ITask>>{

  TaskInputData(TaskList<ITask> inputTaskList): super(inputTaskList,
    elementBuilder: _buildITaskCopy, // ITask は不変
  );

  /// コピー生成関数
  static ITask _buildITaskCopy(ITask iTask) => iTask;

  @override
  TaskList<ITask> toOriginal() => TaskList.callDeepCopy(entryList, _buildITaskCopy);
}

/// 週タスクリストの InputData
class WeeklyTaskInputData extends FixedListSnapshot<IWeeklyTask, TaskList<IWeeklyTask>>{

  WeeklyTaskInputData(TaskList<IWeeklyTask> inputTaskList): super(inputTaskList,
    elementBuilder: _buildITaskCopy, // ITask は不変
  );

  /// コピー生成関数
  static IWeeklyTask _buildITaskCopy(IWeeklyTask iTask) => iTask;

  @override
  TaskList<IWeeklyTask> toOriginal() => TaskList.callDeepCopy(entryList, _buildITaskCopy);
}