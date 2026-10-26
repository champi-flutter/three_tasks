
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/domain/entity/e_label/e_label.dart';

/// Label の情報をView 層に反映させるクラス
abstract class LabelsPresenter {
  // /// ラベルを1つ指定して更新を反映させる
  // Future<void> presentWith(ELabel newLabel);

  /// ラベルリストの変更をまとめて反映させる
  Future<void> present(LabelList<ELabel> newData);
}