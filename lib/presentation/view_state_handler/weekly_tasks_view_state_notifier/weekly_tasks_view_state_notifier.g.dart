// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_tasks_view_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeeklyTasksViewStateNotifier)
const weeklyTasksViewStateProvider = WeeklyTasksViewStateNotifierProvider._();

final class WeeklyTasksViewStateNotifierProvider
    extends $NotifierProvider<WeeklyTasksViewStateNotifier, WeeklyLazyMap> {
  const WeeklyTasksViewStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'weeklyTasksViewStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weeklyTasksViewStateNotifierHash();

  @$internal
  @override
  WeeklyTasksViewStateNotifier create() => WeeklyTasksViewStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeeklyLazyMap value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeeklyLazyMap>(value),
    );
  }
}

String _$weeklyTasksViewStateNotifierHash() =>
    r'522fc508a5712867327bdc6d31d558edde27a5e3';

abstract class _$WeeklyTasksViewStateNotifier extends $Notifier<WeeklyLazyMap> {
  WeeklyLazyMap build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WeeklyLazyMap, WeeklyLazyMap>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<WeeklyLazyMap, WeeklyLazyMap>,
        WeeklyLazyMap,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
