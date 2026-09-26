

import 'package:three_tasks/entities/e_label/e_label.dart';

/// タスク ID をラベルに追加するフロー
abstract class SaveLabelChangesUseCase {
  Future<void> execute({
    required ELabel updatingELabel,
  });
}
