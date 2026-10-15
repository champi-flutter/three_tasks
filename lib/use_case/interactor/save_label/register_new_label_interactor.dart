import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/register_new_label_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 新規ラベル登録フローの実装
class RegisterNewLabelInteractor
    with NotificationFromUseCase
    implements RegisterNewLabelUseCase {
  // todo コンストラクタ
  RegisterNewLabelInteractor({
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _repository = dataRepository,
        _loading = loadingService,
        notificationService = notificationService;

  /// Gateway へのアクセス
  final DataRepository _repository;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  /// ローディング機能呼び出し口
  final LoadingService _loading;

  @override
  Future<void> execute({
    required String title,
    required ETask firstETask,
  }) =>
      _loading.loadAsync(() async {
        // リポジトリに新規ラベルの作成を依頼する
        final Result<void, Exception> result = await _repository.createNewLabel(
          title: title,
          firstETask: firstETask,
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
      });
}
