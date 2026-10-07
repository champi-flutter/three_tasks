// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ラベルのコントローラ

@ProviderFor(labelsController)
const labelsControllerProvider = LabelsControllerFamily._();

/// ラベルのコントローラ

final class LabelsControllerProvider extends $FunctionalProvider<
    LabelsController,
    LabelsController,
    LabelsController> with $Provider<LabelsController> {
  /// ラベルのコントローラ
  const LabelsControllerProvider._(
      {required LabelsControllerFamily super.from,
      required Token super.argument})
      : super(
          retry: null,
          name: r'labelsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsControllerHash();

  @override
  String toString() {
    return r'labelsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LabelsController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabelsController create(Ref ref) {
    final argument = this.argument as Token;
    return labelsController(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabelsController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabelsController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LabelsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$labelsControllerHash() => r'5aa74ed52bd4b7a9dd51314c5671970b6ee3a74b';

/// ラベルのコントローラ

final class LabelsControllerFamily extends $Family
    with $FunctionalFamilyOverride<LabelsController, Token> {
  const LabelsControllerFamily._()
      : super(
          retry: null,
          name: r'labelsControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// ラベルのコントローラ

  LabelsControllerProvider call(
    Token token,
  ) =>
      LabelsControllerProvider._(argument: token, from: this);

  @override
  String toString() => r'labelsControllerProvider';
}
