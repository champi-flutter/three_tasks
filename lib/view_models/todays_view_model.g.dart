// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodaysViewModel)
const todaysViewModelProvider = TodaysViewModelProvider._();

final class TodaysViewModelProvider
    extends $NotifierProvider<TodaysViewModel, List<VDayTask>> {
  const TodaysViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'todaysViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$todaysViewModelHash();

  @$internal
  @override
  TodaysViewModel create() => TodaysViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VDayTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VDayTask>>(value),
    );
  }
}

String _$todaysViewModelHash() => r'0c9ae41664786821f3776d8bc579775683cdd560';

abstract class _$TodaysViewModel extends $Notifier<List<VDayTask>> {
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
