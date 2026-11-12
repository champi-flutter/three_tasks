

import 'package:three_tasks/use_case/input_data/i_label/i_label.dart';

/// タスク ID をラベルに追加するフロー
abstract class SaveLabelChangesUseCase {
  Future<void> execute({
    required List<ILabel> labelInputDataList,
  });
}
