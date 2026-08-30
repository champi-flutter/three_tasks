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

String _$dataRepositoryHash() => r'049b5bf1b53f4b36d0c46c8646ca42dbd3c63f71';

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

/// タスク書き換え処理フロー

@ProviderFor(saveTaskChangesUseCase)
const saveTaskChangesUseCaseProvider = SaveTaskChangesUseCaseProvider._();

/// タスク書き換え処理フロー

final class SaveTaskChangesUseCaseProvider extends $FunctionalProvider<
    SaveTaskChangesUseCase,
    SaveTaskChangesUseCase,
    SaveTaskChangesUseCase> with $Provider<SaveTaskChangesUseCase> {
  /// タスク書き換え処理フロー
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
    r'19ae1328266d8a12465f94fcf0ba0386a548b70b';

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
    r'49e92339d0e71249ccb3fb6fc5284e5d4a659221';

/// 日単位タスク監視反映ポート

@ProviderFor(dailyTasksPresenter)
const dailyTasksPresenterProvider = DailyTasksPresenterProvider._();

/// 日単位タスク監視反映ポート

final class DailyTasksPresenterProvider extends $FunctionalProvider<
    DailyTasksPresenter,
    DailyTasksPresenter,
    DailyTasksPresenter> with $Provider<DailyTasksPresenter> {
  /// 日単位タスク監視反映ポート
  const DailyTasksPresenterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dailyTasksPresenterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyTasksPresenterHash();

  @$internal
  @override
  $ProviderElement<DailyTasksPresenter> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DailyTasksPresenter create(Ref ref) {
    return dailyTasksPresenter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailyTasksPresenter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailyTasksPresenter>(value),
    );
  }
}

String _$dailyTasksPresenterHash() =>
    r'974fea457a223b42a968a9bf9df0f6640876b052';

/// 週単位タスク操作クラス

@ProviderFor(weeklyTasksController)
const weeklyTasksControllerProvider = WeeklyTasksControllerProvider._();

/// 週単位タスク操作クラス

final class WeeklyTasksControllerProvider extends $FunctionalProvider<
    WeeklyTasksController,
    WeeklyTasksController,
    WeeklyTasksController> with $Provider<WeeklyTasksController> {
  /// 週単位タスク操作クラス
  const WeeklyTasksControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'weeklyTasksControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weeklyTasksControllerHash();

  @$internal
  @override
  $ProviderElement<WeeklyTasksController> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WeeklyTasksController create(Ref ref) {
    return weeklyTasksController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeeklyTasksController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeeklyTasksController>(value),
    );
  }
}

String _$weeklyTasksControllerHash() =>
    r'23e62cdfeaa6045d7f0a4b1a0ee8311f2605acee';

/// 日単位タスクのキャッシュストリームハンドラ

@ProviderFor(dailyTasksCacheHandler)
const dailyTasksCacheHandlerProvider = DailyTasksCacheHandlerProvider._();

/// 日単位タスクのキャッシュストリームハンドラ

final class DailyTasksCacheHandlerProvider extends $FunctionalProvider<
    DailyTasksCacheHandler,
    DailyTasksCacheHandler,
    DailyTasksCacheHandler> with $Provider<DailyTasksCacheHandler> {
  /// 日単位タスクのキャッシュストリームハンドラ
  const DailyTasksCacheHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dailyTasksCacheHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyTasksCacheHandlerHash();

  @$internal
  @override
  $ProviderElement<DailyTasksCacheHandler> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DailyTasksCacheHandler create(Ref ref) {
    return dailyTasksCacheHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailyTasksCacheHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailyTasksCacheHandler>(value),
    );
  }
}

String _$dailyTasksCacheHandlerHash() =>
    r'6d62c86048cfbdf3e742e30f7d40cae4bf1312eb';

/// 日単位タスクのキャッシュストリームハンドラ

@ProviderFor(dailyTasksStreamHandler)
const dailyTasksStreamHandlerProvider = DailyTasksStreamHandlerProvider._();

/// 日単位タスクのキャッシュストリームハンドラ

final class DailyTasksStreamHandlerProvider extends $FunctionalProvider<
    DailyTasksStreamHandler,
    DailyTasksStreamHandler,
    DailyTasksStreamHandler> with $Provider<DailyTasksStreamHandler> {
  /// 日単位タスクのキャッシュストリームハンドラ
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
    r'c197a9d92bdcb8dce45ec3a7a6a3f64ffbef15e8';
