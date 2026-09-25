
/// ラベル更新用パラメータ
class LabelControlParameter {
  const LabelControlParameter({
    this.newTitle,
    this.newDailyId,
    this.newWeeklyId,
    this.newMonthlyId,
    this.newYearlyId,
  });

  /// ラベルのタイトルを変更
  final String? newTitle;

  /// ラベルに日単位タスクを追加
  final int? newDailyId;

  /// ラベルに週単位タスクを追加
  final int? newWeeklyId;

  /// ラベルに月単位タスクを追加
  final int? newMonthlyId;

  /// ラベルに年単位タスクを追加
  final int? newYearlyId;
}
