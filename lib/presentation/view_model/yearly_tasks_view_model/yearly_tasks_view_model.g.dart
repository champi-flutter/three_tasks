// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yearly_tasks_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 月単位タスク View Model

@ProviderFor(YearlyTasksViewModel)
const yearlyTasksViewModelProvider = YearlyTasksViewModelProvider._();

/// 月単位タスク View Model
final class YearlyTasksViewModelProvider extends $NotifierProvider<
    YearlyTasksViewModel, LazyMapViewState<int, TaskList<VYearlyTask>>> {
  /// 月単位タスク View Model
  const YearlyTasksViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'yearlyTasksViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$yearlyTasksViewModelHash();

  @$internal
  @override
  YearlyTasksViewModel create() => YearlyTasksViewModel();

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

String _$yearlyTasksViewModelHash() =>
    r'03dcc193d8a3f01d46da701969f04759779bd325';

/// 月単位タスク View Model

abstract class _$YearlyTasksViewModel
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
