import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/review_base/review.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

part 'i_task.freezed.dart';

/// タスクの InputData の sealed class
sealed class ITask extends TaskBase {
  /// タスクの期間の単位
  TaskRec get rec;

  String get title;

  int get id;

  bool get isChecked;

  int get labelId;

  /// タスクのレビュー
  Review get review;
}

/// 日単位タスクの InputData
@freezed
abstract class IDailyTask with DailyTaskBase, _$IDailyTask implements ITask {
  const IDailyTask._();

  const factory IDailyTask({
    required String title,
    required Date date,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _IDailyTask;
}

/// 週単位タスクの InputData
@freezed
abstract class IWeeklyTask with WeeklyTaskBase, _$IWeeklyTask implements ITask {
  const IWeeklyTask._();

  const factory IWeeklyTask({
    required String title,
    required UniqueWeek week,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _IWeeklyTask;

  /// **編集可能な** 週単位タスクの仮データかどうか
  bool get isPlaceHolder2 => id == -2;

  /// placeholder2 の初期値から変更されたかどうか
  bool get _isPlaceholder2Changed =>
      !(title == "" && isChecked == false && labelId == -1);

  /// 編集可能な仮データかどうか
  bool get canReplace {
    return isPlaceHolder2 && !_isPlaceholder2Changed;
  }

  /// 編集不可な仮データかどうか
  bool get cannotReplace {
    return _isPlaceholder2Changed && isPlaceHolder2;
  }
}

/// 月単位タスクの InputData
@freezed
abstract class IMonthlyTask
    with MonthlyTaskBase, _$IMonthlyTask
    implements ITask {
  const IMonthlyTask._();

  const factory IMonthlyTask({
    required String title,
    required Month month,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _IMonthlyTask;
}

/// 年単位タスクの InputData
@freezed
abstract class IYearlyTask with YearlyTaskBase, _$IYearlyTask implements ITask {
  const IYearlyTask._();

  const factory IYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
  }) = _IYearlyTask;
}
//
// extension ITaskListExtension on List<ITask> {
//   /// データ未受信状態かどうか
//   bool get isDisabled => any((task) => !task.isFetched);
// }
