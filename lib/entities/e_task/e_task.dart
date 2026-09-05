import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

part 'e_task.freezed.dart';

/// タスクのエンティティの sealed class
sealed class ETask extends TaskBase{

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
}

/// 日単位のタスククラス
@freezed
abstract class EDailyTask with _$EDailyTask, DailyTaskBase implements ETask {
  const EDailyTask._();

  const factory EDailyTask({
    required String title,
    required Date date,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _EDailyTask;
}

/// 週単位のタスククラス
@freezed
abstract class EWeeklyTask with WeeklyTaskBase, _$EWeeklyTask implements ETask {
  const EWeeklyTask._();

  const factory EWeeklyTask({
    required String title,
    required UniqueWeek week,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _EWeeklyTask;

  /// **編集可能な** 週単位タスクの仮データかどうか
  bool get canReplace => id == -2;
}

/// 月単位のタスククラス
@freezed
abstract class EMonthlyTask with MonthlyTaskBase, _$EMonthlyTask implements ETask {
  const EMonthlyTask._();

  const factory EMonthlyTask({
    required String title,
    required Month month,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _EMonthlyTask;
}

/// 年単位のタスククラス
@freezed
abstract class EYearlyTask with YearlyTaskBase, _$EYearlyTask implements ETask {
  const EYearlyTask._();

  const factory EYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _EYearlyTask;
}

extension ETaskListExtension on List<ETask> {
  /// 順不同でリストの中身が等しいか判定する
  bool isUnorderedEqualTo(List<ETask> other) {
    const equality = UnorderedIterableEquality<ETask>();
    return equality.equals(this, other);
  }
}
