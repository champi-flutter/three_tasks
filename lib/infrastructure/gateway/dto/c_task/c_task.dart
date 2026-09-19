import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

part 'c_task.freezed.dart';

/// タスクのキャッシュの型の sealed class
sealed class CTask extends TaskBase{

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
// `with` には override の順番があるらしい...
abstract class CDailyTask with DailyTaskBase, _$CDailyTask implements CTask {
  const CDailyTask._();

  const factory CDailyTask({
    required String title,
    required Date date,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _CDailyTask;
}

/// 週単位のタスククラス
@freezed
abstract class CWeeklyTask with WeeklyTaskBase, _$CWeeklyTask implements CTask {
  const CWeeklyTask._();

  const factory CWeeklyTask({
    required String title,
    required UniqueWeek week,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _CWeeklyTask;

  /// **編集可能な** 週単位タスクの仮データかどうか
  bool get canReplace => id == -2;
}

/// 月単位のタスククラス
@freezed
abstract class CMonthlyTask with MonthlyTaskBase, _$CMonthlyTask implements CTask {
  const CMonthlyTask._();

  const factory CMonthlyTask({
    required String title,
    required Month month,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _CMonthlyTask;
}

/// 年単位のタスククラス
@freezed
abstract class CYearlyTask with YearlyTaskBase, _$CYearlyTask implements CTask {
  const CYearlyTask._();

  const factory CYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _CYearlyTask;
}

extension ETaskListExtension on List<CTask> {
  /// 順不同でリストの中身が等しいか判定する
  bool isUnorderedEqualTo(List<CTask> other) {
    const equality = UnorderedIterableEquality<CTask>();
    return equality.equals(this, other);
  }
}
