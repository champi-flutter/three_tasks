import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/label/add_to_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/label/register_new_label_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

class RegisterNewLabelInteractor
    with NotificationFromUseCase
    implements RegisterNewLabelUseCase {
  // todo コンストラクタ
  RegisterNewLabelInteractor({
    required DataRepository repository,
    required AddInLabelUseCase addInLabelUseCase,
    required NotificationService notificationService,
  })  : _repository = repository,
        _addInLabelUseCase = addInLabelUseCase,
        notificationService = notificationService;

  /// Gateway へのアクセス
  final DataRepository _repository;

  /// タスク ID をラベルに追加するフローへのアクセス
  final AddInLabelUseCase _addInLabelUseCase;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  @override
  Future<void> execute({
    required String title,
    required VTask firstVTask,
  })
  // 折りたたみ用
  async {
    // リポジトリに新規ラベルの作成を依頼する
    final Result<int, Exception> result = await _repository.createNewLabel(
      title: title,
    );
    switch (result) {
      case Success(value: final int createdLabelId):
        // AddInLabelUseCase を実行する
        await _addInLabelUseCase.execute(
          targetVTask: firstVTask,
          targetLabelId: createdLabelId,
        );
      case Failure(
          exception: final Exception exc,
          methodName: final String? methodName,
        ):
        final Exception saveExc = saveError(methodName: methodName);
        notifyError(content: "$exc\n$saveExc");
    }
  }
}
