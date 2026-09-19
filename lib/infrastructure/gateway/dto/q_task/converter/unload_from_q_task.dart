
import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

class UnloadFromQTask{
  /// [QDailyTask] から日付情報を [Date] 型で取り出す
  static Date date(QDailyTask task)=>task.dateInt.toDate();

  /// [QWeeklyTask] から週の開始日を [Date] 型で取り出す
  static Date firstDate(QWeeklyTask task)=>task.firstDateInt.toDate();

  /// [QWeeklyTask] から週情報を [UniqueWeek] 型で取り出す
  static UniqueWeek uniqueWeek(QWeeklyTask task) => UniqueWeek.fromDate(
    currentDate: firstDate(task),
    firstDate: firstDate(task),
  );

  /// [QMonthlyTask] から月情報を [Month] 型で取り出す
  // todo data_converter に toMonth を実装（2026/09/11）＞＞
  static Month month(QMonthlyTask task)=>task.monthInt.toMonth();
}