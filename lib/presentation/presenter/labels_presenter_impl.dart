import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/presentation/view_model/labels_view_model/labels_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_label/converter/e_to_v_label.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/use_case/output_boundary/labels_presenter.dart';

/// Label の情報をView 層に反映させるクラスの実装
class LabelsPresenterImpl implements LabelsPresenter {
  // todo コンストラクタ
  LabelsPresenterImpl({required LabelsViewModel labelsViewModel})
      : _viewModel = labelsViewModel;

  /// [LabelsViewModel] の呼び出し口
  final LabelsViewModel _viewModel;

  @override
  Future<void> present(List<ELabel> newData) async {
    final List<VLabel> adaptedData = newData.map(EToVLabel.toVLabel).toList();
    _viewModel.update(adaptedData);
  }
}
