
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';

/// 新規ラベル登録フロー
abstract class RegisterNewLabelUseCase {

  Future<void> execute({
    required String title,
    required VTask firstVTask,
  });
}