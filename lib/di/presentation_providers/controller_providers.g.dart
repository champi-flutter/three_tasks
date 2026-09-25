// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(labelsController)
const labelsControllerProvider = LabelsControllerProvider._();

final class LabelsControllerProvider extends $FunctionalProvider<
    LabelsController,
    LabelsController,
    LabelsController> with $Provider<LabelsController> {
  const LabelsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labelsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsControllerHash();

  @$internal
  @override
  $ProviderElement<LabelsController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabelsController create(Ref ref) {
    return labelsController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabelsController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabelsController>(value),
    );
  }
}

String _$labelsControllerHash() => r'106ac648cc4630b54003c345b6851c7329988c9a';
