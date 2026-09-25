import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/infrastructure/gateway/dto/f_label/f_label.dart';
import 'package:three_tasks/infrastructure/gateway/dto/f_task/f_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_label/q_label.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/s_task/s_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/task_save_parameter/task_save_parameter.dart';

abstract class DataSource {
  // todo フェッチ
  /// `LabeledTask` フェッチメソッド
  Future<Result<List<QLabel>, Exception>> getAllLabeledTasks();

  /// `DailyTask` フェッチメソッド
  ///
  /// 要求された日付（[targetDate]）に該当するデータを返す。
  ///
  /// **【注意】** このデータは空の場合もある。
  Future<Result<List<FDailyTask>, Exception>> getDailyTasksByDate({
    required int targetDateInt,
  });

  /// `WeeklyTask` フェッチメソッド
  ///
  /// 要求された日付（[dateList]）に該当するデータを返す。
  Future<Result<List<QWeeklyTask>, Exception>> getWeeklyTasksByDate({
    required Date targetDate,
    required List<int> exclusionDiffs,
  });

  // todo 書き換え
  /// 日単位タスクの新しい日付の枠を作成するメソッド
  ///
  /// 複数の日付を指定可能。
  Future<Result<List<FDailyTask>, Exception>> createDailyTaskRecord({
    required int targetDateInt,
  });

  /// 日単位タスクの新しい日付の枠を作成するメソッド
  ///
  /// 複数の日付を指定可能。
  Future<Result<Map<int, int>, Exception>> createWeeklyTaskRecord({
    required List<int> indexList,
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

  // /// タスクタイトル保存メソッド
  // Future<Result<void, Exception>> saveTaskTitles({
  //   required List<DTask> newTaskList,
  // });

  // /// タスクのチェック変更保存メソッド
  // Future<Result<void, Exception>> saveCheck({
  //   required DTask newTask,
  // });

  /// 新しいラベルの枠を作成し、その ID を返す
  Future<Result<int, Exception>> createNewLabel({
    required String title,
  });

  /// ラベルテーブルの情報を更新する
  Future<Result<void, Exception>> saveLabels({required QLabel qLabel});

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

  /// 指定のラベルに、タスク ID を追加するメソッド
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[dTask.id]）を追加する。
  Future<Result<void, Exception>> addTaskIdToLabel({
    required int labelId,
    required DTask dTask,
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
