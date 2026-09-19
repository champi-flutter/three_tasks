

import 'package:three_tasks/use_case/input_parameter/label_update_parameter/label_update_parameter.dart';

/// タスク ID をラベルに追加するフロー
abstract class SaveLabelChangesUseCase {
  Future<void> execute({
    required LabelUpdateParameter updateParameter,
  });
}
