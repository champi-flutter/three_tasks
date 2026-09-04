

// enum側に表示用文字列を定義しておく
import 'package:three_tasks/enum/task_recurrence.dart';

extension TaskTypeExtension on TaskRec {
  /// [TaskRec] に応じた文字ラベル
  String get currentLabel => switch (this) {
    TaskRec.day => "今日",
    TaskRec.week => "今週",
    TaskRec.month => "今月",
    TaskRec.year => "今年",
  };

  /// [TaskStyle] に応じた文字ラベル
  String get previousLabel => switch (this) {
    TaskRec.day => "昨日",
    TaskRec.week => "先週",
    TaskRec.month => "先月",
    TaskRec.year => "去年",
  };
}

extension TaskIndex on int{
  /// インデックス（[int]）を [TaskRec] に変換
  ///  - 0 => [TaskRec.day],
  ///  - 1 => [TaskRec.week],
  ///  - 2 => [TaskRec.month],
  ///  - 3 => [TaskRec.year],
  TaskRec get taskRec {
    assert(this>=0&&this<=3, "無効なインデックスです。（TaskIndex）");
    return switch(this){
      0 => TaskRec.day,
      1 => TaskRec.week,
      2 => TaskRec.month,
      3 => TaskRec.year,
    // 網羅性のために記述するが、assert で例外になる
    _=>TaskRec.day,
    };
  }
}