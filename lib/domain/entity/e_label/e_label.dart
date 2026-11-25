import 'package:three_tasks/data_foundation/label_base/label_base.dart';
import 'package:three_tasks/data_foundation/value_object/task_id_list.dart';

/// ラベルのエンティティ
///
/// タスクの各単位ごとの ID のリストを持つ。
class ELabel with LabelBase {
  /// 一意の識別子
  final int labelId;

  /// ラベルタイトル
  String title;

  /// 登録されている日単位タスクの ID のリスト
  TaskIdList dailyIdList;

  /// 登録されている週単位タスクの ID のリスト
  TaskIdList weeklyIdList;

  /// 登録されている月単位タスクの ID のリスト
  TaskIdList monthlyIdList;

  /// 登録されている年単位タスクの ID のリスト
  TaskIdList yearlyIdList;

  ELabel({
    required this.labelId,
    required this.title,
    required this.dailyIdList,
    required this.weeklyIdList,
    required this.monthlyIdList,
    required this.yearlyIdList,
  });

  /// [ELabel] のパラメータを更新する
  void addTaskId({
    int? newDailyId,
    int? newWeeklyId,
    int? newMonthlyId,
    int? newYearlyId,
  })
  // 折りたたみ用
  {
    // 各単位ごとのタスクIDの追加（重複している場合は ArgumentError）
    if (newDailyId != null) {
      dailyIdList = _updateTaskIdList(
        targetIdList: dailyIdList,
        newId: newDailyId,
      );
    }

    if (newWeeklyId != null) {
      weeklyIdList = _updateTaskIdList(
        targetIdList: weeklyIdList,
        newId: newWeeklyId,
      );
    }

    if (newMonthlyId != null) {
      monthlyIdList = _updateTaskIdList(
        targetIdList: monthlyIdList,
        newId: newMonthlyId,
      );
    }

    if (newYearlyId != null) {
      yearlyIdList = _updateTaskIdList(
        targetIdList: yearlyIdList,
        newId: newYearlyId,
      );
    }
  }

  /// [ELabel] のパラメータを更新する
  void removeTaskId({
    int? removedDailyId,
    int? removedWeeklyId,
    int? removedMonthlyId,
    int? removedYearlyId,
  })
  // 折りたたみ用
  {
    // 各単位ごとのタスクIDの追加（重複している場合は ArgumentError）
    if (removedDailyId != null) {
      dailyIdList = _updateTaskIdList(
        targetIdList: dailyIdList,
        removedId: removedDailyId,
      );
    }

    if (removedWeeklyId != null) {
      weeklyIdList = _updateTaskIdList(
        targetIdList: weeklyIdList,
        removedId: removedWeeklyId,
      );
    }

    if (removedMonthlyId != null) {
      monthlyIdList = _updateTaskIdList(
        targetIdList: monthlyIdList,
        removedId: removedMonthlyId,
      );
    }

    if (removedYearlyId != null) {
      yearlyIdList = _updateTaskIdList(
        targetIdList: yearlyIdList,
        removedId: removedYearlyId,
      );
    }
  }

  /// [ELabel] のパラメータを更新する
  void updateTitle(String newTitle) {
    title = newTitle;
  }

  /// タスクIDリスト更新ロジック
  static TaskIdList _updateTaskIdList({
    required TaskIdList targetIdList,
    int? newId,
    int? removedId,
  })
  // 折りたたみ用
  {
    if (targetIdList.contains(newId)) {
      throw ArgumentError(
        "[ELabel.update] task ID: $newId is already registered in this label.",
      );
    }
    final List<int> mutable = targetIdList.toMutable();
    if (newId != null) {
      mutable.add(newId);
    }
    if (removedId != null) {
      mutable.remove(newId);
    }
    return TaskIdList(mutable);
  }
}
