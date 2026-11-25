// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_settings_state_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 各ページの設定

@ProviderFor(PageSettingsStateHandler)
const pageSettingsStateHandlerProvider = PageSettingsStateHandlerProvider._();

/// 各ページの設定
final class PageSettingsStateHandlerProvider extends $NotifierProvider<
    PageSettingsStateHandler, OnetimeLazyViewState<VSettingsMap>> {
  /// 各ページの設定
  const PageSettingsStateHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pageSettingsStateHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pageSettingsStateHandlerHash();

  @$internal
  @override
  PageSettingsStateHandler create() => PageSettingsStateHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnetimeLazyViewState<VSettingsMap> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<OnetimeLazyViewState<VSettingsMap>>(value),
    );
  }
}

String _$pageSettingsStateHandlerHash() =>
    r'd58035733a3cf1fe1889e04a56946ac164f07b68';

/// 各ページの設定

abstract class _$PageSettingsStateHandler
    extends $Notifier<OnetimeLazyViewState<VSettingsMap>> {
  OnetimeLazyViewState<VSettingsMap> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OnetimeLazyViewState<VSettingsMap>,
        OnetimeLazyViewState<VSettingsMap>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<OnetimeLazyViewState<VSettingsMap>,
            OnetimeLazyViewState<VSettingsMap>>,
        OnetimeLazyViewState<VSettingsMap>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
