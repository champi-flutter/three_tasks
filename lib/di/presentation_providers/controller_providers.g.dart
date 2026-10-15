// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ラベルのコントローラ
///
/// 第2引数の [token] は、 [EditController] の Token 。

@ProviderFor(labelsController)
const labelsControllerProvider = LabelsControllerFamily._();

/// ラベルのコントローラ
///
/// 第2引数の [token] は、 [EditController] の Token 。

final class LabelsControllerProvider extends $FunctionalProvider<
    LabelsController,
    LabelsController,
    LabelsController> with $Provider<LabelsController> {
  /// ラベルのコントローラ
  ///
  /// 第2引数の [token] は、 [EditController] の Token 。
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

String _$labelsControllerHash() => r'dd253c84a0bd564aa26d3874fb56ca925d909b1f';

/// ラベルのコントローラ
///
/// 第2引数の [token] は、 [EditController] の Token 。

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
  ///
  /// 第2引数の [token] は、 [EditController] の Token 。

  LabelsControllerProvider call(
    Token token,
  ) =>
      LabelsControllerProvider._(argument: token, from: this);

  @override
  String toString() => r'labelsControllerProvider';
}

@ProviderFor(settingsController)
const settingsControllerProvider = SettingsControllerProvider._();

final class SettingsControllerProvider extends $FunctionalProvider<
    SettingsController,
    SettingsController,
    SettingsController> with $Provider<SettingsController> {
  const SettingsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'settingsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$settingsControllerHash();

  @$internal
  @override
  $ProviderElement<SettingsController> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsController create(Ref ref) {
    return settingsController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsController>(value),
    );
  }
}

String _$settingsControllerHash() =>
    r'445cec6e71defc5f41ea048a933232212a6dfcc8';

@ProviderFor(labelsDraftHandler)
const labelsDraftHandlerProvider = LabelsDraftHandlerProvider._();

final class LabelsDraftHandlerProvider extends $FunctionalProvider<
    LabelsDraftHandler,
    LabelsDraftHandler,
    LabelsDraftHandler> with $Provider<LabelsDraftHandler> {
  const LabelsDraftHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labelsDraftHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsDraftHandlerHash();

  @$internal
  @override
  $ProviderElement<LabelsDraftHandler> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabelsDraftHandler create(Ref ref) {
    return labelsDraftHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabelsDraftHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabelsDraftHandler>(value),
    );
  }
}

String _$labelsDraftHandlerHash() =>
    r'8439f6aa543663a2004a55ce3b30120a8b8e293f';
