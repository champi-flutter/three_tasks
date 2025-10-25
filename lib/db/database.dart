import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/screens/history_screen.dart';
import 'package:three_tasks/screens/week_tasks.dart';

part 'database.g.dart';

// 1日のタスク
class DayTasks extends Table {
  TextColumn get task => text()();

  TextColumn get date => text()();

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

  TextColumn get week => text()();

  IntColumn get month => integer().withDefault(Constant(now.month))();

  IntColumn get firstDay => integer()();

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

@DriftDatabase(tables: [
  DayTasks,
  WeeklyTasks,
  MonthlyTasks,
  YearlyTasks,
])
class MyDatabase extends _$MyDatabase {
  // データベースをどこに保存するかをDriftに伝えるリダイレクトコンストラクタ
  MyDatabase() : super(_openConnection());

  static QueryExecutor _openConnection() {
    // todo 拡張子抜きのデータベース名
    return driftDatabase(name: "tasks");
  }

  // 統合処理とスキーマバージョンアップをしてなかった（R7/02/14）

  @override
  // todo スキーマバージョン
  int get schemaVersion => 17;

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

  // todo dayTasksのクエリメソッド
  // Create（レコードの作成）
  Future addDayTask(DayTask dayTask) => into(dayTasks).insert(dayTask);

  // Read（抽出）
  // managerが管理する全てのデータベース（）の中から対象のデータベース（）を取得する
  Future<List<DayTask>> get allDayTasks => managers.dayTasks.get();

  // 今日のタスクだけを抽出
  Future<List<DayTask>> get allTasksForToday =>
      managers.dayTasks.filter((f) => f.date(today)).get();

  // 明日のタスクだけを抽出
  Future<List<DayTask>> get allTasksForTomorrow =>
      managers.dayTasks.filter((f) => f.date(tomorrow)).get();

  // 昨日のタスクだけを抽出
  Future<List<DayTask>> get allTasksForYesterday => managers.dayTasks
      .filter((f) => f.date(outputFormat.format(now.add(Duration(days: -1)))))
      .get();

  // カレンダーで選択された日付のタスクを抽出
  Future<List<DayTask>> get allTasksForTheDay => managers.dayTasks
      .filter((f) => f.date(outputFormat.format(theDay)))
      .get();

  // 達成されなかったタスクを抽出
  Future<List<DayTask>> get allTasksNotAchieved => managers.dayTasks
      .filter((f) => f.isChecked(false))
      .orderBy((o) => o.date.asc())
      .get();

  // Update（更新）
  // 指定したデータ行（）を古いデータと置き換える
  Future<void> updateDayTask(DayTask dayTaskUpdated) =>
      managers.dayTasks.replace(dayTaskUpdated);

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
  Future addBatchWeeklyTasks(List<WeeklyTask> weeklyTaskList) => batch(
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
        .filter((f) => f.firstDay.isBetween(
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
        .filter((f) => f.firstDay.isBetween(
              DateTime(now.year, now.month, now.day)
                  .add(Duration(days: -7))
                  .day,
              DateTime(now.year, now.month, 1).add(Duration(days: -1)).day,
            ))
        .get();
  }

  // 先週のタスクだけを抽出
  // firstDayがfirstDay（履歴画面）より前で、一番大きいものを抽出
  Future<List<WeeklyTask>> get allTasksForLastWeek => managers.weeklyTasks
      .filter((f) => f.month(now.month))
      .filter(
        (f) => f.firstDay.isBetween(
          1,
          firstDay - 1,
        ),
      )
      .orderBy((o) => o.firstDay.desc())
      .limit(3)
      .get();

  // 先々週のタスクを抽出
  Future<List<WeeklyTask>> get allTasksForWeekBeforeLast => managers.weeklyTasks
      .filter(
        (f) => f.firstDay.isBetween(
          firstDay - 16,
          firstDay - 9,
        ),
      )
      .get();

  // カレンダーで選択された週のタスクを抽出
  Future<List<WeeklyTask>> get allTasksForTheWeek {
    print(
        "カレンダーで選択された週のタスクを抽出: ${theDay.month}月${theDay.day}日");
    if (theDay.day > 7) {
      return managers.weeklyTasks
          .filter((f) => f.month(theDay.month))
          .filter(
            (f) => f.firstDay.isBetween(
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
          DateTime(theDay.year, followingMonth, 1).add(Duration(days: -1)).day;
      // 先月の日数
      final int numOfLastMonth =
          DateTime(theDay.year, theDay.month, 1).add(Duration(days: -1)).day;
      // 先月
      final int intLastMonth =
          theDay.add(Duration(days: -numOfLastMonth)).month;
      return managers.weeklyTasks.filter((f) {
        print("(4) numOfLastMonth = ${numOfLastMonth}, f.firstDay.isBetween(1,7).isLiteral = ${f.firstDay.isBetween(1,7).isLiteral}");

        if (f.firstDay.isBetween(1,7).isLiteral) {
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
          print("(6) はい。firstDayが今月（${intLastMonth}月)の1から${theDay.day}までか => (2)");
          return f.firstDay.isBetween(
            1,
            theDay.day,
          );
        } else {
          print("(5) いいえ。firstDayが先月（${intLastMonth}月)の${numOfLastMonth - 6 + theDay.day}から${numOfLastMonth}までか => (2)");
          return f.firstDay.isBetween(
            numOfLastMonth - 6 + theDay.day,
            numOfLastMonth,
          );
        }
      }).get();
    }
  }

  // 達成されなかったタスクを抽出
  Future<List<WeeklyTask>> get allWeeklyTasksNotAchieved => managers.weeklyTasks
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
  Future addBatchMonthlyTasks(List<MonthlyTask> monthlyTaskList) => batch(
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
  Future<List<MonthlyTask>> get allTasksForLastMonth => managers.monthlyTasks
      .filter(
        (f) => f.month(
          monthlyOutputFormat.format(DateTime(now.year, now.month - 1, 1)),
        ),
      )
      .get();

  // カレンダーで選択された日付のタスクを抽出
  Future<List<MonthlyTask>> get allTasksForTheMonth => managers.monthlyTasks
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
  Future addBatchYearlyTasks(List<YearlyTask> yearlyTaskList) => batch(
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
  Future<List<YearlyTask>> get allTasksForLastYear => managers.yearlyTasks
      .filter(
        (f) => f.year(yearlyOutputFormat.format(DateTime(now.year - 1))),
      )
      .get();

  // カレンダーで選択された日付のタスクを抽出
  Future<List<YearlyTask>> get allTasksForTheYear => managers.yearlyTasks
      .filter((f) => f.year(yearlyOutputFormat.format(theDay)))
      .get();

  // 達成されなかったタスクを抽出
  Future<List<YearlyTask>> get allYearlyTasksNotAchieved => managers.yearlyTasks
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
}
