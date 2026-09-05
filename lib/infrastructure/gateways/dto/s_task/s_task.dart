import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';

part 's_task.freezed.dart';

/// Save 用 タスク DTO
///
/// [task] と [isChecked] は nullable （一部を書き換える処理のため）。
///
/// 2026/06/04 変更: sealedクラス自体を freezed で定義すると、riverpod_generator
/// との兼ね合いが悪いので、継承先を freezed で個別に生成
sealed class STask extends TaskBase {
  String? get title;
  int get id;
  bool? get isChecked;
  int? get labelId;
}

/// Save 用 日単位タスク DTO
///  - [dateInt]: コンストラクタの引数で、[Date] で指定した [date] を `int` で取得する
@freezed
abstract class SDailyTask with DailyTaskBase, _$SDailyTask implements STask {
  const SDailyTask._();

  const factory SDailyTask({
    required String? title,
    required Date date,
    required int id,
    required bool? isChecked,
    required int? labelId,
  }) = _SDailyTask;

  /// コンストラクタの引数で、[Date] で指定した [date] を `int` で取得する
  int get dateInt=> date.toIntIdentifier();
}

/// Save 用 週単位タスク DTO
///  - [firstDateInt]: コンストラクタの引数で、[UniqueWeek] で指定した [week] の
///  開始日を `int` で取得する
@freezed
abstract class SWeeklyTask with WeeklyTaskBase, _$SWeeklyTask implements STask {
  const SWeeklyTask._();

  const factory SWeeklyTask({
    required String? title,
    required UniqueWeek week,
    required int id,
    required bool? isChecked,
    required int? labelId,
  }) = _SWeeklyTask;

  /// コンストラクタの引数で、[UniqueWeek] で指定した [week] の開始日を `int` で取得する
  int get firstDateInt => _firstDate.toIntIdentifier();

  Date get _firstDate => week.firstDateOfWeek;
}

/// Save 用 月単位タスク DTO
@freezed
abstract class SMonthlyTask with MonthlyTaskBase, _$SMonthlyTask implements STask {
  const SMonthlyTask._();

  const factory SMonthlyTask({
    required String? title,
    required Month month,
    required int id,
    required bool? isChecked,
    required int? labelId,
  }) = _SMonthlyTask;
}

/// Save 用 年単位タスク DTO
@freezed
abstract class SYearlyTask with YearlyTaskBase, _$SYearlyTask implements STask {
  const SYearlyTask._();

  const factory SYearlyTask({
    required String? title,
    required int year,
    required int id,
    required bool? isChecked,
    required int? labelId,
  }) = _SYearlyTask;
}