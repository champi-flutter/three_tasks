import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/entities/view_type/task_title_controller_list.dart';

part 'task_title_editing_controller.g.dart';

/// タスク入力欄の編集状態を管理するクラス
@riverpod
class TaskTitleEditingController extends _$TaskTitleEditingController {
  @override
  TaskTitleControllerList build({
    required String title1,
    required String title2,
    required String title3,
  }) {
    final controllerList = TaskTitleControllerList(
      TextEditingController(text: title1),
      TextEditingController(text: title2),
      TextEditingController(text: title3),
    );
    ref.onDispose(() {
      controllerList.disposeAll();
    });
    return controllerList;
  }
}

@riverpod
class Task1TitleEditingController extends _$Task1TitleEditingController {
  @override
  TextEditingController build(String title) {
    final controller = TextEditingController(text: title);
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}

@riverpod
class Task2TitleEditingController extends _$Task2TitleEditingController {
  @override
  TextEditingController build(String title) {
    final controller = TextEditingController(text: title);
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}

@riverpod
class Task3TitleEditingController extends _$Task3TitleEditingController {
  @override
  TextEditingController build(String title) {
    final controller = TextEditingController(text: title);
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}
