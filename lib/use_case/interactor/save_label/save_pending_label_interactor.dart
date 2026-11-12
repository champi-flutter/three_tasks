import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/domain/entity/e_label/e_label.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_label_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_pending_label_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/repository_interface/label_draft_repository.dart';

class SavePendingLabelInteractor
    with NotificationFromUseCase
    implements SavePendingLabelUseCase {
  SavePendingLabelInteractor({
    required DataRepository dataRepository,
    required LabelDraftRepository labelDraftRepository,
    required LoadingService loadingService,
    required NotificationService notificationService,
  })  : _dataRepository = dataRepository,
        _draftRepository = labelDraftRepository,
        _loading = loadingService,
        notificationService = notificationService;

  /// データ層へのアクセスポイント
  final DataRepository _dataRepository;

  /// 下書き保管場所
  final LabelDraftRepository _draftRepository;

  final LoadingService _loading;

  @override
  final NotificationService notificationService;

  @override
  Future<void> execute() => _loading.loadAsync(() async {
        try {
          // 下書きを取得する
          final List<ELabel> currentDraft = _draftRepository.getDraft();
          // 保留していた下書きを破棄する
          _draftRepository.dispose();
          // リポジトリにタスクIDの指定ラベルへの追加を依頼する
          final Result<void, Exception> result =
              await _dataRepository.saveLabelChanges(
            changedLabels: currentDraft,
            shouldReflect: true,
          );
          // 失敗を通知する
          switch (result) {
            // region switch
            case Success():
              break;
            case Failure(
                exception: final Exception exc,
                methodName: final String? methodName,
              ):
              final Exception fetchExc = fetchError(methodName: methodName);
              notifyError(content: "$exc\n$fetchExc");
            // endregion
          }
        } catch (e) {
          notifyError(content: "$e", specifiesLayer: true);
        }
      });
}
