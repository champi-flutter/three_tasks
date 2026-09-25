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
const labelsViewModelProvider = LabelsViewModelFamily._();

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。
final class LabelsViewModelProvider
    extends $NotifierProvider<LabelsViewModel, List<VLabel>> {
  /// 「ラベル化したタスク」の表示を管理するクラス
  ///
  /// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
  /// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
  ///
  /// Fetch が完了するまで、[VLabel.placeholder] が返される。
  const LabelsViewModelProvider._(
      {required LabelsViewModelFamily super.from,
      required Token super.argument})
      : super(
          retry: null,
          name: r'labelsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labelsViewModelHash();

  @override
  String toString() {
    return r'labelsViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LabelsViewModel create() => LabelsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VLabel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VLabel>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LabelsViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$labelsViewModelHash() => r'2aa2df6ddf8d69e7baa75e1ac4c66c8a623534c4';

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。

final class LabelsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<LabelsViewModel, List<VLabel>, List<VLabel>,
            List<VLabel>, Token> {
  const LabelsViewModelFamily._()
      : super(
          retry: null,
          name: r'labelsViewModelProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 「ラベル化したタスク」の表示を管理するクラス
  ///
  /// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
  /// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
  ///
  /// Fetch が完了するまで、[VLabel.placeholder] が返される。

  LabelsViewModelProvider call(
    Token token,
  ) =>
      LabelsViewModelProvider._(argument: token, from: this);

  @override
  String toString() => r'labelsViewModelProvider';
}

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。

abstract class _$LabelsViewModel extends $Notifier<List<VLabel>> {
  late final _$args = ref.$arg as Token;
  Token get token => _$args;

  List<VLabel> build(
    Token token,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<List<VLabel>, List<VLabel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<VLabel>, List<VLabel>>,
        List<VLabel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
