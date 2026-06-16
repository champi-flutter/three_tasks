// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labeled_tasks_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 「ラベル化したタスク」の表示を管理するクラス

@ProviderFor(LabeledTasksViewModel)
const labeledTasksViewModelProvider = LabeledTasksViewModelProvider._();

/// 「ラベル化したタスク」の表示を管理するクラス
final class LabeledTasksViewModelProvider
    extends $NotifierProvider<LabeledTasksViewModel, List<VLabeledTask>> {
  /// 「ラベル化したタスク」の表示を管理するクラス
  const LabeledTasksViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'labeledTasksViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$labeledTasksViewModelHash();

  @$internal
  @override
  LabeledTasksViewModel create() => LabeledTasksViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VLabeledTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VLabeledTask>>(value),
    );
  }
}

String _$labeledTasksViewModelHash() =>
    r'c29c45ff9ace3291e2e26f258a3606f0acdd6d46';

/// 「ラベル化したタスク」の表示を管理するクラス

abstract class _$LabeledTasksViewModel extends $Notifier<List<VLabeledTask>> {
  List<VLabeledTask> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<VLabeledTask>, List<VLabeledTask>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<VLabeledTask>, List<VLabeledTask>>,
        List<VLabeledTask>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
