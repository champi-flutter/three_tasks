import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';

sealed class TaskListBase<Task extends TaskBase> extends FixedList<Task>{
  TaskListBase.fill(super.length, super.fill) : super.fill();
  TaskListBase.fromIterable(super.length, super.iterable): super.fromIterable();

  @protected
  TaskListBase.copy(super.list): super.copy();

  @override
  TaskListBase<Task> get deepCopy;
}

/// タスクのリスト
///
/// 要素数を 3 つに固定する。
class TaskList<Task extends TaskBase> extends TaskListBase<Task>{
  TaskList(
    Task task1,
    Task task2,
    Task task3,
  ) : super.fill(
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
        super.fromIterable(
          3,
          iterable,
        );

  /// [deepCopy] の実装のための内部的なコンストラクタ
  TaskList._copy(super.list): super.copy();

  /// 同じ情報を持つ別の新しい [TaskList]  のインスタンスを生成する
  @override
  TaskList<Task> get deepCopy => TaskList._copy(toList());
}

/// 週タスクのリスト
///
/// 週タスクのみ、要素数を 3 つに固定しない。
class WeeklyTaskList<Task extends WeeklyTaskBase> extends TaskListBase<Task> {
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

  /// [deepCopy] の実装のための内部的なコンストラクタ
  WeeklyTaskList._copy(super.list): super.copy();

  /// 同じ情報を持つ別の新しい [WeeklyTaskList]  のインスタンスを生成する
  @override
  WeeklyTaskList<Task> get deepCopy => WeeklyTaskList._copy(toList());
}
