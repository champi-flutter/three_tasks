
import 'package:three_tasks/data_foundation/value_object/task_recurrence.dart';

/// 下書き破棄フロー
abstract class DiscardDraftUseCase {
  Future<void> execute({required TaskRec taskRec});
}