import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/entities/date_time_options.dart';

part 'd_task.freezed.dart';

/// データ型タスククラス
///
/// [task] と [isChecked] は nullable （一部を書き換える処理のため）。
///
/// 2026/06/04 変更: sealedクラス自体を freezed で定義すると、riverpod_generator
/// との兼ね合いが悪いので、継承先を freezed で個別に生成
sealed class DTask {
  String? get task;
  int get id;
  bool? get isChecked;
}

/// 日単位のタスククラス
@freezed
abstract class DDayTask with _$DDayTask implements DTask {
  const DDayTask._();

  const factory DDayTask({
    required String? task,
    required Date date,
    required int id,
    required bool? isChecked,
  }) = _DDayTask;

  // /// 日単位タスクの仮データを生成するファクトリ
  // factory DDayTask.placeholder({required Date date}) =>
  //     DDayTask(task: "", date: date, id: -1, isChecked: false);
}

/// 週単位のタスククラス
@freezed
abstract class DWeeklyTask with _$DWeeklyTask implements DTask {
  const DWeeklyTask._();

  const factory DWeeklyTask({
    required String? task,
    required UniqueWeek week,
    required int id,
    required bool? isChecked,
  }) = _DWeeklyTask;
}

/// 月単位のタスククラス
@freezed
abstract class DMonthlyTask with _$DMonthlyTask implements DTask {
  const DMonthlyTask._();

  const factory DMonthlyTask({
    required String? task,
    required Month month,
    required int id,
    required bool? isChecked,
  }) = _DMonthlyTask;
}

/// 年単位のタスククラス
@freezed
abstract class DYearlyTask with _$DYearlyTask implements DTask {
  const DYearlyTask._();

  const factory DYearlyTask({
    required String? task,
    required int year,
    required int id,
    required bool? isChecked,
  }) = _DYearlyTask;
}