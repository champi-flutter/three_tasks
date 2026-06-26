// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tomorrows_editing_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 翌日のタスクの編集状態を管理するクラス

@ProviderFor(TomorrowsEditingController)
const tomorrowsEditingControllerProvider = TomorrowsEditingControllerFamily._();

/// 翌日のタスクの編集状態を管理するクラス
final class TomorrowsEditingControllerProvider extends $NotifierProvider<
    TomorrowsEditingController, TextEditingController> {
  /// 翌日のタスクの編集状態を管理するクラス
  const TomorrowsEditingControllerProvider._(
      {required TomorrowsEditingControllerFamily super.from,
      required String? super.argument})
      : super(
          retry: null,
          name: r'tomorrowsEditingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tomorrowsEditingControllerHash();

  @override
  String toString() {
    return r'tomorrowsEditingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TomorrowsEditingController create() => TomorrowsEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TomorrowsEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tomorrowsEditingControllerHash() =>
    r'cfc02da11696b9186bda113e473ad594115ea2de';

/// 翌日のタスクの編集状態を管理するクラス

final class TomorrowsEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<TomorrowsEditingController, TextEditingController,
            TextEditingController, TextEditingController, String?> {
  const TomorrowsEditingControllerFamily._()
      : super(
          retry: null,
          name: r'tomorrowsEditingControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 翌日のタスクの編集状態を管理するクラス

  TomorrowsEditingControllerProvider call({
    String? text,
  }) =>
      TomorrowsEditingControllerProvider._(argument: text, from: this);

  @override
  String toString() => r'tomorrowsEditingControllerProvider';
}

/// 翌日のタスクの編集状態を管理するクラス

abstract class _$TomorrowsEditingController
    extends $Notifier<TextEditingController> {
  late final _$args = ref.$arg as String?;
  String? get text => _$args;

  TextEditingController build({
    String? text,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      text: _$args,
    );
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TextEditingController, TextEditingController>,
        TextEditingController,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
