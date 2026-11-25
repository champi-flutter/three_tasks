

import 'package:three_tasks/use_case/output_data/tasks_output_data/daily_task_output_data.dart';

/// 日単位タスクの監視を反映させるポート
abstract interface class DailyTasksPresenter {
  /// 更新を反映させる
  Future<void> present(DailyTaskOutputData newDataMap);
}