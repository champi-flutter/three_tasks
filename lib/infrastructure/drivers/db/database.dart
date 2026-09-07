import 'dart:ui';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/data_source_interface/data_source.dart';
import 'package:three_tasks/infrastructure/gateway/dto/f_task/f_task.dart';
import 'package:three_tasks/main.dart';

part 'database.g.dart';

// 1日のタスク
class DayTasks extends Table {
  TextColumn get task => text()();

  // 2026/06/08 変更: String => int
  IntColumn get date => integer()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  TextColumn get result => text().nullable()();

  TextColumn get improvement => text().nullable()();

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  // todo non-nullable に（2026/09/05）＞＞
  IntColumn get labelId => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// 1週間のタスク
class WeeklyTasks extends Table {
  TextColumn get task => text()();

  // TextColumn get week => text()();
  //
  // IntColumn get month => integer().withDefault(Constant(now.month))();
  //
  // IntColumn get firstDay => integer()();

  // 2026/06/08 変更: firstDate のみに変更
  IntColumn get firstDate => integer()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  TextColumn get result => text().nullable()();

  TextColumn get improvement => text().nullable()();

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  IntColumn get labelId => integer().nullable()();
}

// 1ヶ月のタスク
class MonthlyTasks extends Table {
  TextColumn get task => text()();

  TextColumn get month => text()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  TextColumn get result => text().nullable()();

  TextColumn get improvement => text().nullable()();

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  IntColumn get labelId => integer().nullable()();
}

// 1年間のタスク
class YearlyTasks extends Table {
  TextColumn get task => text()();

  TextColumn get year => text()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  TextColumn get result => text().nullable()();

  TextColumn get improvement => text().nullable()();

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  IntColumn get labelId => integer().nullable()();
}

/// 2026/06/01 追加: ラベリングされたタスク
class LabeledTasks extends Table {
  // 主キー
  IntColumn get labeledId => integer().autoIncrement()();

  // ラベル
  TextColumn get label => text()();

  // 採用された日単位タスクの ID のリスト
  BlobColumn get dailyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();

  // 採用された週単位タスクの ID のリスト
  BlobColumn get weeklyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();

  // 採用された月単位タスクの ID のリスト
  BlobColumn get monthlyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();

  // 採用された年単位タスクの ID のリスト
  BlobColumn get yearlyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();
}

@DriftDatabase(tables: [
  DayTasks,
  WeeklyTasks,
  MonthlyTasks,
  YearlyTasks,
  LabeledTasks,
])
class MyDatabase extends _$MyDatabase implements DataSource {
  // データベースをどこに保存するかをDriftに伝えるリダイレクトコンストラクタ
  MyDatabase() : super(_openConnection());

  static QueryExecutor _openConnection() {
    // 拡張子抜きのデータベース名
    return driftDatabase(name: "tasks");
  }

  // 統合処理とスキーマバージョンアップをしてなかった（R7/02/14）

  // todo 変換
  /// [LabeledTask]（テーブルクラス）から [DLabeledTask]（エンティティ）へ変換
  DLabeledTask _dLabeledTask(LabeledTask rawData) {
    return DLabeledTask(
      label: rawData.label,
      labelId: rawData.labeledId,
      taskId: rawData.labeledId,
      dailyIdList: rawData.dailyIdList,
      weeklyIdList: rawData.weeklyIdList,
      monthlyIdList: rawData.monthlyIdList,
      yearlyIdList: rawData.yearlyIdList,
    );
  }

  /// [LabeledTask]（テーブルクラス）の List から [DLabeledTask]（エンティティ）の
  /// List へ変換
  List<DLabeledTask> _dLabeledTaskList(List<LabeledTask> rawDataList) {
    return [...rawDataList].map((LabeledTask rawData) {
      return DLabeledTask(
        label: rawData.label,
        labelId: rawData.labeledId,
        taskId: rawData.labeledId,
        dailyIdList: rawData.dailyIdList,
        weeklyIdList: rawData.weeklyIdList,
        monthlyIdList: rawData.monthlyIdList,
        yearlyIdList: rawData.yearlyIdList,
      );
    }).toList();
  }

  /// [DayTask]（テーブルクラス）から [DDailyTask]（エンティティ）へ変換
  FDailyTask _toFDailyTask(DayTask rawData) {
    return FDailyTask(
      title: rawData.task,
      // 2026/06/08 変更: カラムの型の変換に対応
      dateInt: rawData.date,
      id: rawData.id,
      isChecked: rawData.isChecked,
      // todo labelId を non-nullable に（2026/09/07）＞＞
      labelId: rawData.labelId,
    );
  }

  /// [DayTask]（テーブルクラス）の List から [DDailyTask]（エンティティ）の
  /// List へ変換
  List<FDailyTask> _toFDailyTaskList(List<DayTask> rawDataList) =>
      rawDataList.map(_toFDailyTask).toList();

  /// [WeeklyTask]（テーブルクラス）から [DWeeklyTask]（エンティティ）へ変換
  FWeeklyTask _toFWeeklyTask(WeeklyTask rawData) {
    return FWeeklyTask(
      title: rawData.task,
      firstDateInt: rawData.firstDate,
      id: rawData.id,
      isChecked: rawData.isChecked,
      // todo labelId を non-nullable に（2026/09/07）＞＞
      labelId: rawData.labelId,
    );
  }

  /// [WeeklyTask]（テーブルクラス）の List から [DDailyTask]（エンティティ）の
  /// List へ変換
  List<FWeeklyTask> _toFWeeklyTaskList(List<WeeklyTask> rawDataList) =>
      rawDataList.map(_toFWeeklyTask).toList();

  // todo フェッチ
  // todo LabeledTasks
  /// `LabeledTask` フェッチメソッド
  @override
  Future<Result<List<DLabeledTask>, Exception>> getAllLabeledTasks() async {
    try {
      final List<LabeledTask> rawDataList = await managers.labeledTasks.get();
      final List<DLabeledTask> resultValue = _dLabeledTaskList(rawDataList);
      return Success(resultValue);
    } catch (e) {
      return Failure(Exception(e), methodName: "getAllLabeledTasks");
    }
  }

  /// `DayTask` フェッチメソッド
  ///
  /// 要求された日付（[dateList]）に該当するデータを返す。
  @override
  Future<Result<List<FDailyTask>, Exception>> getDailyTasksByDate({
    required int targetDateInt,
  })
  // 折りたたみ用
  async {
    try {
      // DB から該当日付のタスクを取得
      final List<DayTask> rawDataList = await managers.dayTasks
          .filter((dayTask) => dayTask.date.equals(targetDateInt))
          .get();
      // Fetch 用 DTO に変換して返す
      return Success(_toFDailyTaskList(rawDataList));
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "getDailyTasksByDate");
    }
  }

  /// `WeeklyTask` フェッチメソッド
  ///
  /// 要求された日付（[targetDate]）に該当するデータを返す。
  @override
  Future<Result<List<FWeeklyTask>, Exception>> getWeeklyTasksByDate({
    required Date targetDate,
    required List<int> exclusionDiffs,
  })
  // 折りたたみ用
  async {
    try {
      final List<FWeeklyTask> resultValue = [];
      // transaction で、要求された日付のデータを一気に取得
      await transaction(() async {
        // targetDate をカラムの型の変換に対応
        final int targetDateInt = targetDate.toIntIdentifier();
        // targetDate から 6 〜 0 日前が週の初めとなっているタスクを取得
        for (int diff = 6; diff >= 0; diff--) {
          // 引数で指定された、除外する開始日
          if (exclusionDiffs.contains(diff)) {
            continue;
          }
          // 週の初めの日の int
          final int firstDateInt = targetDateInt - diff;
          // DB から該当日付のタスクを取得する
          final List<WeeklyTask> rawDataList = await managers.weeklyTasks
              .filter((weeklyTask) => weeklyTask.firstDate.equals(firstDateInt))
              .get();

          // そのリストを DTO に変換して、戻り値に組み込む（リストが空の場合も）
          resultValue.addAll(_dWeeklyTaskList(rawDataList));
        }
      });
      // 3つ以下の時のみ Success を返す
      if (resultValue.length <= 3) {
        return Success(resultValue);
      } else {
        throw Exception(
            "週のタスクが 4 つ以上存在します。\nlength = ${resultValue.length} （${targetDate.toStrFormat()}）");
      }
    } catch (e) {
      return Failure(Exception(e), methodName: "getWeeklyTasksByDate");
    }
  }

  // todo DayTasks

  // Read（抽出）
  // managerが管理する全てのデータベース（）の中から対象のデータベース（）を取得する
  Future<List<DayTask>> get allDayTasks => managers.dayTasks.get();

  // // 今日のタスクだけを抽出
  // Future<List<DayTask>> get allTasksForToday =>
  //     managers.dayTasks.filter((f) => f.date(today)).get();
  //
  // // 明日のタスクだけを抽出
  // Future<List<DayTask>> get allTasksForTomorrow =>
  //     managers.dayTasks.filter((f) => f.date(tomorrow)).get();
  //
  // // 昨日のタスクだけを抽出
  // Future<List<DayTask>> get allTasksForYesterday => managers.dayTasks
  //     .filter((f) => f.date(outputFormat.format(now.add(Duration(days: -1)))))
  //     .get();
  //
  // // カレンダーで選択された日付のタスクを抽出
  // Future<List<DayTask>> get allTasksForTheDay => managers.dayTasks
  //     .filter((f) => f.date(outputFormat.format(theDay)))
  //     .get();

  /// 達成されなかったタスクを抽出
  Future<List<DayTask>> get allTasksNotAchieved => managers.dayTasks
      .filter((f) => f.isChecked.equals(false))
      .orderBy((o) => o.date.asc())
      .get();

  // Update（更新）
  // 指定したデータ行（）を古いデータと置き換える
  Future<void> updateDayTask(DayTask dayTaskUpdated) =>
      managers.dayTasks.replace(dayTaskUpdated);

  // todo 書き換え
  /// 日単位タスクの新しい日付の枠を作成するメソッド
  ///
  /// 複数の日付を指定可能。
  @override
  Future<Result<List<FDailyTask>, Exception>> createDailyTaskRecord({
    required int targetDateInt,
  })
  // 折りたたみ用
  async {
    try {
      // 作成するタスクの枠
      final List<DayTask> rawDataList = [];
      await transaction(()async{
        // 空のタスクを3つ作る
        for (int i = 0; i < 3; i++) {
          final DayTask rawData =
          await managers.dayTasks.createReturning((record) => record(
            task: "",
            date: targetDateInt,
          ));
          rawDataList.add(rawData);
        }
      });
      // Fetch 用の DTO に変換して返す
      return Success(_toFDailyTaskList(rawDataList));
    } catch (e) {
      return Failure(Exception(e), methodName: "createDailyTaskRecord");
    }
  }

  /// 日単位タスクの新しい日付の枠を作成するメソッド
  ///
  /// 複数の日付を指定可能。
  @override
  Future<Result<List<DWeeklyTask>, Exception>> createWeeklyTaskRecord({
    required List<Date> firstDateList,
  })
  // 折りたたみ用
  async {
    try {
      // 返す List の枠
      final List<DWeeklyTask> dataList = [];
      // 指定した各日付のタスクのリストを取得
      await transaction(() async {
        for (Date firstDate in firstDateList) {
          final WeeklyTask rawData =
              await managers.weeklyTasks.createReturning((record) => record(
                    task: "",
                    // カラムの型の変換に対応
                    firstDate: firstDate.toIntIdentifier(),
                  ));
          // 作ったタスクを返す List に組み込む
          dataList.add(_dWeeklyTask(rawData));
        }
      });
      return Success(dataList);
    } catch (e) {
      return Failure(Exception(e), methodName: "createWeeklyTaskRecord");
    }
  }

  /// タスクタイトル保存メソッド
  @override
  Future<Result<void, Exception>> saveTaskTitles({
    required List<DTask> newTaskList,
  })
  // 折りたたみ用
  async {
    try {
      // 返す Map の枠
      final Map<Date, List<DDailyTask>> dataMap = {};
      await transaction(() async {
        /// task ごとに情報を保存
        for (DTask task in newTaskList) {
          _print(
            "タスクを DB に保存",
            "  ID: ${task.id}",
            "  タスクタイトル: ${task.task}",
          );
          await _saveDTaskTitle(newDTask: task);
        }
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "saveTaskTitles");
    }
  }

  /// タスク情報変更保存メソッド
  @override
  Future<Result<void, Exception>> saveTaskChanges({
    required List<DTask> newTaskList,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        /// task ごとに情報を保存
        for (DTask task in newTaskList) {
          await _saveDTask(newDTask: task);
        }
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "saveTaskChanges");
    }
  }

  /// 週単位タスクの firstDate を書き換えるメソッド
  @override
  Future<Result<void, Exception>> updateWeeklyTasksFirstDate({
    required Map<int, Date> idFirstDateMap,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // 指定 ID ごとに情報を更新する
        for (final entry in idFirstDateMap.entries) {
          final int targetId = entry.key;
          final int firstDateInt = entry.value.toIntIdentifier();
          // DBに変更を保存する
          await managers.weeklyTasks
              .filter((weeklyTask) => weeklyTask.id.equals(targetId))
              .update(
                (task) => task(
                  firstDate: Value(firstDateInt),
                ),
              );
        }
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "updateWeeklyTasksFirstDate");
    }
  }

  /// タイプ（日単位、週単位、など）別でタスク情報の変更を保存するメソッド
  ///
  /// sealed class の網羅性を使って条件分岐する。
  ///
  /// drift の [Value.absentIfNull] を用いて、指定されなかったカラムは更新せず、
  /// 元の値のままにする。
  Future<void> _saveDTask({required DTask newDTask}) async {
    try {
      switch (newDTask) {
        case DDailyTask(
            task: final String? taskTitle,
            isChecked: final bool? isChecked,
            labelId: final int? labelId,
            id: final int id,
          ):
          if (kDebugMode) {
            final String? printTitle =
                taskTitle == null ? "" : "  タスクタイトル: $taskTitle \n";
            final String? printChecked =
                isChecked == null ? "" : "  チェック: $isChecked\n";
            final String? printLabel =
                labelId == null ? "" : "  ラベルID: $labelId\n";
            _print(
              "タスクを DB に保存",
              "  ID: ${id}",
              "$printTitle $printChecked $printLabel",
            );
          }
          // DBに変更を保存
          await managers.dayTasks
              .filter((dayTask) => dayTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value.absentIfNull(taskTitle),
                  isChecked: Value.absentIfNull(isChecked),
                  labelId: Value.absentIfNull(labelId),
                ),
              );
        case DWeeklyTask(
            task: final String? taskTitle,
            isChecked: final bool? isChecked,
            labelId: final int? labelId,
            id: final int id,
          ):
          if (kDebugMode) {
            final String? printTitle =
                taskTitle == null ? "" : "  タスクタイトル: $taskTitle \n";
            final String? printChecked =
                isChecked == null ? "" : "  チェック: $isChecked\n";
            final String? printLabel =
                labelId == null ? "" : "  ラベルID: $labelId\n";
            _print(
              "タスクを DB に保存",
              "  ID: ${id}",
              "$printTitle $printChecked $printLabel",
            );
          }
          // DBに変更を保存
          await managers.weeklyTasks
              .filter((weeklyTask) => weeklyTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value.absentIfNull(taskTitle),
                  isChecked: Value.absentIfNull(isChecked),
                  labelId: Value.absentIfNull(labelId),
                ),
              );
        case DMonthlyTask(
            task: final String? taskTitle,
            isChecked: final bool? isChecked,
            labelId: final int? labelId,
            id: final int id,
          ):
          if (kDebugMode) {
            final String? printTitle =
                taskTitle == null ? "" : "  タスクタイトル: $taskTitle \n";
            final String? printChecked =
                isChecked == null ? "" : "  チェック: $isChecked\n";
            final String? printLabel =
                labelId == null ? "" : "  ラベルID: $labelId\n";
            _print(
              "タスクを DB に保存",
              "  ID: ${id}",
              "$printTitle $printChecked $printLabel",
            );
          }
          // DBに変更を保存
          await managers.monthlyTasks
              .filter((monthlyTask) => monthlyTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value.absentIfNull(taskTitle),
                  isChecked: Value.absentIfNull(isChecked),
                  labelId: Value.absentIfNull(labelId),
                ),
              );
        case DYearlyTask(
            task: final String? taskTitle,
            isChecked: final bool? isChecked,
            labelId: final int? labelId,
            id: final int id,
          ):
          if (kDebugMode) {
            final String? printTitle =
                taskTitle == null ? "" : "  タスクタイトル: $taskTitle \n";
            final String? printChecked =
                isChecked == null ? "" : "  チェック: $isChecked\n";
            final String? printLabel =
                labelId == null ? "" : "  ラベルID: $labelId\n";
            _print(
              "タスクを DB に保存",
              "  ID: ${id}",
              "$printTitle $printChecked $printLabel",
            );
          }
          // DBに変更を保存
          await managers.yearlyTasks
              .filter((yearlyTask) => yearlyTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value.absentIfNull(taskTitle),
                  isChecked: Value.absentIfNull(isChecked),
                  labelId: Value.absentIfNull(labelId),
                ),
              );
      }
    } catch (_) {
      rethrow;
    }
  }

  /// タイプ（日単位、週単位、など）別でタスクタイトルを保存するメソッド
  ///
  /// sealed class の網羅性を使って条件分岐する。
  Future<void> _saveDTaskTitle({required DTask newDTask}) async {
    try {
      switch (newDTask) {
        case DDailyTask(
            task: final String? taskTitle,
            id: final int id,
          ):
          // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.dayTasks
              .filter((dayTask) => dayTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value(taskTitle),
                ),
              );
        case DWeeklyTask(
            task: final String? taskTitle,
            id: final int id,
          ):
          // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.weeklyTasks
              .filter((dayTask) => dayTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value(taskTitle),
                ),
              );
        case DMonthlyTask(
            task: final String? taskTitle,
            id: final int id,
          ):
          // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.monthlyTasks
              .filter((dayTask) => dayTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value(taskTitle),
                ),
              );
        case DYearlyTask(
            task: final String? taskTitle,
            id: final int id,
          ):
          // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.yearlyTasks
              .filter((dayTask) => dayTask.id.equals(id))
              .update(
                (task) => task(
                  task: Value(taskTitle),
                ),
              );
      }
    } catch (_) {
      rethrow;
    }
  }

  /// タスクのチェック変更保存メソッド
  @override
  Future<Result<void, Exception>> saveCheck({
    required DTask newTask,
  })
  // 折りたたみ用
  async {
    try {
      _print(
        "タスクを DB に保存",
        "  ID: ${newTask.id}",
        "  isChecked: ${newTask.isChecked}",
      );
      await _saveDTaskChecked(newDTask: newTask);
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "saveCheck");
    }
  }

  /// タイプ（日単位、週単位、など）別でタスクタイトルを保存するメソッド
  ///
  /// sealed class の網羅性を使って条件分岐する。
  Future<void> _saveDTaskChecked({required DTask newDTask}) async {
    try {
      switch (newDTask) {
        case DDailyTask(
            isChecked: final bool? newChecked,
            id: final int id,
          ):
          // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.dayTasks
              .filter((dayTask) => dayTask.id.equals(id))
              .update(
                (task) => task(
                  isChecked: Value(newChecked),
                ),
              );
        case DWeeklyTask(
            isChecked: final bool? newChecked,
            id: final int id,
          ):
          // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.weeklyTasks
              .filter((dayTask) => dayTask.id.equals(id))
              .update(
                (task) => task(
                  isChecked: Value(newChecked),
                ),
              );
        case DMonthlyTask(
            isChecked: final bool? newChecked,
            id: final int id,
          ):
          // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.monthlyTasks
              .filter((monthlyTask) => monthlyTask.id.equals(id))
              .update(
                (task) => task(
                  isChecked: Value(newChecked),
                ),
              );
        case DYearlyTask(
            isChecked: final bool? newChecked,
            id: final int id,
          ):
          // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.yearlyTasks
              .filter((yearlyTask) => yearlyTask.id.equals(id))
              .update(
                (task) => task(
                  isChecked: Value(newChecked),
                ),
              );
      }
    } catch (_) {
      rethrow;
    }
  }

  // Delete（削除）
  // 指定したデータ行を削除する
  // filterでは対象のdayTaskのtaskが指定したデータベースと一致するかどうかでフィルタリングし、削除
  Future<void> deleteDailyTask(DayTask unnecessaryDayTask) {
    // ややこしいので省略しないが、「=>』と同じ意味
    return managers.dayTasks
        .filter(
          (f) => f.task.equals(unnecessaryDayTask.task),
        )
        .delete();
  }

  /// 新しいラベルの枠を作成し、その ID を返す
  @override
  Future<Result<int, Exception>> createNewLabel({
    required String title,
  })
  // 折りたたみ用
  async {
    try {
      // LabeledTasks に新しいレコードを作成
      final int createdId = await managers.labeledTasks.create(
        (record) => record(
          label: title,
        ),
      );
      return Success(createdId);
    } catch (e) {
      return Failure(Exception(e), methodName: "createNewLabel");
    }
  }

  /// 日単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードを [DLabeledTask] で返す。
  @override
  Future<Result<DLabeledTask, Exception>> labelDailyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      LabeledTask? _labeledTask;
      await transaction(() async {
        // LabeledTasks に新しいレコードを作成
        _labeledTask = await managers.labeledTasks.createReturning(
          (record) => record(
            label: label,
            dailyIdList: Value(
              Uint8List.fromList([newId]),
            ),
          ),
        );
        // タスクIDに該当するタスクの labelId を更新
        await managers.dayTasks
            .filter((dayTask) => dayTask.id.equals(newId))
            .update(
              (dayTask) => dayTask(
                labelId: Value(_labeledTask!.labeledId),
              ),
            );
      });
      if (_labeledTask != null) {
        return Success(_dLabeledTask(_labeledTask!));
      }
      // transaction 内でエラーを投げると思われるが一応
      else {
        throw Exception("_labeledTask == null");
      }
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingDailyTask");
    }
  }

  /// 週単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードを [DLabeledTask] で返す。
  @override
  Future<Result<DLabeledTask, Exception>> labelWeeklyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      LabeledTask? _labeledTask;
      await transaction(() async {
        // LabeledTasks に新しいレコードを作成
        _labeledTask = await managers.labeledTasks.createReturning(
          (record) => record(
            label: label,
            weeklyIdList: Value(
              Uint8List.fromList([newId]),
            ),
          ),
        );

        // タスクIDに該当するタスクの labelId を更新
        await managers.weeklyTasks
            .filter((weeklyTask) => weeklyTask.id.equals(newId))
            .update(
              (weeklyTask) => weeklyTask(
                labelId: Value(_labeledTask!.labeledId),
              ),
            );
      });
      if (_labeledTask != null) {
        return Success(_dLabeledTask(_labeledTask!));
      }
      // transaction 内でエラーを投げると思われるが一応
      else {
        throw Exception("_labeledTask == null");
      }
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingWeeklyTask");
    }
  }

  /// 月単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードを [DLabeledTask] で返す。
  @override
  Future<Result<DLabeledTask, Exception>> labelMonthlyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      LabeledTask? _labeledTask;
      await transaction(() async {
        // LabeledTasks に新しいレコードを作成
        _labeledTask =
            await managers.labeledTasks.createReturning((record) => record(
                  label: label,
                  monthlyIdList: Value(
                    Uint8List.fromList([newId]),
                  ),
                ));

        // タスクIDに該当するタスクの labelId を更新
        await managers.monthlyTasks
            .filter((monthlyTask) => monthlyTask.id.equals(newId))
            .update(
              (monthlyTask) => monthlyTask(
                labelId: Value(_labeledTask!.labeledId),
              ),
            );
      });
      if (_labeledTask != null) {
        return Success(_dLabeledTask(_labeledTask!));
      }
      // transaction 内でエラーを投げると思われるが一応
      else {
        throw Exception("_labeledTask == null");
      }
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingMonthlyTask");
    }
  }

  /// 年単位タスクをラベリング
  ///
  /// 例外がない場合は、新規レコードの labelId を返す。
  @override
  Future<Result<DLabeledTask, Exception>> labelYearlyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      LabeledTask? _labeledTask;
      await transaction(() async {
        // LabeledTasks に新しいレコードを作成
        _labeledTask = await managers.labeledTasks.createReturning(
          (record) => record(
            label: label,
            yearlyIdList: Value(
              Uint8List.fromList([newId]),
            ),
          ),
        );

        // タスクIDに該当するタスクの labelId を更新
        await managers.yearlyTasks
            .filter((yearlyTask) => yearlyTask.id.equals(newId))
            .update(
              (yearlyTask) => yearlyTask(
                labelId: Value(_labeledTask!.labeledId),
              ),
            );
      });
      if (_labeledTask != null) {
        return Success(_dLabeledTask(_labeledTask!));
      }
      // transaction 内でエラーを投げると思われるが一応
      else {
        throw Exception("_labeledTask == null");
      }
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingYearlyTask");
    }
  }

  /// 日単位タスクのラベルを解除
  @override
  Future<Result<void, Exception>> unlabelDailyTask({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().dailyIdList.value];
          // targetId を remove
          idList.remove(targetId);
          // IDリストを入れ替えた record を返す
          return record(dailyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.dayTasks
            .filter((dayTask) => dayTask.id.equals(targetId))
            .update(
              (dayTask) => dayTask(
                labelId: Value(null),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "unlabelingDailyTask");
    }
  }

  /// 週単位タスクのラベルを解除
  @override
  Future<Result<void, Exception>> unlabelWeeklyTask({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().weeklyIdList.value];
          // targetId を remove
          idList.remove(targetId);
          // IDリストを入れ替えた record を返す
          return record(weeklyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.weeklyTasks
            .filter((weeklyTask) => weeklyTask.id.equals(targetId))
            .update(
              (weeklyTask) => weeklyTask(
                labelId: Value(null),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingWeeklyTask");
    }
  }

  /// 月単位タスクのラベルを解除
  @override
  Future<Result<void, Exception>> unlabelMonthlyTask({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().monthlyIdList.value];
          // targetId を remove
          idList.remove(targetId);
          // IDリストを入れ替えた record を返す
          return record(monthlyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.monthlyTasks
            .filter((monthlyTask) => monthlyTask.id.equals(targetId))
            .update(
              (monthlyTask) => monthlyTask(
                labelId: Value(null),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingMonthlyTask");
    }
  }

  /// 年単位タスクのラベルを解除
  @override
  Future<Result<void, Exception>> unlabelYearlyTask({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().yearlyIdList.value];
          // targetId を remove
          idList.remove(targetId);
          // IDリストを入れ替えた record を返す
          return record(yearlyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.yearlyTasks
            .filter((yearlyTask) => yearlyTask.id.equals(targetId))
            .update(
              (yearlyTask) => yearlyTask(
                labelId: Value(null),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingYearlyTask");
    }
  }

  /// 指定のラベルに、タスク ID を追加するメソッド
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[dTask.id]）を追加する。
  @override
  Future<Result<void, Exception>> addTaskIdToLabel({
    required int labelId,
    required DTask dTask,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // 現時点でのレコードを取得する。
        final currentRecord = await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .getSingleOrNull();
        if (currentRecord == null) {
          throw Exception("対象のラベル ID が見つかりませんでした。");
        }

        // managers.labeledTasks.update に当てはめる形
        final LabeledTasksCompanion updater;
        // タスクの種類に対応した場所に dTask.id をあてはめる
        switch (dTask) {
          // region
          case DDailyTask(id: final int taskId):
            // 取得したレコードの dailyIdList の参照のコピー
            final Uint8List? currentBlob = currentRecord.dailyIdList;
            // 拡張 codec を用いて、符号付き整数を Blob にあてはめる。
            final Uint8List? newBlob =
                (currentBlob ?? Uint8List(0)).updateWith(taskId);
            // update に返す形にあてはめる。
            updater =
                LabeledTasksCompanion(dailyIdList: Value.absentIfNull(newBlob));
          case DWeeklyTask(id: final int taskId):
            // 取得したレコードの weeklyIdList の参照のコピー
            final Uint8List? currentBlob = currentRecord.weeklyIdList;
            // 拡張 codec を用いて、符号付き整数を Blob にあてはめる。
            final Uint8List newBlob =
                (currentBlob ?? Uint8List(0)).updateWith(taskId);
            // update に返す形にあてはめる。
            updater = LabeledTasksCompanion(weeklyIdList: Value(newBlob));
          case DMonthlyTask(id: final int taskId):
            // 取得したレコードの monthlyIdList の参照のコピー
            final Uint8List? currentBlob = currentRecord.monthlyIdList;
            // 拡張 codec を用いて、符号付き整数を Blob にあてはめる。
            final Uint8List newBlob =
                (currentBlob ?? Uint8List(0)).updateWith(taskId);
            // update に返す形にあてはめる。
            updater = LabeledTasksCompanion(monthlyIdList: Value(newBlob));
          case DYearlyTask(id: final int taskId):
            // 取得したレコードの yearlyIdList の参照のコピー
            final Uint8List? currentBlob = currentRecord.yearlyIdList;
            // 拡張 codec を用いて、符号付き整数を Blob にあてはめる。
            final Uint8List newBlob =
                (currentBlob ?? Uint8List(0)).updateWith(taskId);
            // update に返す形にあてはめる。
            updater = LabeledTasksCompanion(yearlyIdList: Value(newBlob));
          // endregion
        }

        // updater を適用する
        await managers.labeledTasks
            .filter((f) => f.labeledId.equals(labelId))
            .update((_) => updater);
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "addTaskIdToLabel");
    }
  }

  /// 日単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  @override
  Future<Result<void, Exception>> addDailyTaskToLabel({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().dailyIdList.value];
          // targetId を add
          idList.add(targetId);
          // IDリストを更新した record を返す
          return record(dailyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.dayTasks
            .filter((dayTask) => dayTask.id.equals(targetId))
            .update(
              (dayTask) => dayTask(
                labelId: Value(labelId),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "addingDailyTaskToLabel");
    }
  }

  /// 週単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  @override
  Future<Result<void, Exception>> addWeeklyTaskToLabel({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().weeklyIdList.value];
          // targetId を add
          idList.add(targetId);
          // IDリストを入れ替えた record を返す
          return record(weeklyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.weeklyTasks
            .filter((weeklyTask) => weeklyTask.id.equals(targetId))
            .update(
              (weeklyTask) => weeklyTask(
                labelId: Value(labelId),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingWeeklyTask");
    }
  }

  /// 月単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  @override
  Future<Result<void, Exception>> addMonthlyTaskToLabel({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().monthlyIdList.value];
          // targetId を add
          idList.add(targetId);
          // IDリストを入れ替えた record を返す
          return record(monthlyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.monthlyTasks
            .filter((monthlyTask) => monthlyTask.id.equals(targetId))
            .update(
              (monthlyTask) => monthlyTask(
                labelId: Value(labelId),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingMonthlyTask");
    }
  }

  /// 年単位タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[targetId]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  @override
  Future<Result<void, Exception>> addYearlyTaskToLabel({
    required int labelId,
    required int targetId,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // ラベルを更新
        await managers.labeledTasks
            .filter((label) => label.labeledId.equals(labelId))
            .update((record) {
          // 元々保存されているIDリストを参照
          final idList = [...record().yearlyIdList.value];
          // targetId を add
          idList.add(targetId);
          // IDリストを入れ替えた record を返す
          return record(yearlyIdList: Value(Uint8List.fromList(idList)));
        });
        // タスクIDに該当するタスクの labelId を更新
        await managers.yearlyTasks
            .filter((yearlyTask) => yearlyTask.id.equals(targetId))
            .update(
              (yearlyTask) => yearlyTask(
                labelId: Value(labelId),
              ),
            );
      });
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingYearlyTask");
    }
  }

  /// 既存のラベルを採用した枠を作るメソッド
  ///
  /// [newIdList] は呼び出し元で管理されているキャッシュを代入すること。
  @override
  Future<Result<void, Exception>> addDailyTaskInLabel(
      {required List<int> newIdList})
  // 折りたたみ用
  async {
    try {
      await managers.labeledTasks.update((record) => record(
            dailyIdList: Value(Uint8List.fromList(newIdList)),
          ));
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "addDailyTaskInLabel");
    }
  }

  @override
  // todo スキーマバージョン
  int get schemaVersion => 21;

  // todo 統合処理 ＜＜　重いかも
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // if (from < 17) {
        //   await transaction(() async {
        //     print("${from} → ${to} のマイグレーション中");
        //     await m.addColumn(weeklyTasks, weeklyTasks.month);
        //     print("${from} → ${to} のマイグレーションが完了");
        //   });
        // }
        if (from < 18) {
          await transaction(() async {
            print("${from} → ${to} のマイグレーション中");
            await m.createTable(labeledTasks);
            print("${from} → ${to} のマイグレーションが完了");
          });
        }
        if (from < 19) {
          await transaction(() async {
            print("${from} → ${to} のマイグレーション中");
            await m.alterTable(
              // 変更をトリガーとした処理や外部キーによる参照などを考慮できないという警告
              TableMigration(
                dayTasks, // 対象のテーブル
                columnTransformer: {
                  // date カラムのデータを変換する処理を記述
                  dayTasks.date: CustomExpression<int>(
                      // SQLiteの関数を使って、既存のStringからハイフンを除去してintにキャスト
                      'CAST(REPLACE(date, "-", "") AS INTEGER)'),
                },
              ),
            );
            print("${from} → ${to} のマイグレーションが完了");
          });
        }
        if (from < 20) {
          await transaction(() async {
            print("${from} → ${to} のマイグレーション中");
            await m.alterTable(
              // 変更をトリガーとした処理や外部キーによる参照などを考慮できないという警告
              TableMigration(
                weeklyTasks, // 対象のテーブル
                columnTransformer: {
                  // date カラムのデータを変換する処理を記述
                  weeklyTasks.firstDate: CustomExpression<int>(
                      // SQLiteの関数を使って、既存のStringからハイフンを除去してintにキャスト
                      'CAST(REPLACE(week, "-", "") AS INTEGER)'),
                },
              ),
            );
            print("${from} → ${to} のマイグレーションが完了");
          });
        }
        if (from < 21) {
          await transaction(() async {
            print("${from} → ${to} のマイグレーション中");
            await m.addColumn(dayTasks, dayTasks.labelId);
            await m.addColumn(weeklyTasks, weeklyTasks.labelId);
            await m.addColumn(monthlyTasks, monthlyTasks.labelId);
            await m.addColumn(yearlyTasks, yearlyTasks.labelId);
            print("${from} → ${to} のマイグレーションが完了");
          });
        }
        // if (from < 2) {
        //   await m.addColumn(dayTasks, dayTasks.id);
        // }
        // if (from < 3) {
        //   await m.alterTable(TableMigration(dayTasks));
        // }
        // if (from < 4) {
        //   await m.addColumn(dayTasks, dayTasks.isChecked);
        // }
        // if (from < 5) {
        //   await m.alterTable(TableMigration(themeColorTables));
        // }
        // if (from < 6) {
        //   await m.alterTable(TableMigration(themeColorTables));
        // }
        // if (from < 7) {
        //   await m.addColumn(themeColorTables, themeColorTables.primaryNum);
        //   await m.addColumn(themeColorTables, themeColorTables.onPrimaryNum);
        //   await m.addColumn(themeColorTables, themeColorTables.isLight);
        // }
        // if (from < 8) {
        //   await m.createTable(themeColorTables);
        // }
        // if (from < 9) {
        //   await m.createTable(themeColorTables);
        // }
        // if (from < 10) {
        //   await m.createTable(themeColorTables);
        // }
        // if (from < 13) {
        //   await m.createTable(weeklyTasks);
        //   await m.createTable(monthlyTasks);
        //   await m.createTable(yearlyTasks);
        // }
        // if (from < 14) {
        //   await m.addColumn(weeklyTasks, weeklyTasks.firstDay);
        // }
        // if (from < 15) {
        //   await m.addColumn(dayTasks, dayTasks.result);
        //   await m.addColumn(dayTasks, dayTasks.improvement);
        //   await m.addColumn(weeklyTasks, weeklyTasks.result);
        //   await m.addColumn(weeklyTasks, weeklyTasks.improvement);
        //   await m.addColumn(monthlyTasks, monthlyTasks.result);
        //   await m.addColumn(monthlyTasks, monthlyTasks.improvement);
        //   await m.addColumn(yearlyTasks, yearlyTasks.result);
        //   await m.addColumn(yearlyTasks, yearlyTasks.improvement);
        // }
      },
    );
  }
}

/// todo printメソッド [database.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[database.dart]　" + s1);
    if (s2 != null) print("[database.dart]　" + s2);
    if (s3 != null) print("[database.dart]　" + s3);
    if (s4 != null) print("[database.dart]　" + s4);
    if (s5 != null) print("[database.dart]　" + s5);
    print("");
  }
}
