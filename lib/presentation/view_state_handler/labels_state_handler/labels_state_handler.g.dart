// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels_state_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。

@ProviderFor(LabelsStateHandler)
const labelsStateHandlerProvider = LabelsStateHandlerProvider._();

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。
final class LabelsStateHandlerProvider extends $NotifierProvider<
    LabelsStateHandler, LazyViewState<LabelList<VLabel>>> {
  /// 「ラベル化したタスク」の表示を管理するクラス
  ///
  /// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
  /// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
  ///
  /// Fetch が完了するまで、[VLabel.placeholder] が返される。
  const LabelsStateHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labelsStateHandlerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsStateHandlerHash();

  @$internal
  @override
  LabelsStateHandler create() => LabelsStateHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LazyViewState<LabelList<VLabel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<LazyViewState<LabelList<VLabel>>>(value),
    );
  }
}

String _$labelsStateHandlerHash() =>
    r'eed14f14361cad991d499f4b06d2af53551fb330';

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。

abstract class _$LabelsStateHandler
    extends $Notifier<LazyViewState<LabelList<VLabel>>> {
  LazyViewState<LabelList<VLabel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LazyViewState<LabelList<VLabel>>,
        LazyViewState<LabelList<VLabel>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LazyViewState<LabelList<VLabel>>,
            LazyViewState<LabelList<VLabel>>>,
        LazyViewState<LabelList<VLabel>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
