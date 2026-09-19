// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presenter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(labelsPresenter)
const labelsPresenterProvider = LabelsPresenterFamily._();

final class LabelsPresenterProvider extends $FunctionalProvider<LabelsPresenter,
    LabelsPresenter, LabelsPresenter> with $Provider<LabelsPresenter> {
  const LabelsPresenterProvider._(
      {required LabelsPresenterFamily super.from,
      required Token super.argument})
      : super(
          retry: null,
          name: r'labelsPresenterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsPresenterHash();

  @override
  String toString() {
    return r'labelsPresenterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LabelsPresenter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabelsPresenter create(Ref ref) {
    final argument = this.argument as Token;
    return labelsPresenter(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabelsPresenter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabelsPresenter>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LabelsPresenterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$labelsPresenterHash() => r'af925d4ba144970787a45120626178f39c4fd9cb';

final class LabelsPresenterFamily extends $Family
    with $FunctionalFamilyOverride<LabelsPresenter, Token> {
  const LabelsPresenterFamily._()
      : super(
          retry: null,
          name: r'labelsPresenterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LabelsPresenterProvider call(
    Token token,
  ) =>
      LabelsPresenterProvider._(argument: token, from: this);

  @override
  String toString() => r'labelsPresenterProvider';
}
