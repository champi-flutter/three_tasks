import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';

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
  Future<Result<void, Exception>> execute({
    required List<WeeklyTaskUpdateParameter> taskInfo,
  });
}
