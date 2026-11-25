

import 'package:custom_core_types/custom_core_types.dart';

/// 日単位タスクへのアクセスを通知するフローに渡す Input Data
class NotifyDailyTasksAccessInputData {

  NotifyDailyTasksAccessInputData({required this.date});

  final Date date;
}

/// 週単位タスクへのアクセスを通知するフローに渡す Input Data
class NotifyWeeklyTasksAccessInputData {

  NotifyWeeklyTasksAccessInputData({required this.week});

  final UniqueWeek week;
}

/// 月単位タスクへのアクセスを通知するフローに渡す Input Data
class NotifyMonthlyTasksAccessInputData {

  NotifyMonthlyTasksAccessInputData({required this.month});

  final Month month;
}

/// 年単位タスクへのアクセスを通知するフローに渡す Input Data
class NotifyYearlyTasksAccessInputData {

  NotifyYearlyTasksAccessInputData({required this.year});

  final int year;
}