// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_tasks_state_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 月単位タスク View Model

@ProviderFor(MonthlyTasksStateHandler)
const monthlyTasksStateHandlerProvider = MonthlyTasksStateHandlerProvider._();

/// 月単位タスク View Model
final class MonthlyTasksStateHandlerProvider extends $NotifierProvider<
    MonthlyTasksStateHandler, LazyMapViewState<Month, TaskList<VMonthlyTask>>> {
  /// 月単位タスク View Model
  const MonthlyTasksStateHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'monthlyTasksStateHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$monthlyTasksStateHandlerHash();

  @$internal
  @override
  MonthlyTasksStateHandler create() => MonthlyTasksStateHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
      LazyMapViewState<Month, TaskList<VMonthlyTask>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<LazyMapViewState<Month, TaskList<VMonthlyTask>>>(
              value),
    );
  }
}

String _$monthlyTasksStateHandlerHash() =>
    r'efe50e5486f1e197d371b744db9573ce6378c8a5';

/// 月単位タスク View Model

abstract class _$MonthlyTasksStateHandler
    extends $Notifier<LazyMapViewState<Month, TaskList<VMonthlyTask>>> {
  LazyMapViewState<Month, TaskList<VMonthlyTask>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<
        LazyMapViewState<Month, TaskList<VMonthlyTask>>,
        LazyMapViewState<Month, TaskList<VMonthlyTask>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyMapViewState<Month, TaskList<VMonthlyTask>>,
            LazyMapViewState<Month, TaskList<VMonthlyTask>>>,
        LazyMapViewState<Month, TaskList<VMonthlyTask>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
