
import 'package:three_tasks/use_case/input_boundary/fetch_label/fetch_label_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/labels_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// ラベルデータをフェッチするフローを実行する具象クラス
class FetchLabelInteractor implements FetchLabelUseCase{

  // todo コンストラクタ
  FetchLabelInteractor({
    required DataRepository dataRepository,
    required LabelsPresenter labelsPresenter,
  }): _repository = dataRepository, _presenter = labelsPresenter;

  /// [DataRepository] の呼び出し口
  final DataRepository _repository;

  /// [LabelsPresenter] の呼び出し口
  final LabelsPresenter _presenter;

  @override
  Future<void> execute()async{
    await _repository.fetchLabel()
  }
}