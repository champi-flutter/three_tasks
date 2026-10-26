import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_label/q_label.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_setting/q_page_setting.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

abstract class DataSource {
  // todo フェッチ
  /// `LabeledTask` フェッチメソッド
  Future<Result<List<QLabel>, Exception>> getAllLabeledTasks();

  /// `DailyTask` フェッチメソッド
  ///
  /// 要求された日付に該当するデータを返す。
  ///
  /// **【注意】** このデータは空の場合もある。
  Future<Result<List<QDailyTask>, Exception>> getDailyTasksByDate({
    required int targetDateInt,
  });

  /// データソースに保存している週タスクを、日付を指定して取得する
  ///
  /// 要求された日付（[dateList]）に該当するデータを返す。
  Future<Result<List<QWeeklyTask>, Exception>> getWeeklyTasksByDate({
    required Date targetDate,
    required List<int> exclusionDiffs,
  });

  /// `MonthlyTask` フェッチメソッド
  ///
  /// 要求された月に該当するデータを返す。
  ///
  /// **【注意】** このデータは空の場合もある。
  Future<Result<List<QMonthlyTask>, Exception>> getMonthlyTasks({
    required int targetMonthInt,
  });

  /// `YearlyTask` フェッチメソッド
  ///
  /// 要求された年に該当するデータを返す。
  ///
  /// **【注意】** このデータは空の場合もある。
  Future<Result<List<QYearlyTask>, Exception>> getYearlyTasks({
    required int targetYear,
  });

  /// データソースに保存している各種設定値を取得する
  Future<Result<QSettingsMap, Exception>> getSettings();

  // todo 書き換え
  /// 日単位タスクの新しい日付の枠を作成するメソッド
  Future<Result<TaskList<QDailyTask>, Exception>> createDailyTaskRecord({
    required int targetDateInt,
  });

  /// 週単位タスクの新しい枠を作成するメソッド
  ///
  /// 指定した座（[indexList]）に対応するタスク ID の Map （`Map<int, int>`）を返す。
  Future<Result<Map<int, int>, Exception>> createWeeklyTaskRecord({
    required List<int> indexList,
  });

  /// 月単位タスクの新しい枠を作成するメソッド
  Future<Result<TaskList<QMonthlyTask>, Exception>> createMonthlyTaskRecord({
    required int targetMonthInt,
  });

  /// 年単位タスクの新しい枠を作成するメソッド
  Future<Result<TaskList<QYearlyTask>, Exception>> createYearlyTaskRecord({
    required int targetYear,
  });

  /// タスク情報変更保存メソッド
  ///
  /// [QTask] に入れられた変更後情報を保存する
  Future<Result<void, Exception>> saveTaskChanges({
    required List<QTask> newTaskList,
  });

  /// 週単位タスクの firstDate を書き換えるメソッド
  Future<Result<void, Exception>> updateWeeklyTasksFirstDate({
    required Map<int, Date> idFirstDateMap,
  });

  /// 新しいラベルの枠を作成し、その ID を返す
  Future<Result<int, Exception>> createNewLabel({
    required String title,
    required QTask firstTask,
  });

  /// ラベルテーブルの情報を更新する
  Future<Result<void, Exception>> saveLabels({required List<QLabel> qLabels});

  /// 各種設定を初期化する
  Future<Result<QSettingsMap, Exception>> initSettings({
    required int length,
  });

  /// 指定ページの設定値の更新を保存する
  Future<Result<void, Exception>> saveSettingChanges({
    required QPageSetting qPageSetting,
  });
}
