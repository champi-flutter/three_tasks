import 'package:flutter/material.dart';

/// TasksView の [TextEditingController] を扱うクラス
class TaskTitleControllerList {
  /// タスク1のタイトルの [TextEditingController]
  final TextEditingController titleController1;

  /// タスク2のタイトルの [TextEditingController]
  final TextEditingController titleController2;

  /// タスク3のタイトルの [TextEditingController]
  final TextEditingController titleController3;

  TaskTitleControllerList(
    this.titleController1,
    this.titleController2,
    this.titleController3,
  );

  /// コントローラの破棄
  void disposeAll (){
    titleController1.dispose();
    titleController2.dispose();
    titleController3.dispose();
  }
}
