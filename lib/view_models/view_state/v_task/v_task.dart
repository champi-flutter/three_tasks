import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

part 'v_task.freezed.dart';

/// 2026/06/04 変更: 全てのタスククラスの継承先を sealed で作る
///
/// 2026/06/04 変更: sealedクラス自体を freezed で定義すると、riverpod_generator
/// との兼ね合いが悪いので、継承先を freezed で個別に生成
sealed class VTask {

  /// タスクの期間の単位
  TaskRec get rec;

  String get title;

  int get id;

  bool get isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  int get labelId;

  /// データ受信済みかどうか
  bool get isFetched;
}

/// 日単位のタスククラス
@freezed
abstract class VDailyTask with _$VDailyTask implements VTask {

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.day;

  const VDailyTask._();

  const factory VDailyTask({
    required String title,
    required Date date,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _VDailyTask;

  /// 日単位タスクの仮データを生成するファクトリ
  factory VDailyTask.placeholder({required Date date}) => VDailyTask(
        title: "",
        date: date,
        id: -1,
        isChecked: false,
        labelId: -1,
      );

  /// データ受信済みかどうか
  @override
  bool get isFetched => id != -1;
}

/// 週単位のタスククラス
@freezed
abstract class VWeeklyTask with _$VWeeklyTask implements VTask {

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.week;

  const VWeeklyTask._();

  const factory VWeeklyTask({
    required String title,
    required UniqueWeek week,
    required int id,
    required bool isChecked,
    required int labelId,
  }) = _VWeeklyTask;

  /// データ受信済みかどうか
  @override
  bool get isFetched => id != -1;

  /// 週単位タスクの仮データを生成するファクトリ
  factory VWeeklyTask.placeholder() => VWeeklyTask(
        title: "",
        week: UniqueWeek.fromDate(currentDate: today, firstDate: today),
        id: -1,
        isChecked: false,
        labelId: -1,
      );

  /// **編集可能な** 週単位タスクの仮データかどうか
  bool get canReplace => id == -2;

  /// **編集可能な** 週単位タスクの仮データを生成するファクトリ
  ///
  /// 最初のフェッチを済ませた後の仮データで、[id] は `-2` 。
  ///
  /// （「週単位タスク」のみ最初のフェッチで何も返されない場合がある。）
  factory VWeeklyTask.placeholder2(Date currentDate) => VWeeklyTask(
        title: "",
        week: UniqueWeek.fromDate(
          currentDate: currentDate,
          firstDate: currentDate,
        ),
        id: -2,
        isChecked: false,
        labelId: -1,
      );
}

/// 月単位のタスククラス
@freezed
abstract class VMonthlyTask with _$VMonthlyTask implements VTask {

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.month;

  const VMonthlyTask._();

  const factory VMonthlyTask({
    required String title,
    required Month month,
    required int id,
    required bool isChecked,

    /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
    required int labelId,
  }) = _VMonthlyTask;

  /// データ受信済みかどうか
  @override
  bool get isFetched => id != -1;

  /// 週単位タスクの仮データを生成するファクトリ
  factory VMonthlyTask.placeholder() => VMonthlyTask(
        title: "",
        month: thisMonth,
        id: -1,
        isChecked: false,
        labelId: -1,
      );
}

/// 年単位のタスククラス
@freezed
abstract class VYearlyTask with _$VYearlyTask implements VTask {

  /// タスクの期間の単位
  @override
  TaskRec get rec => TaskRec.year;

  const VYearlyTask._();

  const factory VYearlyTask({
    required String title,
    required int year,
    required int id,
    required bool isChecked,

    /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
    required int labelId,
  }) = _VYearlyTask;

  /// データ受信済みかどうか
  @override
  bool get isFetched => id != -1;

  /// 週単位タスクの仮データを生成するファクトリ
  factory VYearlyTask.placeholder() => VYearlyTask(
        title: "",
        year: thisYear,
        id: -1,
        isChecked: false,
        labelId: -1,
      );
}

extension VTaskListExtension on List<VTask> {
  /// 順不同でリストの中身が等しいか判定する
  bool isUnorderedEqualTo(List<VTask> other) {
    const equality = UnorderedIterableEquality<VTask>();
    return equality.equals(this, other);
  }

  /// todo データ未受信状態かどうか（2026/08/17）＞＞
  bool get isDisabled => any((task) => !task.isFetched);
}
