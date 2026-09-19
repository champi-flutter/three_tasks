
import 'package:three_tasks/enum/task_recurrence.dart';

/// 下書き破棄フロー
abstract class DiscardDraftUseCase {
  Future<void> execute({required TaskRec taskRec});
}