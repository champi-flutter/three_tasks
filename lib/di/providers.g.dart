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

@ProviderFor(saveTaskChangesUseCase)
const saveTaskChangesUseCaseProvider = SaveTaskChangesUseCaseProvider._();

final class SaveTaskChangesUseCaseProvider extends $FunctionalProvider<
    SaveTaskChangesUseCase,
    SaveTaskChangesUseCase,
    SaveTaskChangesUseCase> with $Provider<SaveTaskChangesUseCase> {
  const SaveTaskChangesUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'saveTaskChangesUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveTaskChangesUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveTaskChangesUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveTaskChangesUseCase create(Ref ref) {
    return saveTaskChangesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveTaskChangesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveTaskChangesUseCase>(value),
    );
  }
}

String _$saveTaskChangesUseCaseHash() =>
    r'b99740592a88cfa0abf923ebcda9e94baa6da157';

/// 日単位タスクの監視フロー

@ProviderFor(watchDailyTasksUseCase)
const watchDailyTasksUseCaseProvider = WatchDailyTasksUseCaseProvider._();

/// 日単位タスクの監視フロー

final class WatchDailyTasksUseCaseProvider extends $FunctionalProvider<
    WatchDailyTasksUseCase,
    WatchDailyTasksUseCase,
    WatchDailyTasksUseCase> with $Provider<WatchDailyTasksUseCase> {
  /// 日単位タスクの監視フロー
  const WatchDailyTasksUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'watchDailyTasksUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$watchDailyTasksUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchDailyTasksUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WatchDailyTasksUseCase create(Ref ref) {
    return watchDailyTasksUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchDailyTasksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchDailyTasksUseCase>(value),
    );
  }
}

String _$watchDailyTasksUseCaseHash() =>
    r'076dac0252d942d660e9ce2ad9ec2bc68477dfc1';

@ProviderFor(dailyTasksPublisher)
const dailyTasksPublisherProvider = DailyTasksPublisherProvider._();

final class DailyTasksPublisherProvider extends $FunctionalProvider<
    DailyTasksPublisher,
    DailyTasksPublisher,
    DailyTasksPublisher> with $Provider<DailyTasksPublisher> {
  const DailyTasksPublisherProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dailyTasksPublisherProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyTasksPublisherHash();

  @$internal
  @override
  $ProviderElement<DailyTasksPublisher> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DailyTasksPublisher create(Ref ref) {
    return dailyTasksPublisher(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailyTasksPublisher value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailyTasksPublisher>(value),
    );
  }
}

String _$dailyTasksPublisherHash() =>
    r'7146cebf6616ffabfb2320d63622f7983c929c85';

@ProviderFor(dailyTasksStreamHandler)
const dailyTasksStreamHandlerProvider = DailyTasksStreamHandlerProvider._();

final class DailyTasksStreamHandlerProvider extends $FunctionalProvider<
    DailyTasksStreamHandler,
    DailyTasksStreamHandler,
    DailyTasksStreamHandler> with $Provider<DailyTasksStreamHandler> {
  const DailyTasksStreamHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dailyTasksStreamHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyTasksStreamHandlerHash();

  @$internal
  @override
  $ProviderElement<DailyTasksStreamHandler> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DailyTasksStreamHandler create(Ref ref) {
    return dailyTasksStreamHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailyTasksStreamHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailyTasksStreamHandler>(value),
    );
  }
}

String _$dailyTasksStreamHandlerHash() =>
    r'9069f5ff8d96d949d073f2945bebe22456581652';
