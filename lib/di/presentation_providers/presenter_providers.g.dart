// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presenter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ラベルデータ反映クラス

@ProviderFor(labelsPresenter)
const labelsPresenterProvider = LabelsPresenterProvider._();

/// ラベルデータ反映クラス

final class LabelsPresenterProvider extends $FunctionalProvider<LabelsPresenter,
    LabelsPresenter, LabelsPresenter> with $Provider<LabelsPresenter> {
  /// ラベルデータ反映クラス
  const LabelsPresenterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labelsPresenterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsPresenterHash();

  @$internal
  @override
  $ProviderElement<LabelsPresenter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabelsPresenter create(Ref ref) {
    return labelsPresenter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabelsPresenter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabelsPresenter>(value),
    );
  }
}

String _$labelsPresenterHash() => r'a95decdda6e2d12d9aab70eaa87dcb6b041f5c11';

/// 各種設定反映クラス

@ProviderFor(settingsPresenter)
const settingsPresenterProvider = SettingsPresenterProvider._();

/// 各種設定反映クラス

final class SettingsPresenterProvider extends $FunctionalProvider<
    SettingsPresenter,
    SettingsPresenter,
    SettingsPresenter> with $Provider<SettingsPresenter> {
  /// 各種設定反映クラス
  const SettingsPresenterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'settingsPresenterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$settingsPresenterHash();

  @$internal
  @override
  $ProviderElement<SettingsPresenter> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsPresenter create(Ref ref) {
    return settingsPresenter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsPresenter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsPresenter>(value),
    );
  }
}

String _$settingsPresenterHash() => r'27036811072e1c3fda697c88c11d3af1158213e0';
