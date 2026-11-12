// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_tasks_state_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeeklyTasksStateHandler)
const weeklyTasksStateHandlerProvider = WeeklyTasksStateHandlerProvider._();

final class WeeklyTasksStateHandlerProvider
    extends $NotifierProvider<WeeklyTasksStateHandler, WeeklyLazyMap> {
  const WeeklyTasksStateHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'weeklyTasksStateHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weeklyTasksStateHandlerHash();

  @$internal
  @override
  WeeklyTasksStateHandler create() => WeeklyTasksStateHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeeklyLazyMap value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeeklyLazyMap>(value),
    );
  }
}

String _$weeklyTasksStateHandlerHash() =>
    r'2c463d86e3e7392534f2631f3590c14623bd1e7d';

abstract class _$WeeklyTasksStateHandler extends $Notifier<WeeklyLazyMap> {
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
