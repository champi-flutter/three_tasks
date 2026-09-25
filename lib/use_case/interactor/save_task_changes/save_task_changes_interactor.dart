import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク情報の変更を保存する処理フローを実装するクラス
class SaveTaskChangesInteractor
    with NotificationFromUseCase
    implements SaveTaskChangesUseCase {
  SaveTaskChangesInteractor({
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _repository = dataRepository,
        notificationService = notificationService,
        _loadingService = loadingService;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// ローディングの呼び出し口
  final LoadingService _loadingService;

  /// 通知送信先（[NotificationUseCase]）のインスタンス
  @override
  final NotificationService notificationService;

  /// タスク情報の変更を保存する処理フロー
  ///   1. パラメータの [VTask] を [DTask] に変換する
  ///   2. リポジトリにテータの保存を依頼する
  ///   3. キャッシュハンドラの `update` を実行する
  ///
  /// 変更の反映の完了まで `await` する。
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  @override
  Future<void> execute({
    required TaskList<ETask> updatingETaskList,
  }) =>
      _loadingService.loadAsync(
        () async {
          try {
            if (updatingETaskList.isEmpty) {
              throw Exception("無効な値です");
            }
            // リポジトリにデータの保存を依頼する
            final Result<void, Exception> result =
                await _repository.saveTaskChanges(updatingETaskList: updatingETaskList);
            // 失敗を通知する
            switch (result) {
              // region
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
        },
      );
}
