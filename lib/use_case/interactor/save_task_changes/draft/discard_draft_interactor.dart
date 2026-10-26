import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 下書き破棄フローを実装するクラス
class DiscardDraftInteractor
    with NotificationFromUseCase
    implements DiscardDraftUseCase {
  // todo コンストラクタ
  DiscardDraftInteractor({
    required DataRepository dataRepository,
    required LoadingService loadingService,
    required NotificationService notificationService,
  })  : _repository = dataRepository,
        _loading = loadingService,
        notificationService = notificationService;

  /// [DataRepository] の呼び出し口
  final DataRepository _repository;

  /// ローディングの呼び出し口
  final LoadingService _loading;

  @override
  final NotificationService notificationService;

  /// 下書き破棄フローを実装
  @override
  Future<void> execute({required TaskRec taskRec}) =>
      _loading.loadAsync(() async {
        final Result<void, Exception> result =
            await _repository.outputCurrentTaskCache(taskRec);
        switch (result) {
          // region
          case Success():
            break;
          case Failure(
              exception: final Exception exc,
              methodName: final String? methodName,
            ):
            final Exception fetchExc = fetchError(methodName: methodName);
            throw Exception("$exc\n$fetchExc");
          // endregion
        }
      });
}
