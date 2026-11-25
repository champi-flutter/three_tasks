import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/value_object/review.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/data_foundation/value_object/task_recurrence.dart';

part 'o_task.freezed.dart';

/// タスクの OutputData の sealed class
sealed class OTask extends TaskBase {
  /// タスクの期間の単位
  TaskRec get rec;

  String get title;

  int get id;

  bool get isChecked;

  int get labelId;

  /// タスクのレビュー
  Review get review;

  /// データ受信済みかどうか
  bool get isFetched;
}

/// 日単位タスクの OutputData
@freezed
abstract class ODailyTask with DailyTaskBase, _$ODailyTask implements OTask {
  const ODailyTask._();

  const factory ODailyTask({
    required String title,
    required Date date,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
    required bool isFetched,
  }) = _ODailyTask;
}

/// 週単位タスクの OutputData
@freezed
abstract class OWeeklyTask with WeeklyTaskBase, _$OWeeklyTask implements OTask {
  const OWeeklyTask._();

  const factory OWeeklyTask({
    required String title,
    required UniqueWeek week,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
    required bool isFetched,
    required bool isPlaceholder2,
    required bool shouldIdentify,
    required bool willRemainPlaceholder2,
  }) = _OWeeklyTask;

  /// **編集可能な** 週単位タスクの仮データを生成するファクトリ
  ///
  /// 最初のフェッチを済ませた後の仮データで、[id] は `-2` 。
  ///
  /// （「週単位タスク」のみ最初のフェッチで何も返されない場合がある。）
  factory OWeeklyTask.placeholder2(Date currentDate) => OWeeklyTask(
    title: "",
    week: UniqueWeek.fromDate(
      currentDate: currentDate,
      firstDate: currentDate,
    ),
    id: -2,
    isChecked: false,
    labelId: -1,
    review: Review(result: null, next: null),
    isFetched: false,
    isPlaceholder2: true,
    shouldIdentify: false,
    willRemainPlaceholder2: true,
  );
}

/// 月単位タスクの OutputData
@freezed
abstract class OMonthlyTask
    with MonthlyTaskBase, _$OMonthlyTask
    implements OTask {
  const OMonthlyTask._();

  const factory OMonthlyTask({
    required String title,
    required Month month,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
    required bool isFetched,
  }) = _OMonthlyTask;
}

/// 年単位タスクの OutputData
@freezed
abstract class OYearlyTask with YearlyTaskBase, _$OYearlyTask implements OTask {
  const OYearlyTask._();

  const factory OYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,
    required int labelId,
    required Review review,
    required bool isFetched,
  }) = _OYearlyTask;
}

extension OTaskListExtension on List<OTask> {
  /// データ未受信状態かどうか
  bool get isDisabled => any((task) => !task.isFetched);
}
