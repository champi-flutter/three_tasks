import 'package:three_tasks/data_foundation/label_base/label_base.dart';

/// ラベルのエンティティ
///
/// タスクの各単位ごとの ID のリストを持つ。
class ELabel with LabelBase {
  /// 一意の識別子
  final int labelId;

  /// ラベルタイトル
  String title;

  /// 登録されている日単位タスクの ID のリスト
  final List<int> dailyIdList;

  /// 登録されている週単位タスクの ID のリスト
  final List<int> weeklyIdList;

  /// 登録されている月単位タスクの ID のリスト
  final List<int> monthlyIdList;

  /// 登録されている年単位タスクの ID のリスト
  final List<int> yearlyIdList;

  ELabel({
    required this.labelId,
    required this.title,
    required this.dailyIdList,
    required this.weeklyIdList,
    required this.monthlyIdList,
    required this.yearlyIdList,
  });

  /// [ELabel] のパラメータを更新する
  void update({
    String? newTitle,
    int? newDailyId,
    int? newWeeklyId,
    int? newMonthlyId,
    int? newYearlyId,
  })
  // 折りたたみ用
  {
    // タイトルの更新
    if (newTitle != null) {
      title = newTitle;
    }

    // 各単位ごとのタスクIDの追加（重複している場合は ArgumentError）
    if (newDailyId != null) {
      if (dailyIdList.contains(newDailyId)) {
        throw ArgumentError(
          "[ELabel.update] Daily task ID $newDailyId is already registered in this label.",
        );
      }
      dailyIdList.add(newDailyId);
    }

    if (newWeeklyId != null) {
      if (weeklyIdList.contains(newWeeklyId)) {
        throw ArgumentError(
          "[ELabel.update] Weekly task ID $newWeeklyId is already registered in this label.",
        );
      }
      weeklyIdList.add(newWeeklyId);
    }

    if (newMonthlyId != null) {
      if (monthlyIdList.contains(newMonthlyId)) {
        throw ArgumentError(
          "[ELabel.update] Monthly task ID $newMonthlyId is already registered in this label.",
        );
      }
      monthlyIdList.add(newMonthlyId);
    }

    if (newYearlyId != null) {
      if (yearlyIdList.contains(newYearlyId)) {
        throw ArgumentError(
          "[ELabel.update] Yearly task ID $newYearlyId is already registered in this label.",
        );
      }
      yearlyIdList.add(newYearlyId);
    }
  }
}
