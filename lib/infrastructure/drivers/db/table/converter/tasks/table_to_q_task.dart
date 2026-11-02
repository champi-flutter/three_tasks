

import 'package:three_tasks/data_foundation/review_base/review.dart';
import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

class TableToQTask {

  /// [DayTask]（テーブルクラス）から [DDailyTask]（クエリ用 DTO）へ変換
  static QDailyTask toQDailyTask(DayTask rawData) {
    return QDailyTask(
      title: rawData.title,
      // 2026/06/08 変更: カラムの型の変換に対応
      dateInt: rawData.date,
      id: rawData.id,
      isChecked: rawData.isChecked,
      labelId: rawData.labelId,
      review: Review(result: rawData.result, next: rawData.next,),
    );
  }

  /// [DayTask]（テーブルクラス）の List から [QDailyTask]（クエリ用 DTO）の
  /// List へ変換
  static List<QDailyTask> toQDailyTaskList(List<DayTask> rawDataList) =>
      rawDataList.map(toQDailyTask).toList();

  /// [WeeklyTask]（テーブルクラス）から [QWeeklyTask]（クエリ用 DTO）へ変換
  static QWeeklyTask toQWeeklyTask(WeeklyTask rawData) {
    return QWeeklyTask(
      title: rawData.title,
      firstDateInt: rawData.firstDate,
      id: rawData.id,
      isChecked: rawData.isChecked,
      labelId: rawData.labelId,
      review: Review(result: rawData.result, next: rawData.next,),
    );
  }

  /// [WeeklyTask]（テーブルクラス）の List から [QDailyTask]（クエリ用 DTO）の
  /// List へ変換
  static List<QWeeklyTask> toQWeeklyTaskList(List<WeeklyTask> rawDataList) =>
      rawDataList.map(toQWeeklyTask).toList();

  /// [MonthlyTask]（テーブルクラス）から [QMonthlyTask]（クエリ用 DTO）へ変換
  static QMonthlyTask toQMonthlyTask(MonthlyTask rawData) {
    return QMonthlyTask(
      title: rawData.title,
      // 2026/06/08 変更: カラムの型の変換に対応
      monthInt: rawData.month,
      id: rawData.id,
      isChecked: rawData.isChecked,
      labelId: rawData.labelId,
      review: Review(result: rawData.result, next: rawData.next,),
    );
  }

  /// [MonthlyTask]（テーブルクラス）の List から [QMonthlyTask]（クエリ用 DTO）の
  /// List へ変換
  static List<QMonthlyTask> toQMonthlyTaskList(List<MonthlyTask> rawDataList) =>
      rawDataList.map(toQMonthlyTask).toList();

  /// [YearlyTask]（テーブルクラス）から [QYearlyTask]（クエリ用 DTO）へ変換
  static QYearlyTask toQYearlyTask(YearlyTask rawData) {
    return QYearlyTask(
      title: rawData.title,
      // 2026/06/08 変更: カラムの型の変換に対応
      year: rawData.year,
      id: rawData.id,
      isChecked: rawData.isChecked,
      labelId: rawData.labelId,
      review: Review(result: rawData.result, next: rawData.next,),
    );
  }

  /// [YearlyTask]（テーブルクラス）の List から [QYearlyTask]（クエリ用 DTO）の
  /// List へ変換
  static List<QYearlyTask> toQYearlyTaskList(List<YearlyTask> rawDataList) =>
      rawDataList.map(toQYearlyTask).toList();
}
