// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels_view_model.dart';

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

@ProviderFor(LabelsViewModel)
const labelsViewModelProvider = LabelsViewModelProvider._();

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。
final class LabelsViewModelProvider extends $NotifierProvider<LabelsViewModel,
    LazyViewState<LabelList<VLabel>>> {
  /// 「ラベル化したタスク」の表示を管理するクラス
  ///
  /// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
  /// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
  ///
  /// Fetch が完了するまで、[VLabel.placeholder] が返される。
  const LabelsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labelsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsViewModelHash();

  @$internal
  @override
  LabelsViewModel create() => LabelsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LazyViewState<LabelList<VLabel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<LazyViewState<LabelList<VLabel>>>(value),
    );
  }
}

String _$labelsViewModelHash() => r'92b71cdb91cd99bff798a15757e0307aa25915cf';

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。

abstract class _$LabelsViewModel
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
