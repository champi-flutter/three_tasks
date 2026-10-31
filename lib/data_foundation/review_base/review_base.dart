
import 'package:three_tasks/enum/task_recurrence.dart';

/// レビューの DTO の基底クラス
abstract mixin class ReviewBase {

  /// タスク ID
  int get taskId;

  /// タスクの種別
  TaskRec get rec;

  /// ラベルの ID
  int get labelId;

  /// 結果
  String get result;

  /// 次回の方針
  String get next;

}
