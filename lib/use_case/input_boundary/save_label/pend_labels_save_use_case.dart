

import 'package:three_tasks/use_case/input_data/i_label/i_label.dart';

abstract class PendLabelsSaveUseCase {
  Future<void> execute(ILabel iLabel);
}