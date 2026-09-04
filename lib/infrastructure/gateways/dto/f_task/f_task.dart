import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'f_task.freezed.dart';

/// fetch 用タスク DTO
sealed class FTask {
  String get title;
  int get id;
  bool get isChecked;
  int get labelId;
}

/// fetch 用 日単位タスク DTO
@freezed
abstract class FDailyTask with _$FDailyTask implements FTask {
  const FDailyTask._();

  const factory FDailyTask({
    required String title,
    required Date date,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _FDailyTask;
}

/// fetch 用 週単位タスク DTO
@freezed
abstract class FWeeklyTask with _$FWeeklyTask implements FTask {
  const FWeeklyTask._();

  const factory FWeeklyTask({
    required String title,
    required UniqueWeek week,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _FWeeklyTask;
}

/// fetch 用 月単位タスク DTO
@freezed
abstract class FMonthlyTask with _$FMonthlyTask implements FTask {
  const FMonthlyTask._();

  const factory FMonthlyTask({
    required String title,
    required Month month,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _FMonthlyTask;
}

/// fetch 用 年単位タスク DTO
@freezed
abstract class FYearlyTask with _$FYearlyTask implements FTask {
  const FYearlyTask._();

  const factory FYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _FYearlyTask;
}