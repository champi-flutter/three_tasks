// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchLabelUseCase)
const fetchLabelUseCaseProvider = FetchLabelUseCaseFamily._();

final class FetchLabelUseCaseProvider extends $FunctionalProvider<
    FetchLabelUseCase,
    FetchLabelUseCase,
    FetchLabelUseCase> with $Provider<FetchLabelUseCase> {
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

  FetchLabelUseCaseProvider call(
    Token token,
  ) =>
      FetchLabelUseCaseProvider._(argument: token, from: this);

  @override
  String toString() => r'fetchLabelUseCaseProvider';
}

@ProviderFor(saveLabelChangesUseCase)
const saveLabelChangesUseCaseProvider = SaveLabelChangesUseCaseProvider._();

final class SaveLabelChangesUseCaseProvider extends $FunctionalProvider<
    SaveLabelChangesUseCase,
    SaveLabelChangesUseCase,
    SaveLabelChangesUseCase> with $Provider<SaveLabelChangesUseCase> {
  const SaveLabelChangesUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'saveLabelChangesUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveLabelChangesUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveLabelChangesUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveLabelChangesUseCase create(Ref ref) {
    return saveLabelChangesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveLabelChangesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveLabelChangesUseCase>(value),
    );
  }
}

String _$saveLabelChangesUseCaseHash() =>
    r'cbd3e1448d1c0a681ca972354b060bc20a7343aa';

@ProviderFor(draftLabelChangesUseCase)
const draftLabelChangesUseCaseProvider = DraftLabelChangesUseCaseProvider._();

final class DraftLabelChangesUseCaseProvider extends $FunctionalProvider<
    DraftLabelChangesUseCase,
    DraftLabelChangesUseCase,
    DraftLabelChangesUseCase> with $Provider<DraftLabelChangesUseCase> {
  const DraftLabelChangesUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'draftLabelChangesUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$draftLabelChangesUseCaseHash();

  @$internal
  @override
  $ProviderElement<DraftLabelChangesUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DraftLabelChangesUseCase create(Ref ref) {
    return draftLabelChangesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DraftLabelChangesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DraftLabelChangesUseCase>(value),
    );
  }
}

String _$draftLabelChangesUseCaseHash() =>
    r'7cecead01391eb8c5098b48ee06ea0372c8a7f82';

@ProviderFor(draftTaskChangesUseCase)
const draftTaskChangesUseCaseProvider = DraftTaskChangesUseCaseProvider._();

final class DraftTaskChangesUseCaseProvider extends $FunctionalProvider<
    DraftTaskChangesUseCase,
    DraftTaskChangesUseCase,
    DraftTaskChangesUseCase> with $Provider<DraftTaskChangesUseCase> {
  const DraftTaskChangesUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'draftTaskChangesUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$draftTaskChangesUseCaseHash();

  @$internal
  @override
  $ProviderElement<DraftTaskChangesUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DraftTaskChangesUseCase create(Ref ref) {
    return draftTaskChangesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DraftTaskChangesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DraftTaskChangesUseCase>(value),
    );
  }
}

String _$draftTaskChangesUseCaseHash() =>
    r'a233166ad24349d01b19f8ff30b1c55c062da1ed';
