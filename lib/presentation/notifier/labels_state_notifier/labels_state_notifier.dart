
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';

/// ラベル ViewState 更新インターフェース
abstract class LabelsStateNotifier {

  /// [state] の更新
  void update(LabelList<VLabel> newState);
}