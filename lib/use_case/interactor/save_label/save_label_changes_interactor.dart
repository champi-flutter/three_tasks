import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_label_changes_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク ID をラベルに追加するフローを実装するクラス
class SaveLabelChangesInteractor
    with NotificationFromUseCase
    implements SaveLabelChangesUseCase {
  SaveLabelChangesInteractor({
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _repository = dataRepository,
        notificationService = notificationService,
        _loading = loadingService;

  /// Gateway へのアクセス
  final DataRepository _repository;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  final LoadingService _loading;

  /// タスク ID をラベルに追加するフローを実装
  /// todo ラベル情報変更保存フローに変更（2026/09/09）＞＞
  ///  - [DataRepository] に、 [targetVTask] の ID の対象ラベルへの追加を依頼する
  ///  - ラベルキャッシュの更新処理を呼び出す
  @override
  Future<void> execute({
    required ELabel updatingELabel,
  }) =>
      _loading.loadAsync(() async {
        try {
          // リポジトリにタスクIDの指定ラベルへの追加を依頼する
          final Result<void, Exception> result =
              await _repository.saveLabelChanges(eLabel: updatingELabel);
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
