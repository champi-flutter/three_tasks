
import 'package:three_tasks/domain/entity/e_task/e_task.dart';

/// 新規ラベル登録フロー
abstract class RegisterNewLabelUseCase {

  Future<void> execute({
    required String title,
    required ETask firstETask,
  });
}