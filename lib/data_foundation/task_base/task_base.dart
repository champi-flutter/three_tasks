

import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

/// タスク共通のデータ構造
abstract class TaskBase {

  /// タスクタイトル
  String? get title;

  /// 一意の識別子
  int get id;

  /// チェックされているかどうか
  bool? get isChecked;

  /// 登録されているラベルの ID
  ///
  /// ラベル未登録の状態を null => -1 に変更
  int? get labelId;

  /// タスクの期間の単位
  TaskRec get rec;
}

/// 日単位タスクのデータ構造
abstract mixin class DailyTaskBase implements TaskBase {
  Date get date;

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.day;
}

/// 週単位タスクのデータ構造
abstract mixin class WeeklyTaskBase implements TaskBase {
  UniqueWeek get week;

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.week;
}

/// 月単位タスクのデータ構造
abstract mixin class MonthlyTaskBase implements TaskBase {
  Month get month;

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.month;
}

/// 年単位タスクのデータ構造
abstract mixin class YearlyTaskBase implements TaskBase {
  int get year;

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.year;
}