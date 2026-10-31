import 'package:three_tasks/data_foundation/review_base/review_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

/// レビューの表示用 DTO
class VReview with ReviewBase {
  /// タスク ID
  final int taskId;

  /// タスクの種別
  final TaskRec rec;

  /// ラベルの ID
  final int labelId;

  /// 結果
  final String result;

  /// 次回の方針
  final String next;

  const VReview({
    required this.taskId,
    required this.rec,
    required this.labelId,
    required this.result,
    required this.next,
  });

  const VReview.placeholder({
    required this.rec,
  }):taskId = -1, labelId = -1, result = "", next = "";
}
