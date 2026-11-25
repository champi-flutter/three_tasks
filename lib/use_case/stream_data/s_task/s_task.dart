import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/value_object/review.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/data_foundation/value_object/task_recurrence.dart';

part 's_task.freezed.dart';

/// ストリームで扱うタスクの sealed class
sealed class STask extends TaskBase {
  /// タスクの期間の単位
  TaskRec get rec;

  String get title;

  int get id;

  bool get isChecked;

  int get labelId;

  /// タスクのレビュー
  Review get review;
}

/// ストリームで扱う日単位タスク
@freezed
abstract class SDailyTask with DailyTaskBase, _$SDailyTask implements STask {
  const SDailyTask._();

  const factory SDailyTask({
    required String title,
    required Date date,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _SDailyTask;
}

/// ストリームで扱う週単位タスク
@freezed
abstract class SWeeklyTask with WeeklyTaskBase, _$SWeeklyTask implements STask {
  const SWeeklyTask._();

  const factory SWeeklyTask({
    required String title,
    required UniqueWeek week,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _SWeeklyTask;
}

/// ストリームで扱う月単位タスク
@freezed
abstract class SMonthlyTask
    with MonthlyTaskBase, _$SMonthlyTask
    implements STask {
  const SMonthlyTask._();

  const factory SMonthlyTask({
    required String title,
    required Month month,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _SMonthlyTask;
}

/// ストリームで扱う年単位タスク
@freezed
abstract class SYearlyTask with YearlyTaskBase, _$SYearlyTask implements STask {
  const SYearlyTask._();

  const factory SYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _SYearlyTask;
}
