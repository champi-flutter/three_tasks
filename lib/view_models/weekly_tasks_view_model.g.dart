// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_tasks_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeeklyTasksViewModel)
const weeklyTasksViewModelProvider = WeeklyTasksViewModelProvider._();

final class WeeklyTasksViewModelProvider
    extends $NotifierProvider<WeeklyTasksViewModel, List<VWeeklyTask>> {
  const WeeklyTasksViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'weeklyTasksViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weeklyTasksViewModelHash();

  @$internal
  @override
  WeeklyTasksViewModel create() => WeeklyTasksViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VWeeklyTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VWeeklyTask>>(value),
    );
  }
}

String _$weeklyTasksViewModelHash() =>
    r'88a6d13926c17ffb8d4b4ec88f0d7555e9147838';

abstract class _$WeeklyTasksViewModel extends $Notifier<List<VWeeklyTask>> {
  List<VWeeklyTask> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<VWeeklyTask>, List<VWeeklyTask>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<VWeeklyTask>, List<VWeeklyTask>>,
        List<VWeeklyTask>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
