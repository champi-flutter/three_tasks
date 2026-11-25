// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_tasks_view_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 月単位タスク View Model

@ProviderFor(MonthlyTasksViewStateNotifier)
const monthlyTasksViewStateProvider = MonthlyTasksViewStateNotifierProvider._();

/// 月単位タスク View Model
final class MonthlyTasksViewStateNotifierProvider extends $NotifierProvider<
    MonthlyTasksViewStateNotifier,
    LazyMapViewState<Month, TaskList<VMonthlyTask>>> {
  /// 月単位タスク View Model
  const MonthlyTasksViewStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'monthlyTasksViewStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$monthlyTasksViewStateNotifierHash();

  @$internal
  @override
  MonthlyTasksViewStateNotifier create() => MonthlyTasksViewStateNotifier();

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

String _$monthlyTasksViewStateNotifierHash() =>
    r'09094c3a88252bc4197667a9cf5297872429c184';

/// 月単位タスク View Model

abstract class _$MonthlyTasksViewStateNotifier
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
