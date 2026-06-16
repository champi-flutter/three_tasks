

// todo 要改善（2026/06/10）＞＞
enum TaskType { day, week, month, year }

// enum側に表示用文字列を定義しておく
extension TaskTypeLabel on TaskType {
  /// [TaskType] に応じた文字ラベル
  String get currentLabel => switch (this) {
    TaskType.day => "今日",
    TaskType.week => "今週",
    TaskType.month => "今月",
    TaskType.year => "今年",
  };

  /// [TaskStyle] に応じた文字ラベル
  String get previousLabel => switch (this) {
    TaskType.day => "昨日",
    TaskType.week => "先週",
    TaskType.month => "先月",
    TaskType.year => "去年",
  };
}

extension TaskIndex on int{
  /// インデックス（[int]）を [TaskType] に変換
  ///  - 0 => [TaskType.day],
  ///  - 1 => [TaskType.week],
  ///  - 2 => [TaskType.month],
  ///  - 3 => [TaskType.year],
  TaskType get taskType {
    assert(this>=0&&this<=3, "無効なインデックスです。（TaskIndex）");
    return switch(this){
      0 => TaskType.day,
      1 => TaskType.week,
      2 => TaskType.month,
      3 => TaskType.year,
    // 網羅性のために記述するが、assert で例外になる
    _=>TaskType.day,
    };
  }
}