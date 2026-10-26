// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

/// 日単位タスクのアクセス通知フロー

@ProviderFor(notifyDailyTasksAccessUseCase)
const notifyDailyTasksAccessUseCaseProvider =
    NotifyDailyTasksAccessUseCaseProvider._();

/// 日単位タスクのアクセス通知フロー

final class NotifyDailyTasksAccessUseCaseProvider extends $FunctionalProvider<
        NotifyDailyTasksAccessUseCase,
        NotifyDailyTasksAccessUseCase,
        NotifyDailyTasksAccessUseCase>
    with $Provider<NotifyDailyTasksAccessUseCase> {
  /// 日単位タスクのアクセス通知フロー
  const NotifyDailyTasksAccessUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notifyDailyTasksAccessUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notifyDailyTasksAccessUseCaseHash();

  @$internal
  @override
  $ProviderElement<NotifyDailyTasksAccessUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NotifyDailyTasksAccessUseCase create(Ref ref) {
    return notifyDailyTasksAccessUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotifyDailyTasksAccessUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<NotifyDailyTasksAccessUseCase>(value),
    );
  }
}

String _$notifyDailyTasksAccessUseCaseHash() =>
    r'b72db71785fb72bd708343ed5910ebd1c8be4da7';
