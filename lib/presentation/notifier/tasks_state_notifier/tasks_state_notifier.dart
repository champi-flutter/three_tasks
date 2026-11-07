
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';

import 'package:custom_core_types/custom_core_types.dart';

/// ViewState を更新するインターフェース
///  - [K] : [update] を呼ぶ key
abstract class TasksStateNotifier<K, Task extends VTask> {
  void update(Map<K, TaskList<Task>> newData);
}

abstract class DailyTasksStateNotifier extends TasksStateNotifier<Date, VDailyTask>{}

abstract class WeeklyTasksStateNotifier{
  void update(Map<UniqueWeek, WeeklyTaskList<VWeeklyTask>> newData);
}

abstract class MonthlyTasksStateNotifier extends TasksStateNotifier<Month, VMonthlyTask>{}

abstract class YearlyTasksStateNotifier extends TasksStateNotifier<int, VYearlyTask>{}