
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';

/// 週単位タスクの監視を反映させるポート
abstract class WeeklyTasksPresenter {
  /// 更新を反映させる
  void handleWeeklyTasksUpdating(Map<UniqueWeek, VWeeklyTask> newDataMap);
}