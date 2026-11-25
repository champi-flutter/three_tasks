import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/value_object/review.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/data_foundation/value_object/task_recurrence.dart';

/// タスクのエンティティの sealed class
sealed class ETask extends TaskBase {
  ETask({
    required this.id,
    required this.title,
    required this.isChecked,
    required this.labelId,
    required this.review,
  });

  /// 一意の識別子
  final int id;

  /// タスクタイトル
  String title;

  /// チェックされているかどうか
  bool isChecked;

  /// 登録されているラベルの ID
  ///
  /// ラベル未登録の状態を null => -1 に変更
  int labelId;

  /// タスクのレビュー
  Review review;

  /// タスクの期間の単位
  TaskRec get rec;

  /// データ受信済みかどうか
  bool get isFetched => id != -1;

  /// エンティティの各パラメータの更新
  void update({
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
    String? newResult,
    String? newNext,
  })
  // 折りたたみ用
  {
    if (newTitle != null) {
      title = newTitle;
    }
    if (newChecked != null) {
      isChecked = newChecked;
    }
    if (newLabelId != null) {
      labelId = newLabelId;
    }
    if (newResult != null || newNext != null) {
      review = Review(
        result: newResult ?? review.result,
        next: newNext ?? review.next,
      );
    }
  }
}

/// 日単位のタスクエンティティ
class EDailyTask extends ETask with DailyTaskBase, CopyableEntity<EDailyTask>{
  Date date;

  EDailyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required super.review,
    required this.date,
  });

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.day;

  @override
  EDailyTask copy() => EDailyTask(
        id: id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        review: review,
        date: date,
      );
}

/// 週単位のタスクエンティティ
class EWeeklyTask extends ETask with WeeklyTaskBase, CopyableEntity<EWeeklyTask> {
  UniqueWeek week;

  EWeeklyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required super.review,
    required this.week,
  });

  /// タスクの期間の単位
  TaskRec get rec => TaskRec.week;

  /// **編集可能な** 週単位タスクの仮データかどうか
  bool get isPlaceholder2 => id == -2;

  /// placeholder2 の初期値から変更されたかどうか
  bool get _isPlaceholder2Changed =>
      !(title == "" && isChecked == false && labelId == -1);

  /// placeholder2 に編集が加わった状態、かどうか
  bool get shouldIdentify => isPlaceholder2 && _isPlaceholder2Changed;

  /// placeholder2 のままでいるかどうか
  bool get willRemainPlaceholder2 => isPlaceholder2 && !_isPlaceholder2Changed;

  /// placeholder2 を新たな ID のエンティティに置き換える
  EWeeklyTask identifyPlaceholder2As(int newId) {
    if (!shouldIdentify) {
      throw UnsupportedError(
        "[EWeeklyTask.identifyPlaceholder2As] 仮データ以外が対象にされています。",
      );
    }
    return EWeeklyTask(
      id: newId,
      week: week,
      title: title,
      isChecked: isChecked,
      labelId: labelId,
      review: review,
    );
  }

  @override
  EWeeklyTask copy() => EWeeklyTask(
        id: id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        review: review,
        week: week,
      );
}

/// 月単位のタスクエンティティ
class EMonthlyTask extends ETask with MonthlyTaskBase, CopyableEntity<EMonthlyTask> {
  Month month;

  EMonthlyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required super.review,
    required this.month,
  });

  /// タスクの期間の単位
  TaskRec get rec => TaskRec.month;

  @override
  EMonthlyTask copy() => EMonthlyTask(
        id: id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        review: review,
        month: month,
      );
}

/// 年単位のタスクエンティティ
class EYearlyTask extends ETask with YearlyTaskBase, CopyableEntity<EYearlyTask> {
  int year;

  EYearlyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required super.review,
    required this.year,
  });

  /// タスクの期間の単位
  TaskRec get rec => TaskRec.year;

  @override
  EYearlyTask copy() => EYearlyTask(
        id: id,
        title: title,
        isChecked: isChecked,
        labelId: labelId,
        review: review,
        year: year,
      );
}

extension ETaskListExtension on List<ETask> {
  /// 順不同でリストの中身が等しいか判定する
  bool isUnorderedEqualTo(List<ETask> other) {
    const equality = UnorderedIterableEquality<ETask>();
    return equality.equals(this, other);
  }
}
