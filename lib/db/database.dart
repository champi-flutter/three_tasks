import 'dart:ui';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/entities/data_type/d_date.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/data_type/d_labeled_task.dart';
import 'package:three_tasks/gateways/data_source_interface/data_source.dart';
import 'package:three_tasks/main.dart';

import '../view/screens/history_screen.dart';
import '../view/screens/weekly_tasks_screen.dart';

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
}

// 1ヶ月のタスク
class MonthlyTasks extends Table {
  TextColumn get task => text()();

  TextColumn get month => text()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  TextColumn get result => text().nullable()();

  TextColumn get improvement => text().nullable()();
}

// 1年間のタスク
class YearlyTasks extends Table {
  TextColumn get task => text()();

  TextColumn get year => text()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  TextColumn get result => text().nullable()();

  TextColumn get improvement => text().nullable()();
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
        taskId: rawData.labeledId,
        dailyIdList: rawData.dailyIdList,
        weeklyIdList: rawData.weeklyIdList,
        monthlyIdList: rawData.monthlyIdList,
        yearlyIdList: rawData.yearlyIdList,
      );
    }).toList();
  }

  /// [DayTask]（テーブルクラス）から [DDayTask]（エンティティ）へ変換
  DDayTask _dDayTask(DayTask rawData) {
    return DDayTask(
      task: rawData.task,
      // 2026/06/08 変更: カラムの型の変換に対応
      date: rawData.date.toDate(),
      id: rawData.id,
      isChecked: rawData.isChecked,
    );
  }

  /// [DayTask]（テーブルクラス）の List から [DDayTask]（エンティティ）の
  /// List へ変換
  List<DDayTask> _dDayTaskList(List<DayTask> rawDataList) {
    return [...rawDataList]
        .map((DayTask rawData) => _dDayTask(rawData))
        .toList();
  }

  /// [WeeklyTask]（テーブルクラス）から [DWeeklyTask]（エンティティ）へ変換
  DWeeklyTask _dWeeklyTask(WeeklyTask rawData) {
    final Date targetDate = rawData.firstDate.toDate();
    return DWeeklyTask(
      task: rawData.task,
      week: UniqueWeek.fromDate(
        currentDate: targetDate,
        firstDate: targetDate,
      ),
      id: rawData.id,
      isChecked: rawData.isChecked,
    );
  }

  /// [WeeklyTask]（テーブルクラス）の List から [DDayTask]（エンティティ）の
  /// List へ変換
  List<DWeeklyTask> _dWeeklyTaskList(List<WeeklyTask> rawDataList) {
    return [...rawDataList]
        .map((WeeklyTask rawData) => _dWeeklyTask(rawData))
        .toList();
  }

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
  Future<Result<Map<Date, List<DDayTask>>, Exception>> getDayTasksByDate({
    required List<Date> dateList,
  })
  // 折りたたみ用
  async {
    try {
      final Map<Date, List<DDayTask>> resultValue = {};
      // transaction で、要求された日付のデータを一気に取得
      await transaction(() async {
        for (Date date in dateList) {
          // 2026/06/08 変更: カラムの型の変換に対応
          final int dateIdentifier = date.toIntIdentifier();
          // DB から該当日付のタスクを取得
          final List<DayTask> rawDataList = await managers.dayTasks
              .filter((dayTask) => dayTask.date(dateIdentifier))
              .get();

          // そのリストを、各日付を key にして Map に組み込む（リストが空の場合も）
          resultValue[date] = [..._dDayTaskList(rawDataList)];
        }
      });
      return Success(resultValue);
    } catch (e) {
      return Failure(Exception(e), methodName: "getDayTasksByDate");
    }
  }

  /// `WeeklyTask` フェッチメソッド
  ///
  /// 要求された日付（[targetDate]）に該当するデータを返す。
  @override
  Future<Result<List<DWeeklyTask>, Exception>> getWeeklyTasksByDate({
    required List<Date> firstDateList,
  })
  // 折りたたみ用
  async {
    try {
      final List<DWeeklyTask> resultValue = [];
      // transaction で、要求された日付のデータを一気に取得
      await transaction(() async {
        for (Date firstDate in firstDateList) {
          // カラムの型の変換に対応
          final int dateIdentifier = firstDate.toIntIdentifier();
          // DB から該当日付のタスクを取得
          final List<WeeklyTask> rawDataList = await managers.weeklyTasks
              .filter((weeklyTask) => weeklyTask.firstDate(dateIdentifier))
              .get();

          // そのリストを、戻り値に組み込む（リストが空の場合も）
          resultValue.addAll([..._dWeeklyTaskList(rawDataList)]);
        }
      });
      return Success(resultValue);
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
  Future<List<DayTask>> get allTasksNotAchieved =>
      managers.dayTasks
          .filter((f) => f.isChecked(false))
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
  Future<Result<Map<Date, List<DDayTask>>, Exception>> createDailyTaskRecord({
    required List<Date> dateList,
  })
  // 折りたたみ用
  async {
    try {
      // 返す Map の枠
      final Map<Date, List<DDayTask>> dataMap = {};
      // 指定した各日付のタスクのリストを取得
      await transaction(() async {
        for (Date date in dateList) {
          // 作成するタスクの枠
          final List<DayTask> rawDataList = [];
          // 空のタスクを3つ作る
          for (int i = 0; i < 3; i++) {
            final DayTask rawData =
            await managers.dayTasks.createReturning((record) =>
                record(
                  task: "",
                  // 2026/06/08 変更: カラムの型の変換に対応
                  date: date.toIntIdentifier(),
                ));
            rawDataList.add(rawData);
          }
          // 作ったタスクリストを Map の対象日に組み込む
          dataMap[date] = [..._dDayTaskList(rawDataList)];
        }
      });
      return Success({...dataMap});
    } catch (e) {
      return Failure(Exception(e), methodName: "createDailyTaskRecord");
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

  /// タイプ（日単位、週単位、など）別でタスクタイトルを保存するメソッド
  ///
  /// sealed class の網羅性を使って条件分岐する。
  Future<void> _saveDTaskTitle({required DTask newDTask}) async {
    try {
      switch (newDTask) {
        case DDayTask(task: final String? taskTitle, id: final int id, ):
        // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.dayTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
                  task: Value(taskTitle),
                ),
          );
        case DWeeklyTask(task: final String? taskTitle, id: final int id, ):
        // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.weeklyTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
                  task: Value(taskTitle),
                ),
          );
        case DMonthlyTask(task: final String? taskTitle, id: final int id, ):
        // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.monthlyTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
                  task: Value(taskTitle),
                ),
          );
        case DYearlyTask(task: final String? taskTitle, id: final int id, ):
        // ここで taskTitle が null なら例外を投げる
          if (taskTitle == null) {
            throw Exception("taskTitle == null");
          }
          await managers.yearlyTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
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
        case DDayTask(isChecked: final bool? newChecked, id: final int id, ):
        // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.dayTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
                  isChecked: Value(newChecked),
                ),
          );
        case DWeeklyTask(isChecked: final bool? newChecked, id: final int id, ):
        // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.weeklyTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
                  isChecked: Value(newChecked),
                ),
          );
        case DMonthlyTask(isChecked: final bool? newChecked, id: final int id, ):
        // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.monthlyTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
                  isChecked: Value(newChecked),
                ),
          );
        case DYearlyTask(isChecked: final bool? newChecked, id: final int id, ):
        // ここで newChecked が null なら例外を投げる
          if (newChecked == null) {
            throw Exception("newChecked == null");
          }
          await managers.yearlyTasks
              .filter((dayTask) => dayTask.id(id))
              .update(
                (task) =>
                task(
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
  Future<void> deleteDayTask(DayTask unnecessaryDayTask) {
    // ややこしいので省略しないが、「=>』と同じ意味
    return managers.dayTasks
        .filter(
          (f) => f.task(unnecessaryDayTask.task),
    )
        .delete();
  }

  // todo weeklyTasksのクエリメソッド
  // Create（レコードの作成）
  Future addWeeklyTask(WeeklyTask weeklyTask) =>
      into(weeklyTasks).insert(weeklyTask);

  // 複数レコードの作成
  Future addBatchWeeklyTasks(List<WeeklyTask> weeklyTaskList) =>
      batch(
            (batch) => batch.insertAll(weeklyTasks, weeklyTaskList),
      );

  //ID自動生成レコードの作成
  Future addWeeklyTaskCompanion(WeeklyTasksCompanion weeklyTasksCompanion) =>
      into(weeklyTasks).insert(weeklyTasksCompanion);

  // ID自動生成レコードの複数作成
  Future addBatchWeeklyTaskCompanions(
      List<WeeklyTasksCompanion> weeklyTaskCompanionList) =>
      batch(
            (batch) => batch.insertAll(weeklyTasks, weeklyTaskCompanionList),
      );

  // Read（抽出）
  // managerが管理する全てのデータベース（）の中から対象のデータベース（）を取得する
  Future<List<WeeklyTask>> get allWeeklyTasks => managers.weeklyTasks.get();

  // 今週のタスクだけを抽出
  Future<List<WeeklyTask>> get allTasksForThisWeek {
    return managers.weeklyTasks
        .filter((f) => f.month(now.month))
        .filter((f) =>
        f.firstDay.isBetween(
          now.day - 7,
          now.day,
        ))
        .get();
  }

  // 今週が先月を含む場合のタスクの抽出
  Future<List<WeeklyTask>> get allTasksForEndingWeek {
    // todo 月末の場合
    return managers.weeklyTasks
        .filter((f) => f.month(now.month - 1))
        .filter((f) =>
        f.firstDay.isBetween(
          DateTime(now.year, now.month, now.day)
              .add(Duration(days: -7))
              .day,
          DateTime(now.year, now.month, 1)
              .add(Duration(days: -1))
              .day,
        ))
        .get();
  }

  // 先週のタスクだけを抽出
  // firstDayがfirstDay（履歴画面）より前で、一番大きいものを抽出
  Future<List<WeeklyTask>> get allTasksForLastWeek =>
      managers.weeklyTasks
          .filter((f) => f.month(now.month))
          .filter(
            (f) =>
            f.firstDay.isBetween(
              1,
              firstDay - 1,
            ),
      )
          .orderBy((o) => o.firstDay.desc())
          .limit(3)
          .get();

  // 先々週のタスクを抽出
  Future<List<WeeklyTask>> get allTasksForWeekBeforeLast =>
      managers.weeklyTasks
          .filter(
            (f) =>
            f.firstDay.isBetween(
              firstDay - 16,
              firstDay - 9,
            ),
      )
          .get();

  // カレンダーで選択された週のタスクを抽出
  Future<List<WeeklyTask>> get allTasksForTheWeek {
    print("カレンダーで選択された週のタスクを抽出: ${theDay.month}月${theDay
        .day}日");
    if (theDay.day > 7) {
      return managers.weeklyTasks
          .filter((f) => f.month(theDay.month))
          .filter(
            (f) =>
            f.firstDay.isBetween(
              theDay.day - 7,
              theDay.day,
            ),
      )
          .get();
    } else {
      // 翌月（12月の翌月を考慮）
      final followingMonth = theDay.month != 12 ? theDay.month + 1 : 1;
      // 今月の日数
      final numOfThisMonth =
          DateTime(theDay.year, followingMonth, 1)
              .add(Duration(days: -1))
              .day;
      // 先月の日数
      final int numOfLastMonth =
          DateTime(theDay.year, theDay.month, 1)
              .add(Duration(days: -1))
              .day;
      // 先月
      final int intLastMonth =
          theDay
              .add(Duration(days: -numOfLastMonth))
              .month;
      return managers.weeklyTasks.filter((f) {
        print(
            "(4) numOfLastMonth = ${numOfLastMonth}, f.firstDay.isBetween(1,7).isLiteral = ${f
                .firstDay
                .isBetween(1, 7)
                .isLiteral}");

        if (f.firstDay
            .isBetween(1, 7)
            .isLiteral) {
          return f.month(theDay.month);
        } else {
          return f.month(intLastMonth);
        }

        // if (f.month == intLastMonth) {
        //   return f.month.equals(intLastMonth);
        // } else if (f.month == theDay.month) {
        //   return f.month.equals(theDay.month);
        // }

        // return f.month.isBetween(intLastMonth, theDay.month);
      }).filter((f) {
        print("(7) firstDayが${theDay.month}月か");
        // firstDayが今月か先月かで場合分け
        if (f.month == theDay.month) {
          print(
              "(6) はい。firstDayが今月（${intLastMonth}月)の1から${theDay
                  .day}までか => (2)");
          return f.firstDay.isBetween(
            1,
            theDay.day,
          );
        } else {
          print(
              "(5) いいえ。firstDayが先月（${intLastMonth}月)の${numOfLastMonth -
                  6 + theDay.day}から${numOfLastMonth}までか => (2)");
          return f.firstDay.isBetween(
            numOfLastMonth - 6 + theDay.day,
            numOfLastMonth,
          );
        }
      }).get();
    }
  }

  // 達成されなかったタスクを抽出
  Future<List<WeeklyTask>> get allWeeklyTasksNotAchieved =>
      managers.weeklyTasks
          .filter((f) => f.isChecked(false))
          .orderBy((o) => o.week.asc())
          .get();

  // Update（更新）
  // 指定したデータ行（）を古いデータと置き換える
  Future<void> updateWeeklyTask(WeeklyTask weeklyTaskUpdated) =>
      managers.weeklyTasks.replace(weeklyTaskUpdated);

  // Delete（削除）
  // 指定したデータ行を削除する
  // filterでは対象のweekTaskのtaskが指定したデータベースと一致するかどうかでフィルタリングし、削除
  Future<void> deleteWeeklyTask(WeeklyTask unnecessaryWeeklyTask) {
    // ややこしいので省略しないが、「=>』と同じ意味
    return managers.weeklyTasks
        .filter(
          (f) => f.task(unnecessaryWeeklyTask.task),
    )
        .delete();
  }

  // todo monthlyTasksのクエリメソッド
  // Create（レコードの作成）
  Future addMonthlyTask(MonthlyTask monthlyTask) =>
      into(monthlyTasks).insert(monthlyTask);

  // 複数レコードの作成
  Future addBatchMonthlyTasks(List<MonthlyTask> monthlyTaskList) =>
      batch(
            (batch) => batch.insertAll(monthlyTasks, monthlyTaskList),
      );

  // ID自動生成レコードの作成
  Future addMonthlyTaskCompanion(MonthlyTasksCompanion monthlyTasksCompanion) =>
      into(monthlyTasks).insert(monthlyTasksCompanion);

  // ID自動生成レコードの複数作成
  Future addBatchMonthlyTaskCompanions(
      List<MonthlyTasksCompanion> monthlyTaskCompanionList) =>
      batch(
            (batch) => batch.insertAll(monthlyTasks, monthlyTaskCompanionList),
      );

  // Read（抽出）
  // managerが管理する全てのデータベース（）の中から対象のデータベース（）を取得する
  Future<List<MonthlyTask>> get allMonthlyTasks => managers.monthlyTasks.get();

  // 今月のタスクだけを抽出
  Future<List<MonthlyTask>> get allTasksForThisMonth =>
      managers.monthlyTasks.filter((f) => f.month(thisMonth)).get();

  // 先月のタスクだけを抽出
  Future<List<MonthlyTask>> get allTasksForLastMonth =>
      managers.monthlyTasks
          .filter(
            (f) =>
            f.month(
              monthlyOutputFormat.format(DateTime(now.year, now.month - 1, 1)),
            ),
      )
          .get();

  // カレンダーで選択された日付のタスクを抽出
  Future<List<MonthlyTask>> get allTasksForTheMonth =>
      managers.monthlyTasks
          .filter((f) => f.month(monthlyOutputFormat.format(theDay)))
          .get();

  // 達成されなかったタスクを抽出
  Future<List<MonthlyTask>> get allMonthlyTasksNotAchieved =>
      managers.monthlyTasks
          .filter((f) => f.isChecked(false))
          .orderBy((o) => o.month.asc())
          .get();

  // Update（更新）
  // 指定したデータ行（）を古いデータと置き換える
  Future<void> updateMonthlyTask(MonthlyTask monthlyTaskUpdated) =>
      managers.monthlyTasks.replace(monthlyTaskUpdated);

  // Delete（削除）
  // 指定したデータ行を削除する
  // filterでは対象のmonthTaskのtaskが指定したデータベースと一致するかどうかでフィルタリングし、削除
  Future<void> deleteMonthlyTask(MonthlyTask unnecessaryMonthlyTask) {
    // ややこしいので省略しないが、「=>』と同じ意味
    return managers.monthlyTasks
        .filter(
          (f) => f.task(unnecessaryMonthlyTask.task),
    )
        .delete();
  }

  // todo yearlyTasksのクエリメソッド
  // Create（レコードの作成）
  Future addYearlyTask(YearlyTask yearlyTask) =>
      into(yearlyTasks).insert(yearlyTask);

  // 複数レコードの作成
  Future addBatchYearlyTasks(List<YearlyTask> yearlyTaskList) =>
      batch(
            (batch) => batch.insertAll(yearlyTasks, yearlyTaskList),
      );

  // ID自動生成レコードの作成
  Future addYearlyTaskCompanion(YearlyTasksCompanion yearlyTasksCompanion) =>
      into(yearlyTasks).insert(yearlyTasksCompanion);

  // ID自動生成レコードの複数作成
  Future addBatchYearlyTaskCompanions(
      List<YearlyTasksCompanion> yearlyTaskCompanionList) =>
      batch(
            (batch) => batch.insertAll(yearlyTasks, yearlyTaskCompanionList),
      );

  // Read（抽出）
  // managerが管理する全てのデータベース（）の中から対象のデータベース（）を取得する
  Future<List<YearlyTask>> get allYearlyTasks => managers.yearlyTasks.get();

  // 今年のタスクだけを抽出
  Future<List<YearlyTask>> get allTasksForThisYear =>
      managers.yearlyTasks.filter((f) => f.year(thisYear)).get();

  // 去年のタスクを抽出
  Future<List<YearlyTask>> get allTasksForLastYear =>
      managers.yearlyTasks
          .filter(
            (f) => f.year(yearlyOutputFormat.format(DateTime(now.year - 1))),
      )
          .get();

  // カレンダーで選択された日付のタスクを抽出
  Future<List<YearlyTask>> get allTasksForTheYear =>
      managers.yearlyTasks
          .filter((f) => f.year(yearlyOutputFormat.format(theDay)))
          .get();

  // 達成されなかったタスクを抽出
  Future<List<YearlyTask>> get allYearlyTasksNotAchieved =>
      managers.yearlyTasks
          .filter((f) => f.isChecked(false))
          .orderBy((o) => o.year.asc())
          .get();

  // Update（更新）
  // 指定したデータ行（）を古いデータと置き換える
  Future<void> updateYearlyTask(YearlyTask yearlyTaskUpdated) =>
      managers.yearlyTasks.replace(yearlyTaskUpdated);

  // Delete（削除）
  // 指定したデータ行を削除する
  // filterでは対象のyearlyTaskのtaskが指定したデータベースと一致するかどうかでフィルタリングし、削除
  Future<void> deleteYearlyTask(YearlyTask unnecessaryYearlyTask) {
    // ややこしいので省略しないが、「=>』と同じ意味
    return managers.yearlyTasks
        .filter(
          (f) => f.task(unnecessaryYearlyTask.task),
    )
        .delete();
  }

  /// 日単位タスクをラベリング
  @override
  Future<Result<void, Exception>> labelDailyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      await managers.labeledTasks.create((record) =>
          record(
              label: label, dailyIdList: Value(Uint8List.fromList([newId]))));
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingDailyTask");
    }
  }

  /// 日単位タスクをラベリング
  @override
  Future<Result<void, Exception>> labelWeeklyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      await managers.labeledTasks.create((record) =>
          record(
              label: label, weeklyIdList: Value(Uint8List.fromList([newId]))));
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingWeeklylyTask");
    }
  }

  /// 日単位タスクをラベリング
  @override
  Future<Result<void, Exception>> labelMonthlyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      await managers.labeledTasks.create((record) =>
          record(
              label: label, monthlyIdList: Value(Uint8List.fromList([newId])),
          )
      );
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingMonthlyTask");
    }
  }

  /// 日単位タスクをラベリング
  @override
  Future<Result<void, Exception>> labelYearlyTask({
    required String label,
    required int newId,
  })
  // 折りたたみ用
  async {
    try {
      await managers.labeledTasks.create((record) =>
          record(
              label: label, yearlyIdList: Value(Uint8List.fromList([newId]))));
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "labelingYearlyTask");
    }
  }

  // todo 週単位、月単位、年単位のラベリング（2026/06/01）＞＞

  /// 既存のラベルを採用した枠を作るメソッド
  ///
  /// [newIdList] は呼び出し元で管理されているキャッシュを代入すること。
  @override
  Future<Result<void, Exception>> addDailyTaskInLabel(
      {required List<int> newIdList})
  // 折りたたみ用
  async {
    try {
      await managers.labeledTasks.update((record) =>
          record(
            dailyIdList: Value(Uint8List.fromList(newIdList)),
          ));
      return Success(null);
    } catch (e) {
      return Failure(Exception(e), methodName: "addDailyTaskInLabel");
    }
  }

  @override
  // todo スキーマバージョン
  int get schemaVersion => 20;

  // todo 統合処理 ＜＜　重いかも
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 17) {
          await transaction(() async {
            print("${from} → ${to} のマイグレーション中");
            await m.addColumn(weeklyTasks, weeklyTasks.month);
            print("${from} → ${to} のマイグレーションが完了");
          });
        }
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
                      'CAST(REPLACE(date, "-", "") AS INTEGER)'
                  ),
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
                      'CAST(REPLACE(week, "-", "") AS INTEGER)'
                  ),
                },
              ),
            );
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
