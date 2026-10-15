


import 'package:drift/drift.dart';

/// 2026/09/11 追加: 各 Tasks の [result] と [improvement] を別のテーブルで管理する
class Reviews extends Table {
  /// 64ビット整数の上位 32 bit にテーブル種別を、下位 32 bit にタスクIDを、
  /// ビットパッキングして格納するカラム
  ///
  /// 【テーブル種別】
  ///  - [DayTasks]: 1 （1）
  ///  - [WeeklyTasks]: 2 （10）
  ///  - [MonthlyTasks]: 3 （11）
  ///  - [YearlyTasks]: 4 （100）
  IntColumn get taskIdBit => integer()();

  TextColumn get result => text().nullable()();

  TextColumn get improvement => text().nullable()();
}