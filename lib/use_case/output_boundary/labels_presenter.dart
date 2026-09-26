
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';

/// Label の情報をView 層に反映させるクラス
abstract class LabelsPresenter {
  Future<void> present(LabelList<ELabel> newData);
}