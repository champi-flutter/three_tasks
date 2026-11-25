import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/use_case/output_data/o_task/o_task.dart';

/// 日単位タスクの OutputData
class DailyTaskOutputData
    extends ObjectMapSnapshot<Date, TaskList<ODailyTask>> {
  DailyTaskOutputData(Map<Date, TaskList<ODailyTask>> data)
      : super(
          data,
          (oTaskList) => TaskList<ODailyTask>.callDeepCopy(
            oTaskList.toEntryList(),
            (oTask) => oTask.copyWith(),
          ),
        );

  Map<Date, TaskList<ODailyTask>> read() => toMutable();

  @protected
  @override
  Map<Date, TaskList<ODailyTask>> toMutable() => super.toMutable();
}
