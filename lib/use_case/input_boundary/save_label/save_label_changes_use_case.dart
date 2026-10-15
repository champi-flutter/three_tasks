

import 'package:three_tasks/domain/entity/e_label/e_label.dart';

/// タスク ID をラベルに追加するフロー
abstract class SaveLabelChangesUseCase {
  Future<void> execute({
    required List<ELabel> updatedELabels,
  });
}
