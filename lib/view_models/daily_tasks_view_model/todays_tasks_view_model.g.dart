// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_tasks_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodaysTasksViewModel)
const todaysTasksViewModelProvider = TodaysTasksViewModelProvider._();

final class TodaysTasksViewModelProvider
    extends $NotifierProvider<TodaysTasksViewModel, List<VDailyTask>> {
  const TodaysTasksViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'todaysTasksViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$todaysTasksViewModelHash();

  @$internal
  @override
  TodaysTasksViewModel create() => TodaysTasksViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VDailyTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VDailyTask>>(value),
    );
  }
}

String _$todaysTasksViewModelHash() =>
    r'2c61b890f0aace62cdcd9996ea86ce8d6c336df9';

abstract class _$TodaysTasksViewModel extends $Notifier<List<VDailyTask>> {
  List<VDailyTask> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<VDailyTask>, List<VDailyTask>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<VDailyTask>, List<VDailyTask>>,
        List<VDailyTask>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
