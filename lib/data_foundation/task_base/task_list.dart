import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

sealed class TaskListBase<Task extends TaskBase> extends FixedList<Task> {
  /// タスクの種別
  TaskRec get rec;

  TaskListBase.fill(super.length, super.fill) : super.fill();

  TaskListBase.fromIterable(super.length, super.iterable)
      : super.fromIterable();

  /// 同じ値の新しい参照を生成するコンストラクタ
  @protected
  TaskListBase.callDeepCopy(super.entryList, super.copyBuilder)
      : super.callDeepCopy();

  /// タスクリストの先頭のタスク
  ///
  /// タスクの種別などのタスクリスト全体で共通する情報を取得する際に使用する。
  Task get headTask => toEntryList()[0].value;
}

/// タスクのリスト
///
/// 要素数を 3 つに固定する。
class TaskList<Task extends TaskBase> extends TaskListBase<Task> {
  /// タスクの種別
  @override
  final TaskRec rec;

  TaskList(
    Task task1,
    Task task2,
    Task task3,
  )   : rec = task1.rec,
        super.fill(
          3,
          (i) => switch (i) {
            0 => task1,
            1 => task2,
            2 => task3,
            // length を 3 で指定しているため例外はないが、網羅性のために記載
            _ => throw RangeError('[TaskListBase] インデックス $i は範囲外です。'),
          },
        );

  /// [Iterable] から [TaskList] を生成するコンストラクタ
  TaskList.fromIterable(Iterable<Task> iterable)
      : assert(
          iterable.length == 3,
          "[TaskList.fromIterable] 要素数が不適当です",
        ),
        rec = iterable.first.rec,
        super.fromIterable(
          3,
          iterable,
        );

  @override
  @protected
  ListEntry<Task> get single => throw UnsupportedError(
        "[TaskList] single にアクセスされました。",
      );

  /// 同じ値の新しい参照を生成するコンストラクタ
  TaskList.callDeepCopy(super.entryList, super.copyBuilder)
      : rec = entryList.first.value.rec,
        super.callDeepCopy();

  @override
  TaskList<Task> deepCopy({
    required Task Function(Task task) copyBuilder,
  }) =>
      TaskList.callDeepCopy(toEntryList(), copyBuilder);
}

/// 週タスクのリスト
///
/// 週タスクのみ、要素数を 3 つに固定しない。
class WeeklyTaskList<Task extends WeeklyTaskBase> extends TaskListBase<Task> {
  /// タスクの種別
  @override
  final TaskRec rec = TaskRec.week;

  WeeklyTaskList(
    List<Task> taskList,
  ) : super.fill(
          taskList.length,
          (index) => taskList[index],
        );

  /// [Iterable] から [TaskList] を生成するコンストラクタ
  WeeklyTaskList.fromIterable(Iterable<Task> iterable)
      : super.fromIterable(
          iterable.length,
          iterable,
        );

  /// 同じ値の新しい参照を生成するコンストラクタ
  WeeklyTaskList.callDeepCopy(super.entryList, super.copyBuilder)
      : super.callDeepCopy();

  @override
  WeeklyTaskList<Task> deepCopy({
    required Task Function(Task task) copyBuilder,
  }) =>
      WeeklyTaskList.callDeepCopy(toEntryList(), copyBuilder);
}
