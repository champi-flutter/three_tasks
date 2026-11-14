
import 'package:three_tasks/use_case/output_data/daily_tasks_output_data/daily_tasks_output_data.dart';

/// 日単位タスクの監視を反映させるポート
abstract class DailyTasksPresenter {
  /// 更新を反映させる
  Future<void> present(DailyTasksOutputData newDataMap);
}