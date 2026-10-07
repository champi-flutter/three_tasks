
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/view/wrapper/screens_wrapper.dart';

/// [ScreensWrapper] で管理するタスクのページの基底クラス
abstract class TaskPageBase extends ControlledPage{

  /// タスクの期間の単位（種別）
  TaskRec get rec;
}