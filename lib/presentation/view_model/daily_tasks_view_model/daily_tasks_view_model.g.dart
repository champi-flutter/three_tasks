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
    DailyTasksViewModel, LazyMapViewState<Date, TaskList<VDailyTask>>> {
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

String _$dailyTasksViewModelHash() =>
    r'159c63b584f8995c275070537c1739eac78c953c';

abstract class _$DailyTasksViewModel
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
