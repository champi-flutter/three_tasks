// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yearly_tasks_view_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 年単位タスク View Model

@ProviderFor(YearlyTasksViewStateNotifier)
const yearlyTasksViewStateProvider = YearlyTasksViewStateNotifierProvider._();

/// 年単位タスク View Model
final class YearlyTasksViewStateNotifierProvider extends $NotifierProvider<
    YearlyTasksViewStateNotifier,
    LazyMapViewState<int, TaskList<VYearlyTask>>> {
  /// 年単位タスク View Model
  const YearlyTasksViewStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'yearlyTasksViewStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$yearlyTasksViewStateNotifierHash();

  @$internal
  @override
  YearlyTasksViewStateNotifier create() => YearlyTasksViewStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
      LazyMapViewState<int, TaskList<VYearlyTask>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<LazyMapViewState<int, TaskList<VYearlyTask>>>(
              value),
    );
  }
}

String _$yearlyTasksViewStateNotifierHash() =>
    r'a38f1e5ddacd6372b568209dbec4cb63ed40dee3';

/// 年単位タスク View Model

abstract class _$YearlyTasksViewStateNotifier
    extends $Notifier<LazyMapViewState<int, TaskList<VYearlyTask>>> {
  LazyMapViewState<int, TaskList<VYearlyTask>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LazyMapViewState<int, TaskList<VYearlyTask>>,
        LazyMapViewState<int, TaskList<VYearlyTask>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyMapViewState<int, TaskList<VYearlyTask>>,
            LazyMapViewState<int, TaskList<VYearlyTask>>>,
        LazyMapViewState<int, TaskList<VYearlyTask>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
