import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/use_case/input_boundary/draft_label/draft_label_changes_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/labels_presenter.dart';

/// タスク情報の変更を下書きとして保有する処理フローを実装するクラス
class DraftLabelChangesInteractor
    with NotificationFromUseCase
    implements DraftLabelChangesUseCase {
  // todo コンストラクタ
  DraftLabelChangesInteractor({
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : notificationService = notificationService,
        _loadingService = loadingService;

  // todo 依存先
  // /// 受信データを反映させるポートのインスタンス
  // final LabelsPresenter _presenter;

  /// ローディングの呼び出し口
  final LoadingService _loadingService;

  /// 通知送信先（[NotificationUseCase]）のインスタンス
  @override
  final NotificationService notificationService;

  /// タスク情報の変更を下書きとして保有する処理フロー
  ///
  /// 変更の反映の完了まで `await` する。
  @override
  Future<Result<void, Exception>> execute({
    required ELabel  draft,
  }) =>
      _loadingService.loadAsync<Result<void, Exception>>(
        () async {
          try {
            // データの反映を Presenter に依頼する
            await _publishLabels(draft);
            return Success(null);
          } catch (e, st) {
            final errorMsg = "$e\n$st";
            notifyError(content: errorMsg, specifiesLayer: true);
            return Failure(Exception(errorMsg));
          }
        },
      );

  // todo presenter に渡さないでいいが、保存されるか破棄されるまでもっておく必要がある（2026/09/26）＞＞
  /// データを反映させるプライベートメソッド
  Future<void> _publishLabels(ELabel newDraft) =>
      _presenter.present(newDraft);
}
