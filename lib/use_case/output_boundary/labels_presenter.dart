
import 'package:three_tasks/entities/e_label/e_label.dart';

/// Label の情報をView 層に反映させるクラス
abstract class LabelsPresenter {
  Future<void> present(List<ELabel> newData);
}