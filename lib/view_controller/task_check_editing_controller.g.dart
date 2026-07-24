// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_check_editing_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// タスクのチェックボックスの値を管理するクラス

@ProviderFor(TaskCheckEditingController)
const taskCheckEditingControllerProvider = TaskCheckEditingControllerFamily._();

/// タスクのチェックボックスの値を管理するクラス
final class TaskCheckEditingControllerProvider
    extends $NotifierProvider<TaskCheckEditingController, TaskCheckList> {
  /// タスクのチェックボックスの値を管理するクラス
  const TaskCheckEditingControllerProvider._(
      {required TaskCheckEditingControllerFamily super.from,
      required (
        bool,
        bool,
        bool,
      )
          super.argument})
      : super(
          retry: null,
          name: r'taskCheckEditingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$taskCheckEditingControllerHash();

  @override
  String toString() {
    return r'taskCheckEditingControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TaskCheckEditingController create() => TaskCheckEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TaskCheckList value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TaskCheckList>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TaskCheckEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taskCheckEditingControllerHash() =>
    r'f2bfb34e82036ba3c177fe2b6461bcd896cea07c';

/// タスクのチェックボックスの値を管理するクラス

final class TaskCheckEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            TaskCheckEditingController,
            TaskCheckList,
            TaskCheckList,
            TaskCheckList,
            (
              bool,
              bool,
              bool,
            )> {
  const TaskCheckEditingControllerFamily._()
      : super(
          retry: null,
          name: r'taskCheckEditingControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// タスクのチェックボックスの値を管理するクラス

  TaskCheckEditingControllerProvider call(
    bool initialValue1,
    bool initialValue2,
    bool initialValue3,
  ) =>
      TaskCheckEditingControllerProvider._(argument: (
        initialValue1,
        initialValue2,
        initialValue3,
      ), from: this);

  @override
  String toString() => r'taskCheckEditingControllerProvider';
}

/// タスクのチェックボックスの値を管理するクラス

abstract class _$TaskCheckEditingController extends $Notifier<TaskCheckList> {
  late final _$args = ref.$arg as (
    bool,
    bool,
    bool,
  );
  bool get initialValue1 => _$args.$1;
  bool get initialValue2 => _$args.$2;
  bool get initialValue3 => _$args.$3;

  TaskCheckList build(
    bool initialValue1,
    bool initialValue2,
    bool initialValue3,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
      _$args.$3,
    );
    final ref = this.ref as $Ref<TaskCheckList, TaskCheckList>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TaskCheckList, TaskCheckList>,
        TaskCheckList,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
