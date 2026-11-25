// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(labelsStateNotifier)
const labelsStateProvider = LabelsStateNotifierProvider._();

final class LabelsStateNotifierProvider extends $FunctionalProvider<
    LabelsStateNotifier,
    LabelsStateNotifier,
    LabelsStateNotifier> with $Provider<LabelsStateNotifier> {
  const LabelsStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labelsStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsStateNotifierHash();

  @$internal
  @override
  $ProviderElement<LabelsStateNotifier> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabelsStateNotifier create(Ref ref) {
    return labelsStateNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabelsStateNotifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabelsStateNotifier>(value),
    );
  }
}

String _$labelsStateNotifierHash() =>
    r'1c677504369fac7375a1fcb1e424f9a352ad6ddd';

@ProviderFor(pageSettingsStateNotifier)
const pageSettingsStateProvider = PageSettingsStateNotifierProvider._();

final class PageSettingsStateNotifierProvider extends $FunctionalProvider<
    PageSettingsStateNotifier,
    PageSettingsStateNotifier,
    PageSettingsStateNotifier> with $Provider<PageSettingsStateNotifier> {
  const PageSettingsStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pageSettingsStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pageSettingsStateNotifierHash();

  @$internal
  @override
  $ProviderElement<PageSettingsStateNotifier> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PageSettingsStateNotifier create(Ref ref) {
    return pageSettingsStateNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PageSettingsStateNotifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PageSettingsStateNotifier>(value),
    );
  }
}

String _$pageSettingsStateNotifierHash() =>
    r'b461607baaa39e8727478cb1b5fe0d076cdf76ea';
