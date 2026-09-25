import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_label/fetch_label_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/labels_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// ラベルデータをフェッチするフローを実行する具象クラス
class FetchLabelInteractor
    with NotificationFromUseCase
    implements FetchLabelUseCase {
  // todo コンストラクタ
  FetchLabelInteractor({
    required DataRepository dataRepository,
    required LabelsPresenter labelsPresenter,
    required LoadingService loadingService,
    required NotificationService notificationService,
  })  : _repository = dataRepository,
        _presenter = labelsPresenter,
        notificationService = notificationService,
        _loading = loadingService;

  /// [DataRepository] の呼び出し口
  final DataRepository _repository;

  /// [LabelsPresenter] の呼び出し口
  final LabelsPresenter _presenter;

  @override
  final NotificationService notificationService;

  final LoadingService _loading;

  @override
  Future<void> execute() => _loading.loadAsync(() async {
        // リポジトリからデータを取得する
        final Result<List<ELabel>, Exception> fetched =
            await _repository.fetchLabel();
        switch (fetched) {
          case Success(value: final List<ELabel> successList):
            // フェッチが成功した場合に、Presenter にデータを流す
            await _presenter.present(successList);
          case Failure(
              exception: final Exception exc,
              methodName: final String? methodName,
            ):
            final Exception fetchExc = fetchError(methodName: methodName);
            notifyError(content: "$exc\n$fetchExc");
        }
      });
}
