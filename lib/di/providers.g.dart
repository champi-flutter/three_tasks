// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dataSource)
const dataSourceProvider = DataSourceProvider._();

final class DataSourceProvider
    extends $FunctionalProvider<DataSource, DataSource, DataSource>
    with $Provider<DataSource> {
  const DataSourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dataSourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dataSourceHash();

  @$internal
  @override
  $ProviderElement<DataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DataSource create(Ref ref) {
    return dataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataSource>(value),
    );
  }
}

String _$dataSourceHash() => r'f06a2489d3facb1f1e036134673cc5a0604f1997';

@ProviderFor(dataRepository)
const dataRepositoryProvider = DataRepositoryProvider._();

final class DataRepositoryProvider
    extends $FunctionalProvider<DataRepository, DataRepository, DataRepository>
    with $Provider<DataRepository> {
  const DataRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dataRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dataRepositoryHash();

  @$internal
  @override
  $ProviderElement<DataRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DataRepository create(Ref ref) {
    return dataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataRepository>(value),
    );
  }
}

String _$dataRepositoryHash() => r'03fdb1eae8ce20a08b1e58b15cc2e4ff9b94df66';

@ProviderFor(toastCount)
const toastCountProvider = ToastCountProvider._();

final class ToastCountProvider
    extends $FunctionalProvider<ToastCount, ToastCount, ToastCount>
    with $Provider<ToastCount> {
  const ToastCountProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'toastCountProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$toastCountHash();

  @$internal
  @override
  $ProviderElement<ToastCount> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ToastCount create(Ref ref) {
    return toastCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToastCount value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToastCount>(value),
    );
  }
}

String _$toastCountHash() => r'3ea4afc2286f5dabb00d546c4a49b11c3ff41176';

/// 日別タスクサービスクラス

@ProviderFor(dayTasksService)
const dayTasksServiceProvider = DayTasksServiceProvider._();

/// 日別タスクサービスクラス

final class DayTasksServiceProvider extends $FunctionalProvider<DayTasksService,
    DayTasksService, DayTasksService> with $Provider<DayTasksService> {
  /// 日別タスクサービスクラス
  const DayTasksServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dayTasksServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dayTasksServiceHash();

  @$internal
  @override
  $ProviderElement<DayTasksService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DayTasksService create(Ref ref) {
    return dayTasksService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DayTasksService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DayTasksService>(value),
    );
  }
}

String _$dayTasksServiceHash() => r'b17524bcd1408e582f7be8e0b53758d5628010be';

/// 週タスクサービスクラス

@ProviderFor(weeklyTasksService)
const weeklyTasksServiceProvider = WeeklyTasksServiceProvider._();

/// 週タスクサービスクラス

final class WeeklyTasksServiceProvider extends $FunctionalProvider<
    WeeklyTasksService,
    WeeklyTasksService,
    WeeklyTasksService> with $Provider<WeeklyTasksService> {
  /// 週タスクサービスクラス
  const WeeklyTasksServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'weeklyTasksServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weeklyTasksServiceHash();

  @$internal
  @override
  $ProviderElement<WeeklyTasksService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WeeklyTasksService create(Ref ref) {
    return weeklyTasksService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeeklyTasksService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeeklyTasksService>(value),
    );
  }
}

String _$weeklyTasksServiceHash() =>
    r'37f53a2ede9ab97921df7af22a6aa9be157f8da1';

/// 「ラベル化したタスク」サービスクラス

@ProviderFor(labeledTasksService)
const labeledTasksServiceProvider = LabeledTasksServiceProvider._();

/// 「ラベル化したタスク」サービスクラス

final class LabeledTasksServiceProvider extends $FunctionalProvider<
    LabeledTasksService,
    LabeledTasksService,
    LabeledTasksService> with $Provider<LabeledTasksService> {
  /// 「ラベル化したタスク」サービスクラス
  const LabeledTasksServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labeledTasksServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labeledTasksServiceHash();

  @$internal
  @override
  $ProviderElement<LabeledTasksService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabeledTasksService create(Ref ref) {
    return labeledTasksService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabeledTasksService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabeledTasksService>(value),
    );
  }
}

String _$labeledTasksServiceHash() =>
    r'9e64f658f95bc9c94960866ca54913832d3927cb';
