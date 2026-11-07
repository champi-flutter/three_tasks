import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/domain/entity/e_label/e_label.dart';
import 'package:three_tasks/presentation/notifier/labels_state_notifier/labels_state_notifier.dart';
import 'package:three_tasks/presentation/view_state/v_label/converter/e_to_v_label.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/use_case/output_boundary/labels_presenter.dart';

/// Label の情報を View 層に反映させるクラスの実装
class LabelsPresenterImpl implements LabelsPresenter {
  // todo コンストラクタ
  LabelsPresenterImpl({required LabelsStateNotifier labelsStateNotifier})
      : _state = labelsStateNotifier;

  /// ラベル ViewState 更新呼び出し口
  final LabelsStateNotifier _state;

  // @override
  // Future<void> present(ELabel newLabel) async {
  //   final LabelList<VLabel> adaptedData = newLabel.mapValues<VLabel>(EToVLabel.toVLabel).toListAs(LabelList.fromIterable);
  //   _viewModel.update(adaptedData);
  // }

  @override
  Future<void> present(LabelList<ELabel> newData) async {
    final LabelList<VLabel> adaptedData = newData.mapValues<VLabel>(EToVLabel.toVLabel).toListAs(LabelList.fromIterable);
    _state.update(adaptedData);
  }
}
