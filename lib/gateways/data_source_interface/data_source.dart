import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/data_type/d_labeled_task.dart';
import 'package:three_tasks/entities/date_time_options.dart';
import 'package:three_tasks/entities/result.dart';

abstract class DataSource {
  // todo フェッチ
  /// `LabeledTask` フェッチメソッド
  Future<Result<List<DLabeledTask>, Exception>> getAllLabeledTasks();

  /// `DayTask` フェッチメソッド
  ///
  /// 要求された日付（[dateList]）に該当するデータを返す。
  ///
  /// **【注意】** このデータは空の場合もある。
  Future<Result<Map<Date, List<DDayTask>>, Exception>> getDayTasksByDate({
    required List<Date> dateList,
  });

  /// `WeeklyTask` フェッチメソッド
  ///
  /// 要求された日付（[firstDateList]）に該当するデータを返す。
  Future<Result<List<DWeeklyTask>, Exception>> getWeeklyTasksByDate({
    required List<Date> firstDateList,
  });

  // todo 書き換え
  /// 日単位タスクの新しい日付の枠を作成するメソッド
  ///
  /// 複数の日付を指定可能。
  Future<Result<Map<Date, List<DDayTask>>, Exception>> createDailyTaskRecord({
    required List<Date> dateList,
  });

  /// タスク情報変更保存メソッド
  Future<Result<void, Exception>> saveTaskChanges({
    required List<DTask> newTaskList,
  });

  /// タスクタイトル保存メソッド
  Future<Result<void, Exception>> saveTaskTitles({
    required List<DTask> newTaskList,
  });

  /// タスクのチェック変更保存メソッド
  Future<Result<void, Exception>> saveCheck({
    required DTask newTask,
  });

  /// 日単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードを [DLabeledTask] で返す。
  Future<Result<DLabeledTask, Exception>> labelDailyTask({
    required String label,
    required int newId,
  });

  /// 週単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードを [DLabeledTask] で返す。
  Future<Result<DLabeledTask, Exception>> labelWeeklyTask({
    required String label,
    required int newId,
  });

  /// 月単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードを [DLabeledTask] で返す。
  Future<Result<DLabeledTask, Exception>> labelMonthlyTask({
    required String label,
    required int newId,
  });

  /// 年単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードを [DLabeledTask] で返す。
  Future<Result<DLabeledTask, Exception>> labelYearlyTask({
    required String label,
    required int newId,
  });

  /// 日単位タスクのラベルを解除
  ///
  /// 指定ラベル（[labelId]）からタスクの情報（[dTask]）を除外する。
  ///
  /// 指定タスクの [DTask.labelId] を `null` にする。
  Future<Result<void, Exception>> unlabelDailyTask({
    required int labelId,
    required int targetId,
  });

  /// 週単位タスクのラベルを解除
  ///
  /// 指定ラベル（[labelId]）からタスクの情報（[dTask]）を除外する。
  ///
  /// 指定タスクの [DTask.labelId] を `null` にする。
  Future<Result<void, Exception>> unlabelWeeklyTask({
    required int labelId,
    required int targetId,
  });

  /// 月単位タスクのラベルを解除
  ///
  /// 指定ラベル（[labelId]）からタスクの情報（[dTask]）を除外する。
  ///
  /// 指定タスクの [DTask.labelId] を `null` にする。
  Future<Result<void, Exception>> unlabelMonthlyTask({
    required int labelId,
    required int targetId,
  });

  /// 年単位タスクのラベルを解除
  ///
  /// 指定ラベル（[labelId]）からタスクの情報（[dTask]）を除外する。
  ///
  /// 指定タスクの [DTask.labelId] を `null` にする。
  Future<Result<void, Exception>> unlabelYearlyTask({
    required int labelId,
    required int targetId,
  });

  /// 日単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  Future<Result<void, Exception>> addDailyTaskToLabel({
    required int labelId,
    required int targetId,
  });

  /// 週単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  Future<Result<void, Exception>> addWeeklyTaskToLabel({
    required int labelId,
    required int targetId,
  });

  /// 月単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  Future<Result<void, Exception>> addMonthlyTaskToLabel({
    required int labelId,
    required int targetId,
  });

  /// 年単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  Future<Result<void, Exception>> addYearlyTaskToLabel({
    required int labelId,
    required int targetId,
  });

// /// 既存のラベルを採用した枠を作るメソッド
// ///
// /// [newIdList] は呼び出し元で管理されているキャッシュを代入すること。
// Future<Result<void, Exception>> addDailyTaskInLabel(
//     {required List<int> newIdList});
}
