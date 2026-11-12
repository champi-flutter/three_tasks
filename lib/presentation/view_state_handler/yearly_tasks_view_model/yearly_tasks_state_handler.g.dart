// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yearly_tasks_state_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 年単位タスク View Model

@ProviderFor(YearlyTasksStateHandler)
const yearlyTasksStateHandlerProvider = YearlyTasksStateHandlerProvider._();

/// 年単位タスク View Model
final class YearlyTasksStateHandlerProvider extends $NotifierProvider<
    YearlyTasksStateHandler, LazyMapViewState<int, TaskList<VYearlyTask>>> {
  /// 年単位タスク View Model
  const YearlyTasksStateHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'yearlyTasksStateHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$yearlyTasksStateHandlerHash();

  @$internal
  @override
  YearlyTasksStateHandler create() => YearlyTasksStateHandler();

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

String _$yearlyTasksStateHandlerHash() =>
    r'24c2ad49afaded523c62cad46b2407a7d6cd2187';

/// 年単位タスク View Model

abstract class _$YearlyTasksStateHandler
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
