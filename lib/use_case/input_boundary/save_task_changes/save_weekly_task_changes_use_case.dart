import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';

// /// タスクごとの変更パラメータを表す型定義
// typedef WeeklyTaskUpdateParameter = ({
//   VWeeklyTask targetVTask,
//   bool startsToday,
//   String? newTitle,
//   bool? newChecked,
//   int? newLabelId,
// });

/// 週単位タスク変更保存フロー
abstract class SaveWeeklyTaskChangesUseCase {
  Future<void> execute({
    required WeeklyTaskList<EWeeklyTask> updatingETaskList,
  });
}
