import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/use_case/output_data/o_task/o_task.dart';

/// 週単位タスクの OutputData
class WeeklyTaskOutputData
    extends ObjectMapSnapshot<UniqueWeek, WeeklyTaskList<OWeeklyTask>> {
  WeeklyTaskOutputData(Map<UniqueWeek, WeeklyTaskList<OWeeklyTask>> data)
      : super(
            data,
            (oWeeklyTaskList) => WeeklyTaskList<OWeeklyTask>.callDeepCopy(
                oWeeklyTaskList.toEntryList(), (oTask) => oTask));

  Map<UniqueWeek, WeeklyTaskList<OWeeklyTask>> read() => toMutable();

  @protected
  @override
  Map<UniqueWeek, WeeklyTaskList<OWeeklyTask>> toMutable() => super.toMutable();
}
