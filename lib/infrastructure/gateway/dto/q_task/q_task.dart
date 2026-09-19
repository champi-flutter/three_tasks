
import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';

part 'q_task.freezed.dart';

/// Query 用タスク DTO
sealed class QTask extends TaskBase{
  String get title;
  int get id;
  bool get isChecked;
  int get labelId;
}

/// Query 用 日単位タスク DTO
///  - [dateInt]: `date` を `int` で指定する。
@freezed
abstract class QDailyTask with DailyTaskBase, _$QDailyTask implements QTask {
  const QDailyTask._();

  const factory QDailyTask({
    required String title,
    required int dateInt,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _QDailyTask;

  @override
  @protected
  Date get date => dateInt.toDate();
}

/// Query 用 週単位タスク DTO
///  - [firstDateInt]: 週の開始日を `int` で指定する
@freezed
abstract class QWeeklyTask with WeeklyTaskBase, _$QWeeklyTask implements QTask {
  const QWeeklyTask._();

  const factory QWeeklyTask({
    required String title,
    required int firstDateInt,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _QWeeklyTask;

  Date get _firstDate => firstDateInt.toDate();

  @override
  @protected
  UniqueWeek get week => UniqueWeek.fromDate(
    currentDate: _firstDate,
    firstDate: _firstDate,
  );
}

/// Query 用 月単位タスク DTO
///  - [monthInt]: 月を `int` で指定する
@freezed
abstract class QMonthlyTask with MonthlyTaskBase, _$QMonthlyTask implements QTask {
  const QMonthlyTask._();

  const factory QMonthlyTask({
    required String title,
    required int monthInt,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _QMonthlyTask;

  // todo data_converter に toMonth を実装（2026/09/11）＞＞
  @override
  @protected
  Month get month => monthInt.toMonth();
}

/// Query 用 年単位タスク DTO
@freezed
abstract class QYearlyTask with YearlyTaskBase, _$QYearlyTask implements QTask {
  const QYearlyTask._();

  const factory QYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _QYearlyTask;
}