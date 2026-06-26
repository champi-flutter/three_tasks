import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/entities/view_type/task_check_list.dart';

part 'task_check_editing_controller.g.dart';

/// タスクのチェックボックスの値を管理するクラス
// @riverpod
// class TaskCheckEditingController extends _$TaskCheckEditingController{
//   @override
//   List<bool> build(bool value1, bool value2, bool value3,){
//     return [value1, value2, value3];
//   }
// }

/// タスクのチェックボックスの値を管理するクラスの共通のインターフェース
abstract class TaskCheckControllerBase {
  void changeCheck(bool value);
}

@riverpod
class Task1CheckEditingController extends _$Task1CheckEditingController
    implements TaskCheckControllerBase {
  @override
  bool build(bool initialValue) {
    return initialValue;
  }

  @override
  void changeCheck(bool value) {
    if (state != value) {
      state = value;
    }
  }
}

@riverpod
class Task2CheckEditingController extends _$Task2CheckEditingController
    implements TaskCheckControllerBase {
  @override
  bool build(bool initialValue) {
    return initialValue;
  }

  @override
  void changeCheck(bool value) {
    if (state != value) {
      state = value;
    }
  }
}

@riverpod
class Task3CheckEditingController extends _$Task3CheckEditingController
    implements TaskCheckControllerBase {
  @override
  bool build(bool initialValue) {
    return initialValue;
  }

  @override
  void changeCheck(bool value) {
    if (state != value) {
      state = value;
    }
  }
}

@riverpod
class TaskCheckEditingController extends _$TaskCheckEditingController {
  @override
  TaskCheckList build(
    bool initialValue1,
    bool initialValue2,
    bool initialValue3,
  ) {
    return TaskCheckList(initialValue1, initialValue2, initialValue3);
  }

  /// 指定された位置のチェックボックスの値を変更する
  void check(int position, bool value) {
    state = state.check(position, value);
  }
}
