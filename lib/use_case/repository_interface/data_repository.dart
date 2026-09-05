import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_parameter/task_update_parameter.dart';

/// データ層へのアクセスポート
abstract class DataRepository {

  // todo フェッチ
  /// 指定日付（[dateList]）の日単位タスクをフェッチするメソッド
  ///
  /// 複数の日付を指定可能。
  Future<Result<Map<Date, List<EDailyTask>>, Exception>> fetchDailyTasks({
    required List<Date> dateList,
  });

  /// 週単位タスクフェッチメソッド
  ///
  /// DB からデータを取得して、ストリームに流す。
  ///
  /// 基本はキャッシュを参照するが、参照したい日付（[dateList]）がキャッシュにない場合
  /// にこのメソッドを呼び出す。
  Future<Result<void, Exception>> fetchWeeklyTasks({
    required Date targetDate,
  });

  /// 指定日付（[firstDateList]）の週単位タスクをフェッチするメソッド
  ///
  /// 複数の日付を指定可能。
  Future<Result<void, Exception>> fetchWeeklyTaskList(
      {required List<Date> firstDateList});

  /// 日単位タスクの新しい日付の枠を作成するメソッド
  Future<Result<Map<Date, List<EDailyTask>>, Exception>> createDailyTaskRecord({
    required List<Date> dateList,
  });

  /// 週単位タスクの新しい枠を作成するメソッド
  Future<Result<List<EWeeklyTask>, Exception>> createWeeklyTaskRecord({
    required List<Date> firstDateList,
  });

  // todo 書き換え

  /// タスク情報変更保存メソッド
  Future<Result<void, Exception>> saveTaskChanges({
    required List<TaskUpdateParameter> updateParameterList,
  });

  /// 週単位タスクの firstDate を書き換えるメソッド
  Future<Result<void, Exception>> updateWeeklyTasksFirstDate({
    required Map<int, Date> idFirstDateMap,
  });

  /// タスクタイトル保存メソッド
  Future<Result<void, Exception>> saveTaskTitles({
    required List<ETask> newTaskList,
  });

  /// タスクのチェック変更保存メソッド
  Future<Result<void, Exception>> saveCheck({required DTask newTask});

  /// 新しいラベルの枠を作成し、その ID を返す
  Future<Result<int, Exception>> createNewLabel({
    required String title,
  });

  /// タスクラベル化メソッド
  ///
  /// 新規ラベルの ID を返す。
  ///
  /// 例外が発生した場合は、`null` を返す。
  Future<int?> labeling({required DTask dTask});

  /// タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[dTask.id]）を追加する。
  ///
  /// 指定タスクのラベル情報（[dTask.labelId]）に、指定ラベルを加える。
  Future<Result<void, Exception>> addTaskIdToLabel({
    required DTask dTask,
    required int labelId,
  });

  /// 指定タスクのラベル化を解除するメソッド
  ///
  /// 指定タスク（[dTask]）がこの段階で属しているラベルから、このタスクのIDを除外する。
  ///
  /// 指定タスクの [DTask.labelId] を `null` にする。
  Future<void> unlabeling({
    required DTask dTask,
  });
}
