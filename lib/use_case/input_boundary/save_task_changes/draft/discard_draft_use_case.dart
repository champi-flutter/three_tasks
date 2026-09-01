
import 'package:three_tasks/entities/view_type/v_task.dart';

/// 下書き破棄フロー
abstract class DiscardDraftUseCase {
  Future<void> execute({required VTask task})async{}
}