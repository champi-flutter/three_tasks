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
    LabelsStateHandler, OnetimeLazyViewState<LabelList<VLabel>>> {
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
  Override overrideWithValue(OnetimeLazyViewState<LabelList<VLabel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<OnetimeLazyViewState<LabelList<VLabel>>>(value),
    );
  }
}

String _$labelsStateHandlerHash() =>
    r'e50252fc246834c5aef201d7dd99ef7c52a64ceb';

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。

abstract class _$LabelsStateHandler
    extends $Notifier<OnetimeLazyViewState<LabelList<VLabel>>> {
  OnetimeLazyViewState<LabelList<VLabel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OnetimeLazyViewState<LabelList<VLabel>>,
        OnetimeLazyViewState<LabelList<VLabel>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<OnetimeLazyViewState<LabelList<VLabel>>,
            OnetimeLazyViewState<LabelList<VLabel>>>,
        OnetimeLazyViewState<LabelList<VLabel>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
