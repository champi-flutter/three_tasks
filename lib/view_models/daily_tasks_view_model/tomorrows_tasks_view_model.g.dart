// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tomorrows_tasks_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TomorrowsTasksViewModel)
const tomorrowsTasksViewModelProvider = TomorrowsTasksViewModelProvider._();

final class TomorrowsTasksViewModelProvider
    extends $NotifierProvider<TomorrowsTasksViewModel, List<VDailyTask>> {
  const TomorrowsTasksViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tomorrowsTasksViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tomorrowsTasksViewModelHash();

  @$internal
  @override
  TomorrowsTasksViewModel create() => TomorrowsTasksViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VDailyTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VDailyTask>>(value),
    );
  }
}

String _$tomorrowsTasksViewModelHash() =>
    r'66cf42c9629858f776b66b2535e00e02b283ba2e';

abstract class _$TomorrowsTasksViewModel extends $Notifier<List<VDailyTask>> {
  List<VDailyTask> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<VDailyTask>, List<VDailyTask>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<VDailyTask>, List<VDailyTask>>,
        List<VDailyTask>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
