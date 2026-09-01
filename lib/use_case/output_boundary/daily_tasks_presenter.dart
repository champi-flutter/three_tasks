
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';

/// 日単位タスクの監視を反映させるポート
abstract class DailyTasksPresenter {
  /// 更新を反映させる
  Future<void> handleDailyTasksUpdating(Map<Date, List<VDailyTask>> newDataMap);
}