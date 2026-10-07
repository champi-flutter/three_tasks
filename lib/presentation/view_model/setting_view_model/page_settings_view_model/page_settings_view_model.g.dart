// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_settings_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PageSettingsViewModel)
const pageSettingsViewModelProvider = PageSettingsViewModelFamily._();

final class PageSettingsViewModelProvider extends $NotifierProvider<
    PageSettingsViewModel, LazyViewState<VSettingsMap<FixedList<dynamic>>>> {
  const PageSettingsViewModelProvider._(
      {required PageSettingsViewModelFamily super.from,
      required FixedList<dynamic> super.argument})
      : super(
          retry: null,
          name: r'pageSettingsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pageSettingsViewModelHash();

  @override
  String toString() {
    return r'pageSettingsViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PageSettingsViewModel create() => PageSettingsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
      LazyViewState<VSettingsMap<FixedList<dynamic>>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<LazyViewState<VSettingsMap<FixedList<dynamic>>>>(
              value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PageSettingsViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pageSettingsViewModelHash() =>
    r'e7f0031edeb06e4f2e780a6a6e3e2ca902aadd72';

final class PageSettingsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
            PageSettingsViewModel,
            LazyViewState<VSettingsMap<FixedList<dynamic>>>,
            LazyViewState<VSettingsMap<FixedList<dynamic>>>,
            LazyViewState<VSettingsMap<FixedList<dynamic>>>,
            FixedList<dynamic>> {
  const PageSettingsViewModelFamily._()
      : super(
          retry: null,
          name: r'pageSettingsViewModelProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PageSettingsViewModelProvider call(
    FixedList<dynamic> pageList,
  ) =>
      PageSettingsViewModelProvider._(argument: pageList, from: this);

  @override
  String toString() => r'pageSettingsViewModelProvider';
}

abstract class _$PageSettingsViewModel
    extends $Notifier<LazyViewState<VSettingsMap<FixedList<dynamic>>>> {
  late final _$args = ref.$arg as FixedList<dynamic>;
  FixedList<dynamic> get pageList => _$args;

  LazyViewState<VSettingsMap<FixedList<dynamic>>> build(
    FixedList<dynamic> pageList,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<
        LazyViewState<VSettingsMap<FixedList<dynamic>>>,
        LazyViewState<VSettingsMap<FixedList<dynamic>>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyViewState<VSettingsMap<FixedList<dynamic>>>,
            LazyViewState<VSettingsMap<FixedList<dynamic>>>>,
        LazyViewState<VSettingsMap<FixedList<dynamic>>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
