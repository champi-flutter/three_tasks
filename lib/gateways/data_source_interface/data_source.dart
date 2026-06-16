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

  /// タスクタイトル保存メソッド
  Future<Result<void, Exception>> saveTaskTitles({
    required List<DTask> newTaskList,
  });

  /// タスクのチェック変更保存メソッド
  Future<Result<void, Exception>> saveCheck({
    required DTask newTask,
  });

  /// 日単位タスクをラベリング
  Future<Result<void, Exception>> labelDailyTask({
    required String label,
    required int newId,
  });

  /// 既存のラベルを採用した枠を作るメソッド
  ///
  /// [newIdList] は呼び出し元で管理されているキャッシュを代入すること。
  Future<Result<void, Exception>> addDailyTaskInLabel(
      {required List<int> newIdList});
}
