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
    extends $NotifierProvider<WeeklyTasksViewModel, WeeklyLazyMap> {
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
  Override overrideWithValue(WeeklyLazyMap value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeeklyLazyMap>(value),
    );
  }
}

String _$weeklyTasksViewModelHash() =>
    r'6d80d67379815a9ffef9fb985572583684c3b30a';

abstract class _$WeeklyTasksViewModel extends $Notifier<WeeklyLazyMap> {
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
