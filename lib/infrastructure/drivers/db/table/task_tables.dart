

import 'package:drift/drift.dart';

/// 日単位のタスク
class DayTasks extends Table {
  TextColumn get task => text()();

  // 2026/06/08 変更: String => int
  IntColumn get date => integer()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  // todo デフォルトの追加（2026/09/16）＞＞
  IntColumn get labelId => integer().withDefault(Constant(-1))();

  @override
  Set<Column> get primaryKey => {id};
}

/// 週単位のタスク
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

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  IntColumn get labelId => integer().withDefault(Constant(-1))();
}

/// 月単位のタスク
class MonthlyTasks extends Table {
  TextColumn get task => text()();

  IntColumn get month => integer()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  IntColumn get labelId => integer().withDefault(Constant(-1))();
}

/// 年単位のタスク
class YearlyTasks extends Table {
  TextColumn get task => text()();

  IntColumn get year => integer()();

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isChecked => boolean().withDefault(Constant(false))();

  // 2026/06/30 追加: ラベルID（ラベル化の際に追加）
  IntColumn get labelId => integer().withDefault(Constant(-1))();
}