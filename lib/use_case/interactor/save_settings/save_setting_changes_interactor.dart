import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';
import 'package:three_tasks/use_case/input_boundary/save_settings/save_setting_changes_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/settings_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 設定値変更保存フローを実装するクラス
class SaveSettingChangesInteractor
    with NotificationFromUseCase
    implements SaveSettingChangesUseCase {
  // todo コンストラクタ
  SaveSettingChangesInteractor({
    required SettingsPresenter settingsPresenter,
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _presenter = settingsPresenter,
        _repository = dataRepository,
        _loading = loadingService,
        notificationService = notificationService;

  /// presentation 層への反映の呼び出し口
  final SettingsPresenter _presenter;

  /// インフラ層へのアクセス
  final DataRepository _repository;

  /// ローディング機能呼び出し口
  final LoadingService _loading;

  @override
  final NotificationService notificationService;

  @override
  Future<void> execute({
    required EPageSetting ePageSetting,
  }) =>
      _loading.loadAsync(() async {
        // リポジトリに設定値の変更の保存を依頼する
        final Result<void, Exception> result =
            await _repository.saveSettingChanges(
          ePageSetting: ePageSetting,
        );

        switch (result) {
          // region
          case Success():
            // presentation に反映させる
            await _presenter.presentWith(ePageSetting);
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
