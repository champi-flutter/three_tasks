// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tomorrows_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TomorrowsViewModel)
const tomorrowsViewModelProvider = TomorrowsViewModelProvider._();

final class TomorrowsViewModelProvider
    extends $NotifierProvider<TomorrowsViewModel, List<VDayTask>> {
  const TomorrowsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tomorrowsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tomorrowsViewModelHash();

  @$internal
  @override
  TomorrowsViewModel create() => TomorrowsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VDayTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VDayTask>>(value),
    );
  }
}

String _$tomorrowsViewModelHash() =>
    r'c31d7744f52503c2f45f937c39545e23ff0c045f';

abstract class _$TomorrowsViewModel extends $Notifier<List<VDayTask>> {
  List<VDayTask> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<VDayTask>, List<VDayTask>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<VDayTask>, List<VDayTask>>,
        List<VDayTask>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
