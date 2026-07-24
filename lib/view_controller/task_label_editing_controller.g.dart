// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_label_editing_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// タスクのチェックボックスの値を管理するクラス

@ProviderFor(TaskLabelEditingController)
const taskLabelEditingControllerProvider = TaskLabelEditingControllerFamily._();

/// タスクのチェックボックスの値を管理するクラス
final class TaskLabelEditingControllerProvider
    extends $NotifierProvider<TaskLabelEditingController, TaskLabelList> {
  /// タスクのチェックボックスの値を管理するクラス
  const TaskLabelEditingControllerProvider._(
      {required TaskLabelEditingControllerFamily super.from,
      required (
        int?,
        int?,
        int?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'taskLabelEditingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$taskLabelEditingControllerHash();

  @override
  String toString() {
    return r'taskLabelEditingControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TaskLabelEditingController create() => TaskLabelEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TaskLabelList value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TaskLabelList>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TaskLabelEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taskLabelEditingControllerHash() =>
    r'903f02c0258480d52b836aa891f50a850919e5aa';

/// タスクのチェックボックスの値を管理するクラス

final class TaskLabelEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            TaskLabelEditingController,
            TaskLabelList,
            TaskLabelList,
            TaskLabelList,
            (
              int?,
              int?,
              int?,
            )> {
  const TaskLabelEditingControllerFamily._()
      : super(
          retry: null,
          name: r'taskLabelEditingControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// タスクのチェックボックスの値を管理するクラス

  TaskLabelEditingControllerProvider call(
    int? initialValue1,
    int? initialValue2,
    int? initialValue3,
  ) =>
      TaskLabelEditingControllerProvider._(argument: (
        initialValue1,
        initialValue2,
        initialValue3,
      ), from: this);

  @override
  String toString() => r'taskLabelEditingControllerProvider';
}

/// タスクのチェックボックスの値を管理するクラス

abstract class _$TaskLabelEditingController extends $Notifier<TaskLabelList> {
  late final _$args = ref.$arg as (
    int?,
    int?,
    int?,
  );
  int? get initialValue1 => _$args.$1;
  int? get initialValue2 => _$args.$2;
  int? get initialValue3 => _$args.$3;

  TaskLabelList build(
    int? initialValue1,
    int? initialValue2,
    int? initialValue3,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
      _$args.$3,
    );
    final ref = this.ref as $Ref<TaskLabelList, TaskLabelList>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TaskLabelList, TaskLabelList>,
        TaskLabelList,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
