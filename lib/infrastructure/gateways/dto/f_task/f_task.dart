import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';

part 'f_task.freezed.dart';

/// fetch 用タスク DTO
sealed class FTask extends TaskBase{
  String get title;
  int get id;
  bool get isChecked;
  int get labelId;
}

/// fetch 用 日単位タスク DTO
///  - [dateInt]: `date` を `int` で指定する。
///  - [date]: 内部に持つ、int 型の [dateInt] を [Date] で参照する
@freezed
abstract class FDailyTask with DailyTaskBase, _$FDailyTask implements FTask {
  const FDailyTask._();

  const factory FDailyTask({
    required String title,
    required int dateInt,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _FDailyTask;

  int get dateInt;

  Date get date => dateInt.toDate();
}

/// fetch 用 週単位タスク DTO
///  - [firstDateInt]: 週の開始日を `int` で指定する
///  - [week]: 指定された開始日を基にした [UniqueWeek] を取得する
@freezed
abstract class FWeeklyTask with WeeklyTaskBase, _$FWeeklyTask implements FTask {
  const FWeeklyTask._();

  const factory FWeeklyTask({
    required String title,
    required int firstDateInt,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _FWeeklyTask;

  int get firstDateInt;

  Date get _firstDate => firstDateInt.toDate();

  UniqueWeek get week => UniqueWeek.fromDate(
    currentDate: _firstDate,
    firstDate: _firstDate,
  );
}

/// fetch 用 月単位タスク DTO
@freezed
abstract class FMonthlyTask with MonthlyTaskBase, _$FMonthlyTask implements FTask {
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
abstract class FYearlyTask with YearlyTaskBase, _$FYearlyTask implements FTask {
  const FYearlyTask._();

  const factory FYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _FYearlyTask;
}