// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_title_editing_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// タスク入力欄の編集状態を管理するクラス

@ProviderFor(TaskTitleEditingController)
const taskTitleEditingControllerProvider = TaskTitleEditingControllerFamily._();

/// タスク入力欄の編集状態を管理するクラス
final class TaskTitleEditingControllerProvider extends $NotifierProvider<
    TaskTitleEditingController, TaskTitleControllerList> {
  /// タスク入力欄の編集状態を管理するクラス
  const TaskTitleEditingControllerProvider._(
      {required TaskTitleEditingControllerFamily super.from,
      required ({
        String title1,
        String title2,
        String title3,
      })
          super.argument})
      : super(
          retry: null,
          name: r'taskTitleEditingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$taskTitleEditingControllerHash();

  @override
  String toString() {
    return r'taskTitleEditingControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TaskTitleEditingController create() => TaskTitleEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TaskTitleControllerList value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TaskTitleControllerList>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TaskTitleEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taskTitleEditingControllerHash() =>
    r'ef09b5ef8beac6d99d3a3535274650a027489976';

/// タスク入力欄の編集状態を管理するクラス

final class TaskTitleEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            TaskTitleEditingController,
            TaskTitleControllerList,
            TaskTitleControllerList,
            TaskTitleControllerList,
            ({
              String title1,
              String title2,
              String title3,
            })> {
  const TaskTitleEditingControllerFamily._()
      : super(
          retry: null,
          name: r'taskTitleEditingControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// タスク入力欄の編集状態を管理するクラス

  TaskTitleEditingControllerProvider call({
    required String title1,
    required String title2,
    required String title3,
  }) =>
      TaskTitleEditingControllerProvider._(argument: (
        title1: title1,
        title2: title2,
        title3: title3,
      ), from: this);

  @override
  String toString() => r'taskTitleEditingControllerProvider';
}

/// タスク入力欄の編集状態を管理するクラス

abstract class _$TaskTitleEditingController
    extends $Notifier<TaskTitleControllerList> {
  late final _$args = ref.$arg as ({
    String title1,
    String title2,
    String title3,
  });
  String get title1 => _$args.title1;
  String get title2 => _$args.title2;
  String get title3 => _$args.title3;

  TaskTitleControllerList build({
    required String title1,
    required String title2,
    required String title3,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      title1: _$args.title1,
      title2: _$args.title2,
      title3: _$args.title3,
    );
    final ref =
        this.ref as $Ref<TaskTitleControllerList, TaskTitleControllerList>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TaskTitleControllerList, TaskTitleControllerList>,
        TaskTitleControllerList,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Task1TitleEditingController)
const task1TitleEditingControllerProvider =
    Task1TitleEditingControllerFamily._();

final class Task1TitleEditingControllerProvider extends $NotifierProvider<
    Task1TitleEditingController, TextEditingController> {
  const Task1TitleEditingControllerProvider._(
      {required Task1TitleEditingControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'task1TitleEditingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$task1TitleEditingControllerHash();

  @override
  String toString() {
    return r'task1TitleEditingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Task1TitleEditingController create() => Task1TitleEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Task1TitleEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$task1TitleEditingControllerHash() =>
    r'7fbe2344d93a551092c4eb7ee3de080660344739';

final class Task1TitleEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<Task1TitleEditingController, TextEditingController,
            TextEditingController, TextEditingController, String> {
  const Task1TitleEditingControllerFamily._()
      : super(
          retry: null,
          name: r'task1TitleEditingControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  Task1TitleEditingControllerProvider call(
    String title,
  ) =>
      Task1TitleEditingControllerProvider._(argument: title, from: this);

  @override
  String toString() => r'task1TitleEditingControllerProvider';
}

abstract class _$Task1TitleEditingController
    extends $Notifier<TextEditingController> {
  late final _$args = ref.$arg as String;
  String get title => _$args;

  TextEditingController build(
    String title,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
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

@ProviderFor(Task2TitleEditingController)
const task2TitleEditingControllerProvider =
    Task2TitleEditingControllerFamily._();

final class Task2TitleEditingControllerProvider extends $NotifierProvider<
    Task2TitleEditingController, TextEditingController> {
  const Task2TitleEditingControllerProvider._(
      {required Task2TitleEditingControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'task2TitleEditingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$task2TitleEditingControllerHash();

  @override
  String toString() {
    return r'task2TitleEditingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Task2TitleEditingController create() => Task2TitleEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Task2TitleEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$task2TitleEditingControllerHash() =>
    r'ae023d2456a8f12f08047bb449e27e2b24d4b42d';

final class Task2TitleEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<Task2TitleEditingController, TextEditingController,
            TextEditingController, TextEditingController, String> {
  const Task2TitleEditingControllerFamily._()
      : super(
          retry: null,
          name: r'task2TitleEditingControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  Task2TitleEditingControllerProvider call(
    String title,
  ) =>
      Task2TitleEditingControllerProvider._(argument: title, from: this);

  @override
  String toString() => r'task2TitleEditingControllerProvider';
}

abstract class _$Task2TitleEditingController
    extends $Notifier<TextEditingController> {
  late final _$args = ref.$arg as String;
  String get title => _$args;

  TextEditingController build(
    String title,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
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

@ProviderFor(Task3TitleEditingController)
const task3TitleEditingControllerProvider =
    Task3TitleEditingControllerFamily._();

final class Task3TitleEditingControllerProvider extends $NotifierProvider<
    Task3TitleEditingController, TextEditingController> {
  const Task3TitleEditingControllerProvider._(
      {required Task3TitleEditingControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'task3TitleEditingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$task3TitleEditingControllerHash();

  @override
  String toString() {
    return r'task3TitleEditingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Task3TitleEditingController create() => Task3TitleEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Task3TitleEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$task3TitleEditingControllerHash() =>
    r'4d141f39cdcddcef0833fef2646e52d42cd00fc2';

final class Task3TitleEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<Task3TitleEditingController, TextEditingController,
            TextEditingController, TextEditingController, String> {
  const Task3TitleEditingControllerFamily._()
      : super(
          retry: null,
          name: r'task3TitleEditingControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  Task3TitleEditingControllerProvider call(
    String title,
  ) =>
      Task3TitleEditingControllerProvider._(argument: title, from: this);

  @override
  String toString() => r'task3TitleEditingControllerProvider';
}

abstract class _$Task3TitleEditingController
    extends $Notifier<TextEditingController> {
  late final _$args = ref.$arg as String;
  String get title => _$args;

  TextEditingController build(
    String title,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
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
