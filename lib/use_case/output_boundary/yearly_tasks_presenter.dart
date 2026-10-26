
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';

/// 年単位タスクの監視を反映させるポート
abstract class YearlyTasksPresenter {
  /// 更新を反映させる
  Future<void> handleYearlyTasksUpdating(Map<int, TaskList<EYearlyTask>> newDataMap);
}