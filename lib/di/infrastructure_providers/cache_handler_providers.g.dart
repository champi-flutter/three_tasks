// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_handler_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ラベルのキャッシュハンドラ

@ProviderFor(labelsCacheHandler)
const labelsCacheHandlerProvider = LabelsCacheHandlerProvider._();

/// ラベルのキャッシュハンドラ

final class LabelsCacheHandlerProvider extends $FunctionalProvider<
    LabelsCacheHandler,
    LabelsCacheHandler,
    LabelsCacheHandler> with $Provider<LabelsCacheHandler> {
  /// ラベルのキャッシュハンドラ
  const LabelsCacheHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labelsCacheHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsCacheHandlerHash();

  @$internal
  @override
  $ProviderElement<LabelsCacheHandler> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabelsCacheHandler create(Ref ref) {
    return labelsCacheHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabelsCacheHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabelsCacheHandler>(value),
    );
  }
}

String _$labelsCacheHandlerHash() =>
    r'769ebca2deabd243ca8f75a2c37eb106f56c55a0';
