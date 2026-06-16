import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/data_type/d_labeled_task.dart';

abstract class DataRepository {
  /// **日単位** タスクのキャッシュが更新された際に、その情報を流すストリーム
  Stream<Map<Date, List<DDayTask>>> get dayTasksStream;

  /// **週単位** タスクのキャッシュが更新された際に、その情報を流すストリーム
  Stream<List<DWeeklyTask>> get weeklyTasksStream;

  /// 「ラベル化したタスク」のキャッシュが更新された際に、その情報を流すストリーム
  Stream<List<DLabeledTask>> get labeledTasksStream;

  // todo 初期化
  /// 週単位タスクのキャッシュ初期化メソッド
  Future<Result<void, Exception>> initWeeklyTaskList();

  // todo フェッチ
  /// 指定日付（[dateList]）の日単位タスクをフェッチするメソッド
  ///
  /// 複数の日付を指定可能。
  Future<void> fetchDayTasksMap({required List<Date> dateList});

  /// 指定日付（[firstDateList]）の週単位タスクをフェッチするメソッド
  ///
  /// 複数の日付を指定可能。
  Future<Result<void, Exception>> fetchWeeklyTaskList({required List<Date> firstDateList});

  // todo 書き換え
  /// タスクタイトル保存メソッド
  Future<Result<void, Exception>> saveTaskTitles({
    required List<DTask> newTaskList,
  });

  /// タスクのチェック変更保存メソッド
  Future<Result<void, Exception>> saveCheck({required DTask newTask});
}
