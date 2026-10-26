import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_label/e_label.dart';
import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

/// データ層へのアクセスポート
abstract class DataRepository {

  // todo フェッチ
  /// ラベルデータをフェッチするメソッド
  Future<Result<LabelList<ELabel>, Exception>> fetchLabel();

  /// 指定日付の日単位タスクをフェッチするメソッド
  Future<Result<void, Exception>> fetchDailyTasks({
    required Date targetDate,
  });

  /// 週単位タスクフェッチメソッド
  ///
  /// DB からデータを取得して、ストリームに流す。
  ///
  /// 基本はキャッシュを参照するが、参照したい日付がキャッシュにない場合にこのメソッドを
  /// 呼び出す。
  Future<Result<void, Exception>> fetchWeeklyTasks({
    required Date targetDate,
  });

  /// 指定月の月単位タスクをフェッチするメソッド
  Future<Result<void, Exception>> fetchMonthlyTasks({
    required Month targetMonth,
  });

  /// 指定年の月単位タスクをフェッチするメソッド
  Future<Result<void, Exception>> fetchYearlyTasks({
    required int targetYear,
  });

  /// 各種設定値をフェッチする
  Future<Result<ESettingsMap, Exception>> fetchSettings();

  // todo 書き換え

  /// タスク情報変更保存メソッド
  Future<Result<void, Exception>> saveTaskChanges({
    required TaskList<ETask> updatingETaskList,
  });

  /// 週タスク固有の情報変更保存メソッド
  ///
  /// `ListEntry<EWeeklyTask>` の可変長リストを渡す
  Future<Result<void, Exception>> saveWeeklyTaskChanges({
    required List<ListEntry<EWeeklyTask>> updatingETaskList,
  });

  /// 週単位タスクの firstDate を書き換えるメソッド
  Future<Result<void, Exception>> updateWeeklyTasksFirstDate({
    required Map<int, Date> idFirstDateMap,
  });

  /// ラベル情報変更保存メソッド
  ///
  ///
  Future<Result<void, Exception>> saveLabelChanges({
    required List<ELabel> changedLabels,
    required bool shouldReflect,
  });

  /// 新しいラベルの枠を作成し、その ID を返す
  Future<Result<void, Exception>> createNewLabel({
    required String title,
    required ETask firstETask,
  });

  /// 新しい値を当てはめずに、現在のキャッシュを流す
  Future<Result<void, Exception>> outputCurrentTaskCache(TaskRec rec);

  /// 各種設定を初期化する
  Future<Result<ESettingsMap, Exception>> initSettings({
    required int length,
  });

  /// 設定値の変更を保存する
  Future<Result<void, Exception>> saveSettingChanges({
    required EPageSetting ePageSetting,
  });
}
