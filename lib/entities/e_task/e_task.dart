import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

/// タスクのエンティティの sealed class
sealed class ETask extends TaskBase {
  ETask({
    required this.id,
    required this.title,
    required this.isChecked,
    required this.labelId,
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

  /// タスクの期間の単位
  TaskRec get rec;

  /// データ受信済みかどうか
  bool get isFetched;

  /// エンティティの各パラメータの更新
  void update({
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  })
  // 折りたたみ用
  {
    if(newTitle != null){
      title = newTitle;
    }
    if(newChecked!=null){
      isChecked = newChecked;
    }
    if(newLabelId!=null){
      labelId = newLabelId;
    }
  }
}

/// 日単位のタスクエンティティ
class EDailyTask extends ETask with DailyTaskBase {
  Date date;

  EDailyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required this.date,
  });

  /// タスクの期間の単位
  TaskRec get rec => TaskRec.day;

  /// データ受信済みかどうか
  @override
  bool get isFetched => id != -1;
}

/// 週単位のタスクエンティティ
class EWeeklyTask extends ETask with WeeklyTaskBase {
  UniqueWeek week;

  EWeeklyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required this.week,
  });

  /// タスクの期間の単位
  TaskRec get rec => TaskRec.week;

  /// データ受信済みかどうか
  bool get isFetched => id != -1;

  /// **編集可能な** 週単位タスクの仮データかどうか
  bool get isPlaceHolder2 => id == -2;

  /// placeholder2 の初期値から変更されたかどうか
  bool get _isPlaceholder2Changed => !(title== ""&&isChecked== false&&labelId== -1);

  /// 編集可能な仮データかどうか
  bool get canReplace {
    return isPlaceHolder2 && !_isPlaceholder2Changed;
  }

  /// 編集不可な仮データかどうか
  bool get cannotReplace {
    return _isPlaceholder2Changed && isPlaceHolder2;
  }

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
class EMonthlyTask extends ETask with MonthlyTaskBase {
  Month month;

  EMonthlyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required this.month,
  });

  /// タスクの期間の単位
  TaskRec get rec => TaskRec.month;

  /// データ受信済みかどうか
  bool get isFetched => id != -1;
}

/// 年単位のタスクエンティティ
class EYearlyTask extends ETask with YearlyTaskBase {
  int year;

  EYearlyTask({
    required super.id,
    required super.title,
    required super.isChecked,
    required super.labelId,
    required this.year,
  });

  /// タスクの期間の単位
  TaskRec get rec => TaskRec.year;

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
