import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 's_task.freezed.dart';

/// Save 用 タスク DTO
///
/// [task] と [isChecked] は nullable （一部を書き換える処理のため）。
///
/// 2026/06/04 変更: sealedクラス自体を freezed で定義すると、riverpod_generator
/// との兼ね合いが悪いので、継承先を freezed で個別に生成
sealed class STask {
  String? get title;
  int get id;
  bool? get isChecked;
  int? get labelId;
}

/// Save 用 日単位タスク DTO
@freezed
abstract class SDailyTask with _$SDailyTask implements STask {
  const SDailyTask._();

  const factory SDailyTask({
    required String? title,
    required Date date,
    required int id,
    required bool? isChecked,
    required int? labelId,
  }) = _SDailyTask;
}

/// Save 用 週単位タスク DTO
@freezed
abstract class SWeeklyTask with _$SWeeklyTask implements STask {
  const SWeeklyTask._();

  const factory SWeeklyTask({
    required String? title,
    required UniqueWeek week,
    required int id,
    required bool? isChecked,
    required int? labelId,
  }) = _SWeeklyTask;
}

/// Save 用 月単位タスク DTO
@freezed
abstract class SMonthlyTask with _$SMonthlyTask implements STask {
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
abstract class SYearlyTask with _$SYearlyTask implements STask {
  const SYearlyTask._();

  const factory SYearlyTask({
    required String? title,
    required int year,
    required int id,
    required bool? isChecked,
    required int? labelId,
  }) = _SYearlyTask;
}