import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/entities/view_type/task_label_list.dart';

part 'task_label_editing_controller.g.dart';

/// タスクのチェックボックスの値を管理するクラス
@riverpod
class TaskLabelEditingController extends _$TaskLabelEditingController {
  @override
  TaskLabelList build(
      int? initialValue1,
      int? initialValue2,
      int? initialValue3,
      ){
    return TaskLabelList(initialValue1, initialValue2, initialValue3);
  }

  /// `state.label1` のラベル化マークの値
  bool get isLabeled1 => state.label1 !=null;

  /// `state.label2` のラベル化マークの値
  bool get isLabeled2 => state.label2 != null;

  /// `state.label3` のラベル化マークの値
  bool get isLabeled3 => state.label3 != null;

  /// `state.label1` が変更されたかどうか
  bool get isChanged1 => state.label1 != initialValue1;

  /// `state.label2` が変更されたかどうか
  bool get isChanged2 => state.label2 != initialValue2;

  /// `state.label3` が変更されたかどうか
  bool get isChanged3 => state.label3 != initialValue3;

  /// 変更があったかどうか
  bool get isChanged => isChanged1 || isChanged2 || isChanged3;

  int? get currentValue1 => state.label1;

  int? get currentValue2 => state.label2;

  int? get currentValue3 => state.label3;

  /// 指定された位置のチェックボックスの値を変更する
  void label(int position, int? value) {
    state = state.label(position, value);
  }
}