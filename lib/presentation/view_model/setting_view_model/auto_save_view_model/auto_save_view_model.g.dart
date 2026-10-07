// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_save_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AutoSaveViewModel)
const autoSaveViewModelProvider = AutoSaveViewModelProvider._();

final class AutoSaveViewModelProvider
    extends $NotifierProvider<AutoSaveViewModel, LazyViewState<bool>> {
  const AutoSaveViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'autoSaveViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$autoSaveViewModelHash();

  @$internal
  @override
  AutoSaveViewModel create() => AutoSaveViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LazyViewState<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LazyViewState<bool>>(value),
    );
  }
}

String _$autoSaveViewModelHash() => r'2b64c7744b3f24b65c78b30e43a3dfb2427a8ec0';

abstract class _$AutoSaveViewModel extends $Notifier<LazyViewState<bool>> {
  LazyViewState<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LazyViewState<bool>, LazyViewState<bool>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyViewState<bool>, LazyViewState<bool>>,
        LazyViewState<bool>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
