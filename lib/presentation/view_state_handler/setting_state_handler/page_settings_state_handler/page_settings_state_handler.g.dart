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
    PageSettingsStateHandler, LazyViewState<VSettingsMap>> {
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
  Override overrideWithValue(LazyViewState<VSettingsMap> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LazyViewState<VSettingsMap>>(value),
    );
  }
}

String _$pageSettingsStateHandlerHash() =>
    r'0c4012f1b7748907d13114fe273674788501c977';

/// 各ページの設定

abstract class _$PageSettingsStateHandler
    extends $Notifier<LazyViewState<VSettingsMap>> {
  LazyViewState<VSettingsMap> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<LazyViewState<VSettingsMap>, LazyViewState<VSettingsMap>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyViewState<VSettingsMap>, LazyViewState<VSettingsMap>>,
        LazyViewState<VSettingsMap>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
