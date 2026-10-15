
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';

/// 月単位タスクの監視を反映させるポート
abstract class MonthlyTasksPresenter {
  /// 更新を反映させる
  Future<void> handleMonthlyTasksUpdating(Map<Month, TaskList<EMonthlyTask>> newDataMap);
}