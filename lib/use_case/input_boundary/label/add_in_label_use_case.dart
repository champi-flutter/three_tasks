import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';

/// タスク ID をラベルに追加するフロー
abstract class AddInLabelUseCase {
  Future<void> execute({
    required VTask targetVTask,
    required int targetLabelId,
  });
}
