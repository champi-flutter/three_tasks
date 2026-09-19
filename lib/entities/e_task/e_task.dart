import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

/// タスクのエンティティの sealed class
sealed class ETask extends TaskBase {
  /// タスクタイトル
  String get title;

  /// 一意の識別子
  int get id;

  /// チェックされているかどうか
  bool get isChecked;

  /// 登録されているラベルの ID
  ///
  /// ラベル未登録の状態を null => -1 に変更
  int get labelId;

  /// タスクの期間の単位
  TaskRec get rec;

  /// データ受信済みかどうか
  bool get isFetched;
}

/// 日単位のタスクエンティティ
class EDailyTask with DailyTaskBase implements ETask {
  final int id;

  String title;
  Date date;
  bool isChecked;
  int labelId;

  EDailyTask({
    required this.id,
    required this.date,
    required this.title,
    required this.isChecked,
    required this.labelId,
  });

  /// データ受信済みかどうか
  bool get isFetched => id != -1;
}

/// 週単位のタスクエンティティ
class EWeeklyTask with WeeklyTaskBase implements ETask {
  final int id;

  String title;
  UniqueWeek week;
  bool isChecked;
  int labelId;

  EWeeklyTask({
    required this.id,
    required this.week,
    required this.title,
    required this.isChecked,
    required this.labelId,
  });

  /// データ受信済みかどうか
  bool get isFetched => id != -1;

  /// **編集可能な** 週単位タスクの仮データかどうか
  bool get canReplace => id == -2;

  /// placeholder2 を新たな ID のエンティティに置き換える
  EWeeklyTask replacePlaceholder2(int newId) {
    if (!canReplace) {
      throw UnsupportedError(
        "[EWeeklyTask.replacePlaceholder2] 仮データ以外が対象にされています。",
      );
    }
    return EWeeklyTask(
      id: newId,
      week: week,
      title: title,
      isChecked: isChecked,
      labelId: labelId,
    );
  }
}

/// 月単位のタスクエンティティ
class EMonthlyTask with MonthlyTaskBase implements ETask {
  final int id;

  String title;
  Month month;
  bool isChecked;
  int labelId;

  EMonthlyTask({
    required this.id,
    required this.month,
    required this.title,
    required this.isChecked,
    required this.labelId,
  });

  /// データ受信済みかどうか
  bool get isFetched => id != -1;
}

/// 年単位のタスクエンティティ
class EYearlyTask with YearlyTaskBase implements ETask {
  final int id;

  String title;
  int year;
  bool isChecked;
  int labelId;

  EYearlyTask({
    required this.id,
    required this.year,
    required this.title,
    required this.isChecked,
    required this.labelId,
  });

  /// データ受信済みかどうか
  bool get isFetched => id != -1;
}

extension ETaskListExtension on List<ETask> {
  /// 順不同でリストの中身が等しいか判定する
  bool isUnorderedEqualTo(List<ETask> other) {
    const equality = UnorderedIterableEquality<ETask>();
    return equality.equals(this, other);
  }
}
