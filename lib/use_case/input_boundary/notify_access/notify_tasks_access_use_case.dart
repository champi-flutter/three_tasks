

import 'package:three_tasks/use_case/input_data/task_input_data/notify_tasks_access/notify_tasks_access_input_data.dart';

/// 日単位タスクへのアクセスを通知するフロー
abstract class NotifyDailyTasksAccessUseCase {
  void execute(NotifyDailyTasksAccessInputData inputData);
}

/// 週単位タスクへのアクセスを通知するフロー
abstract class NotifyWeeklyTasksAccessUseCase {
  void execute(NotifyWeeklyTasksAccessInputData inputData);
}

/// 月単位タスクへのアクセスを通知するフロー
abstract class NotifyMonthlyTasksAccessUseCase {
  void execute(NotifyMonthlyTasksAccessInputData inputData);
}

/// 年単位タスクへのアクセスを通知するフロー
abstract class NotifyYearlyTasksAccessUseCase {
  void execute(NotifyYearlyTasksAccessInputData inputData);
}