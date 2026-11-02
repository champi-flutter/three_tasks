

import 'package:custom_core_types/custom_core_types.dart';

/// 日単位タスクへのアクセスを通知するフロー
abstract class NotifyDailyTasksAccessUseCase {
  void execute(Date date);
}

/// 週単位タスクへのアクセスを通知するフロー
abstract class NotifyWeeklyTasksAccessUseCase {
  void execute(UniqueWeek week);
}

/// 月単位タスクへのアクセスを通知するフロー
abstract class NotifyMonthlyTasksAccessUseCase {
  void execute(Month month);
}

/// 年単位タスクへのアクセスを通知するフロー
abstract class NotifyYearlyTasksAccessUseCase {
  void execute(int year);
}