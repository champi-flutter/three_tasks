// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_settings_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 各ページの設定

@ProviderFor(PageSettingsViewModel)
const pageSettingsViewModelProvider = PageSettingsViewModelProvider._();

/// 各ページの設定
final class PageSettingsViewModelProvider extends $NotifierProvider<
    PageSettingsViewModel, LazyViewState<VSettingsMap>> {
  /// 各ページの設定
  const PageSettingsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pageSettingsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pageSettingsViewModelHash();

  @$internal
  @override
  PageSettingsViewModel create() => PageSettingsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LazyViewState<VSettingsMap> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LazyViewState<VSettingsMap>>(value),
    );
  }
}

String _$pageSettingsViewModelHash() =>
    r'985cf276a91b23894f9d19ea11bcfe0ce77abe66';

/// 各ページの設定

abstract class _$PageSettingsViewModel
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
