import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_settings/fetch_settings_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/settings_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 各種設定値フェッチフローの実装
class FetchSettingsInteractor
    with NotificationFromUseCase
    implements FetchSettingsUseCase {
  FetchSettingsInteractor({
    required DataRepository dataRepository,
    required SettingsPresenter settingsPresenter,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _repository = dataRepository,
        _presenter = settingsPresenter,
        notificationService = notificationService,
        _loading = loadingService;

  /// リポジトリ呼び出し口
  final DataRepository _repository;

  /// Presenter 呼び出し口
  final SettingsPresenter _presenter;

  /// ローディング機能呼び出し口
  final LoadingService _loading;

  @override
  final NotificationService notificationService;

  @override
  Future<void> execute({required int validLength}) =>
      _loading.loadAsync(() async {
        try {
          final Result<ESettingsMap, Exception> result =
              await _repository.fetchSettings();
          switch (result) {
            // region
            case Success(value: final ESettingsMap resultMap):
              // 想定通りのデータをフェッチできた場合
              if (validLength == resultMap.length) {
                // Presenter に渡す
                await _presenter.present(resultMap);
              }
              // データがまだなかった場合（アプリ初起動時）
              else if (resultMap.isEmpty) {
                await _initSettings(validLength);
              }
              // その他は実装エラー
              else {
                throw RangeError(
                  "[FetchSettingsUseCase.execute] 無効なデータです。\n（resultMap.length = ${resultMap.length}）",
                );
              }
            case Failure(
                exception: final Exception exc,
                methodName: final String? methodName,
              ):
              final Exception fetchExc = fetchError(methodName: methodName);
              notifyError(content: "$exc\n$fetchExc");
            // endregion
          }
        } catch (e, st) {
          // エラーを通知
          notifyError(content: "$e\n$st");
        }
      });

  /// 設定の初期化（アプリ初起動時）
  Future<void> _initSettings(int length) async {
    final Result<ESettingsMap, Exception> result =
        await _repository.initSettings(
      length: length,
    );

    switch (result) {
      // region
      case Success(value: final ESettingsMap resultMap):
        // 想定通りのデータをフェッチできた場合
        if (length == resultMap.length) {
          // Presenter に渡す
          await _presenter.present(resultMap);
        }
        // その他は実装エラー
        else {
          throw RangeError(
            "[FetchSettingsUseCase.execute] 無効なデータです。\n（resultMap.length = ${resultMap.length}）",
          );
        }
      case Failure(
          exception: final Exception exc,
          methodName: final String? methodName,
        ):
        final Exception fetchExc = fetchError(methodName: methodName);
        notifyError(content: "$exc\n$fetchExc");
      // endregion
    }
  }
}
