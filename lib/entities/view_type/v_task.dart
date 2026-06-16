import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';

part 'v_task.freezed.dart';

/// 2026/06/04 変更: 全てのタスククラスの継承先を sealed で作る
///
/// 2026/06/04 変更: sealedクラス自体を freezed で定義すると、riverpod_generator
/// との兼ね合いが悪いので、継承先を freezed で個別に生成
sealed class VTask {
  String get task;

  int get id;

  bool get isChecked;

  /// このタスクがラベル化されているかどうか
  bool isLabeled({required List<VLabeledTask> labeledTaskList});
}

/// 日単位のタスククラス
@freezed
abstract class VDayTask with _$VDayTask implements VTask {
  const VDayTask._();

  const factory VDayTask({
    required String task,
    required Date date,
    required int id,
    required bool isChecked,
  }) = _VDayTask;

  /// 日単位タスクの仮データを生成するファクトリ
  factory VDayTask.placeholder({required Date date}) =>
      VDayTask(task: "", date: date, id: -1, isChecked: false);

  /// このタスクがラベル化されているかどうか
  @override
  bool isLabeled({required List<VLabeledTask> labeledTaskList}) {
    for (VLabeledTask task in labeledTaskList) {
      // 各ラベル化タスクごとの日単位IDリストの中に該当のIDがあるかを走査
      if (task.dailyIdList.contains(id)) {
        return true;
      }
    }
    // 最後までなかったら、false を返す
    return false;
  }
}

/// 週単位のタスククラス
@freezed
abstract class VWeeklyTask with _$VWeeklyTask implements VTask {
  const VWeeklyTask._();

  const factory VWeeklyTask({
    required String task,
    // todo 週のクラス（2026/06/04）＞＞
    required UniqueWeek week,
    required int id,
    required bool isChecked,
  }) = _VWeeklyTask;

  /// このタスクがラベル化されているかどうか
  @override
  bool isLabeled({required List<VLabeledTask> labeledTaskList}) {
    for (VLabeledTask task in labeledTaskList) {
      // 各ラベル化タスクごとの日単位IDリストの中に該当のIDがあるかを走査
      if (task.weeklyIdList.contains(id)) {
        return true;
      }
    }
    // 最後までなかったら、false を返す
    return false;
  }

  /// 週単位タスクの仮データを生成するファクトリ
  factory VWeeklyTask.placeholder() => VWeeklyTask(
      task: "",
      week: UniqueWeek.fromDate(currentDate: today, firstDate: today),
      id: -1,
      isChecked: false,
  );
}

/// 月単位のタスククラス
@freezed
abstract class VMonthlyTask with _$VMonthlyTask implements VTask {
  const VMonthlyTask._();

  const factory VMonthlyTask({
    required String task,
    required Month month,
    required int id,
    required bool isChecked,
  }) = _VMonthlyTask;

  /// このタスクがラベル化されているかどうか
  @override
  bool isLabeled({required List<VLabeledTask> labeledTaskList}) {
    for (VLabeledTask task in labeledTaskList) {
      // 各ラベル化タスクごとの日単位IDリストの中に該当のIDがあるかを走査
      if (task.monthlyIdList.contains(id)) {
        return true;
      }
    }
    // 最後までなかったら、false を返す
    return false;
  }

  /// 週単位タスクの仮データを生成するファクトリ
  factory VMonthlyTask.placeholder() =>
      VMonthlyTask(task: "", month: thisMonth, id: -1, isChecked: false);
}

/// 年単位のタスククラス
@freezed
abstract class VYearlyTask with _$VYearlyTask implements VTask {
  const VYearlyTask._();

  const factory VYearlyTask({
    required String task,
    required int year,
    required int id,
    required bool isChecked,
  }) = _VYearlyTask;

  /// このタスクがラベル化されているかどうか
  @override
  bool isLabeled({required List<VLabeledTask> labeledTaskList}) {
    for (VLabeledTask task in labeledTaskList) {
      // 各ラベル化タスクごとの日単位IDリストの中に該当のIDがあるかを走査
      if (task.yearlyIdList.contains(id)) {
        return true;
      }
    }
    // 最後までなかったら、false を返す
    return false;
  }

  /// 週単位タスクの仮データを生成するファクトリ
  factory VYearlyTask.placeholder() =>
      VYearlyTask(task: "", year: thisYear, id: -1, isChecked: false);
}

// @freezed
// sealed class VTask with _$VTask {
//   // 独自メソッドや共通 getter を定義するための空のコンストラクタ
//   const VTask._();
//
//   /// 日単位のタスク (VDayTask)
//   const factory VTask.day({
//     required String task,
//     required Date date,
//     required int id,
//     required bool isChecked,
//   }) = VDayTask;
//
//   /// 週単位タスク
//   const factory VTask.week({
//     required String task,
//     required int weekNumber,
//     required int id,
//     required bool isChecked,
//   }) = VWeeklyTask;
//
//   /// 月単位タスク
//   const factory VTask.month({
//     required String task,
//     required int month,
//     required int id,
//     required bool isChecked,
//   }) = VMonthlyTask;
//
//   /// 月単位のタスク
//   const factory VTask.year({
//     required String task,
//     required int year,
//     required int id,
//     required bool isChecked,
//   }) = VYearlyTask;
//
//   String get task => map(
//     day: (t) => t.task,
//     week: (t) => t.task,
//     month: (t) => t.task,
//     year: (t) => t.task,
//   );
//
//   int get id => map(
//     day: (t) => t.id,
//     week: (t) => t.id,
//     month: (t) => t.id,
//     year: (t) => t.id,
//   );
//
//   bool get isChecked => map(
//     day: (t) => t.isChecked,
//     week: (t) => t.isChecked,
//     month: (t) => t.isChecked,
//     year: (t) => t.isChecked,
//   );
//
//   // --- 共通の仮データ生成ファクトリ ---
//
//   /// 日単位タスクの仮データ
//   factory VTask.dayPlaceholder({required Date date}) =>
//       VTask.day(task: "", date: date, id: -1, isChecked: false);
//
//   /// 週単位タスクの仮データ
//   factory VTask.weekPlaceholder({required Date date}) =>
//       VTask.day(task: "", date: date, id: -10, isChecked: false);
//
//   /// 月単位タスクの仮データ
//   factory VTask.monthPlaceholder({required Date date}) =>
//       VTask.day(task: "", date: date, id: -100, isChecked: false);
//
//   /// 年単位タスクの仮データ
//   factory VTask.yearPlaceholder({required Date date}) =>
//       VTask.day(task: "", date: date, id: -1000, isChecked: false);
// }

// @freezed
// abstract class VDayTask with _$VDayTask {
//   const factory VDayTask({
//     required String task,
//     required Date date,
//     required int id,
//     required bool isChecked,
//   }) = _VDayTask;
//
//   factory VDayTask.placeholder({required Date date}) =>
//       VDayTask(task: "", date: date, id: -1, isChecked: false);
// }
//

// extension VDayTaskListEquality on List<VDayTask> {
//   /// 順不同でリストの中身が等しいか判定する
//   bool isUnorderedEqualTo(List<VDayTask> other) {
//     const equality = UnorderedIterableEquality<VDayTask>();
//     return equality.equals(this, other);
//   }
// }

extension VTaskListEquality on List<VTask> {
  /// 順不同でリストの中身が等しいか判定する
  bool isUnorderedEqualTo(List<VTask> other) {
    const equality = UnorderedIterableEquality<VTask>();
    return equality.equals(this, other);
  }
}
