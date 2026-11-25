// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_tasks_view_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DailyTasksViewStateNotifier)
const dailyTasksViewStateProvider = DailyTasksViewStateNotifierProvider._();

final class DailyTasksViewStateNotifierProvider extends $NotifierProvider<
    DailyTasksViewStateNotifier, LazyMapViewState<Date, TaskList<VDailyTask>>> {
  const DailyTasksViewStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dailyTasksViewStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyTasksViewStateNotifierHash();

  @$internal
  @override
  DailyTasksViewStateNotifier create() => DailyTasksViewStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
      LazyMapViewState<Date, TaskList<VDailyTask>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<LazyMapViewState<Date, TaskList<VDailyTask>>>(
              value),
    );
  }
}

String _$dailyTasksViewStateNotifierHash() =>
    r'be9ffbc4b96699f54adef71cdc7d4efeccd21854';

abstract class _$DailyTasksViewStateNotifier
    extends $Notifier<LazyMapViewState<Date, TaskList<VDailyTask>>> {
  LazyMapViewState<Date, TaskList<VDailyTask>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LazyMapViewState<Date, TaskList<VDailyTask>>,
        LazyMapViewState<Date, TaskList<VDailyTask>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyMapViewState<Date, TaskList<VDailyTask>>,
            LazyMapViewState<Date, TaskList<VDailyTask>>>,
        LazyMapViewState<Date, TaskList<VDailyTask>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
