

import 'package:three_tasks/data_foundation/task_base/task_base.dart';

/// タスク更新用 DTO の基となる型
abstract mixin class BaseTaskUpdater<Task extends TaskBase> {

  /// タスクの期間の単位
  Task get taskOrigin;

  /// タスクタイトル
  String? get newTitle;

  /// チェックされているかどうか
  bool? get newChecked;

  /// 登録されているラベルの ID
  ///
  /// ラベル未登録の状態を null => -1 に変更
  int? get newLabelId;
}