// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_tasks_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DailyTasksViewModel)
const dailyTasksViewModelProvider = DailyTasksViewModelProvider._();

final class DailyTasksViewModelProvider extends $NotifierProvider<
    DailyTasksViewModel, LazyMap<Date, TaskList<VDailyTask>>> {
  const DailyTasksViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dailyTasksViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyTasksViewModelHash();

  @$internal
  @override
  DailyTasksViewModel create() => DailyTasksViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LazyMap<Date, TaskList<VDailyTask>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<LazyMap<Date, TaskList<VDailyTask>>>(value),
    );
  }
}

String _$dailyTasksViewModelHash() =>
    r'6f74308d9913862a86eeeb4491c91646d79306f5';

abstract class _$DailyTasksViewModel
    extends $Notifier<LazyMap<Date, TaskList<VDailyTask>>> {
  LazyMap<Date, TaskList<VDailyTask>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LazyMap<Date, TaskList<VDailyTask>>,
        LazyMap<Date, TaskList<VDailyTask>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyMap<Date, TaskList<VDailyTask>>,
            LazyMap<Date, TaskList<VDailyTask>>>,
        LazyMap<Date, TaskList<VDailyTask>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
