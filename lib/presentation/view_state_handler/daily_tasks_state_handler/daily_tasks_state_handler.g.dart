// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_tasks_state_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DailyTasksStateHandler)
const dailyTasksStateHandlerProvider = DailyTasksStateHandlerProvider._();

final class DailyTasksStateHandlerProvider extends $NotifierProvider<
    DailyTasksStateHandler, LazyMapViewState<Date, TaskList<VDailyTask>>> {
  const DailyTasksStateHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dailyTasksStateHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyTasksStateHandlerHash();

  @$internal
  @override
  DailyTasksStateHandler create() => DailyTasksStateHandler();

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

String _$dailyTasksStateHandlerHash() =>
    r'a8134204a110047992407632df0400635e6298bc';

abstract class _$DailyTasksStateHandler
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
