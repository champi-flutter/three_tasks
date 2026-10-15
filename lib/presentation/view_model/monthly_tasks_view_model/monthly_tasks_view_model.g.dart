// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_tasks_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 月単位タスク View Model

@ProviderFor(MonthlyTasksViewModel)
const monthlyTasksViewModelProvider = MonthlyTasksViewModelProvider._();

/// 月単位タスク View Model
final class MonthlyTasksViewModelProvider extends $NotifierProvider<
    MonthlyTasksViewModel, LazyMapViewState<Month, TaskList<VMonthlyTask>>> {
  /// 月単位タスク View Model
  const MonthlyTasksViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'monthlyTasksViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$monthlyTasksViewModelHash();

  @$internal
  @override
  MonthlyTasksViewModel create() => MonthlyTasksViewModel();

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

String _$monthlyTasksViewModelHash() =>
    r'20727ba3b7f44ce41db81632275869eeac870dd0';

/// 月単位タスク View Model

abstract class _$MonthlyTasksViewModel
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
