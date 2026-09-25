// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ラベルフェッチフロー

@ProviderFor(fetchLabelUseCase)
const fetchLabelUseCaseProvider = FetchLabelUseCaseFamily._();

/// ラベルフェッチフロー

final class FetchLabelUseCaseProvider extends $FunctionalProvider<
    FetchLabelUseCase,
    FetchLabelUseCase,
    FetchLabelUseCase> with $Provider<FetchLabelUseCase> {
  /// ラベルフェッチフロー
  const FetchLabelUseCaseProvider._(
      {required FetchLabelUseCaseFamily super.from,
      required Token super.argument})
      : super(
          retry: null,
          name: r'fetchLabelUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchLabelUseCaseHash();

  @override
  String toString() {
    return r'fetchLabelUseCaseProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<FetchLabelUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchLabelUseCase create(Ref ref) {
    final argument = this.argument as Token;
    return fetchLabelUseCase(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchLabelUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchLabelUseCase>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchLabelUseCaseProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchLabelUseCaseHash() => r'8229091f88029fdcd1c3ba08c9c2105d2c333a7c';

/// ラベルフェッチフロー

final class FetchLabelUseCaseFamily extends $Family
    with $FunctionalFamilyOverride<FetchLabelUseCase, Token> {
  const FetchLabelUseCaseFamily._()
      : super(
          retry: null,
          name: r'fetchLabelUseCaseProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// ラベルフェッチフロー

  FetchLabelUseCaseProvider call(
    Token token,
  ) =>
      FetchLabelUseCaseProvider._(argument: token, from: this);

  @override
  String toString() => r'fetchLabelUseCaseProvider';
}
