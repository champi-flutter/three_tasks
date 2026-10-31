

import 'package:drift/drift.dart';

/// タスクテーブルの共通部分
abstract class Tasks extends Table {
  TextColumn get title => text()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  IntColumn get labelId => integer().withDefault(Constant(-1))();

  TextColumn get result => text().nullable()();

  TextColumn get next => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 日単位のタスク
class DayTasks extends Tasks {
  // 2026/06/08 変更: String => int
  IntColumn get date => integer()();
}

/// 週単位のタスク
class WeeklyTasks extends Tasks {

  // 2026/06/08 変更: firstDate のみに変更
  IntColumn get firstDate => integer()();
}

/// 月単位のタスク
class MonthlyTasks extends Tasks {
  IntColumn get month => integer()();
}

/// 年単位のタスク
class YearlyTasks extends Tasks {
  IntColumn get year => integer()();
}