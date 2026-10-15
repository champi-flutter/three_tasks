// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_handler_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(monthlyTasksStreamHandler)
const monthlyTasksStreamHandlerProvider = MonthlyTasksStreamHandlerProvider._();

final class MonthlyTasksStreamHandlerProvider extends $FunctionalProvider<
    MonthlyTasksStreamHandler,
    MonthlyTasksStreamHandler,
    MonthlyTasksStreamHandler> with $Provider<MonthlyTasksStreamHandler> {
  const MonthlyTasksStreamHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'monthlyTasksStreamHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$monthlyTasksStreamHandlerHash();

  @$internal
  @override
  $ProviderElement<MonthlyTasksStreamHandler> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MonthlyTasksStreamHandler create(Ref ref) {
    return monthlyTasksStreamHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MonthlyTasksStreamHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MonthlyTasksStreamHandler>(value),
    );
  }
}

String _$monthlyTasksStreamHandlerHash() =>
    r'449885c78336108d613ee5194b32a02f4f9a8aad';
