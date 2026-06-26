import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/view_controller/task_check_editing_controller.dart';
import 'package:three_tasks/view_controller/task_title_editing_controller.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';

/// [TasksView] の表示形式
///  - [TasksViewStyle.checkbox] : チェックボックス付き
///  - [TasksViewStyle.icon] : チェエクボックスなし（アイコン付き）
enum TasksViewStyle { checkbox, icon }

/// チェックボックス付きタスク入力欄
class TasksView extends ConsumerWidget {
  const TasksView.checkbox({
    required this.taskList,
    required this.onSaveTask,
    required this.saveCheckAuto,
    required this.onLabeled,
  }) : assert(
  saveCheckAuto != null,
  "チェックボックス更新時の処理が設定されていません。",
  ),
        tasksViewStyle = TasksViewStyle.checkbox,
  // assert(
  // onSaveTask != null || onJustEdited != null,
  // "自動保存における編集フラグのコールバックが設定されていません。",
  // ),
        _isAutoSave = onSaveTask != null;

  const TasksView.icon({
    required this.taskList,
    required this.onSaveTask,
    required this.onLabeled,
  }) : tasksViewStyle = TasksViewStyle.icon,
        saveCheckAuto = null,
  // assert(
  // onSaveTask != null || onJustEdited != null,
  // "自動保存における編集フラグのコールバックが設定されていません。",
  // ),
        _isAutoSave = onSaveTask != null;

  final TasksViewStyle tasksViewStyle;

  /// タスクのリスト
  final List<VTask> taskList;

  /// 入力欄に値を入力した状態でフォーカスを外したときの自動保存ロジック
  final Future<void> Function(int position, String value)? onSaveTask;

  // /// 自動保存でない場合に、編集を加えたときの処理
  // final VoidCallback? onJustEdited;

  /// 自動保存かどうか
  final bool _isAutoSave;

  /// ラベル化処理
  final Future<void> Function(int position, bool value) onLabeled;

  /// チェックボックスの値が更新される時の処理
  final Future<void> Function(int position, bool value)? saveCheckAuto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ラベル化タスクのリスト
    final List<VLabeledTask> labeledTaskList =
    ref.watch(labeledTasksViewModelProvider);
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, position) {
        // 各タスクタイトルのコントローラ
        final TextEditingController titleController = ref.watch(
          taskTitleEditingControllerProvider(
            title1: taskList[0].task,
            title2: taskList[1].task,
            title3: taskList[2].task,
          ).select(
                (state) =>
            switch (position) {
              0 => state.titleController1,
              1 => state.titleController2,
              2 => state.titleController3,
            // itemCount の制限上ありえないが、網羅性のため記述
              _ => TextEditingController(),
            },
          ),
        );
        switch (tasksViewStyle) {
          case TasksViewStyle.checkbox:
          // チェックボックスの値をこのスコープで管理
            final isChecked = ref.watch(
              taskCheckEditingControllerProvider(
                taskList[0].isChecked,
                taskList[1].isChecked,
                taskList[2].isChecked,
              ).select((state) =>
              // position に応じて、監視するプロパティを切り替える
              switch (position) {
                0 => state.check1,
                1 => state.check2,
                2 => state.check3,
              // itemCount の制限上ありえないが、網羅性のため記述
                _ => false,
              }),
            );

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              // position ごとの入力欄
              child: _CheckableTaskField(
                position: position,
                taskTitle: taskList[position].task,
                isTaskLabeled: taskList[position].isLabeled(
                  labeledTaskList: labeledTaskList,
                ),
                onSaveTask: _isAutoSave
                    ? (String value) => onSaveTask!(position, value)
                    : null,
                onLabeled: (bool value) => onLabeled(position, value),
                saveCheckAuto: _isAutoSave
                    ? (bool value) => saveCheckAuto!(position, value)
                    : null,
                isChecked: isChecked,
                notifyCheck: (bool value) {
                  ref.read(
                      taskCheckEditingControllerProvider(
                        taskList[0].isChecked,
                        taskList[1].isChecked,
                        taskList[2].isChecked,
                      ).notifier).check(position, value);
                },
                titleController: titleController,
              ),
            );

          case TasksViewStyle.icon:
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, position) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  // position ごとの入力欄
                  child: _IconTaskField(
                    position: position,
                    taskTitle: taskList[position].task,
                    isTaskLabeled: taskList[position].isLabeled(
                      labeledTaskList: labeledTaskList,
                    ),
                    onSaveTask: _isAutoSave
                        ? (String value) => onSaveTask!(position, value)
                        : null,
                    onLabeled: (bool value) => onLabeled(position, value),
                    titleController: titleController,
                  ),
                );
              },
            );
        }
      },
    );

  }
}

/// 各タスク入力欄
class _TaskField extends HookConsumerWidget {
  const _TaskField({
    required this.position,
    required this.taskTitle,
    required this.onSaveTask, required this.titleController,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// タスクを保存する処理
  final Future<void> Function(String)? onSaveTask;

  /// タスク入力値のコントローラ
  final TextEditingController titleController;

  // // フォーカスが外れたことをフラグに、その段階での入力値を保存する処理を起動するハンドラ
  // Future<void> _handleSave(String value) async {
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // この TextField のフォーカス
    final focusNode = useFocusNode();

    // focusNode の状態を監視
    useEffect(() {
      // フォーカスが解除された際に、そのときの入力値を保存
      Future<void> listenUnfocused() async {
        if (!focusNode.hasFocus) {
          _print(
            "フォーカスが解除された際に、そのときの入力値を保存",
            "保存される入力値: ${titleController.text}",
          );
          // 最後に保存した値から変化しているかどうか
          final bool isChanged = titleController.text != taskTitle;
          // 自動保存オンのときの保存処理
          if (isChanged && onSaveTask != null) {
            // 編集未保存フラグをおろす
            ref.read(editSavingControllerProvider.notifier).onSaved();
            // 自動保存
            await onSaveTask!(titleController.text);
          }
        }
      }

      // リスナーを登録
      focusNode.addListener(listenUnfocused);
      // リスナーを破棄（クリーンアップ）
      return () => focusNode.removeListener(listenUnfocused);
    }, [focusNode]);

    // TextField への入力以外で入力欄に入れる値（taskTitle）が変化した場合（遅延初期化、
    // データ元の変更、など）に対応
    useEffect(() {
      if (titleController.text != taskTitle) {
        _print(
            "TextField への入力以外で入力欄に入れる値（taskTitle）が変化した場合");
        // 入力欄の値を更新
        titleController.text = taskTitle;
      }
      return null;
    }, [taskTitle]);

    // 入力欄本体
    return TextFieldTapRegion(
      // この領域の「外」がタップされたらフォーカスを外す
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          labelText: "タスク${position + 1}",
          // contentPadding: EdgeInsets.all(0),
        ),
        controller: titleController,
        style: TextStyle(fontSize: 17.0.sp),
        textInputAction: TextInputAction.done,
        // エンターキー等で、入力完了によってフォーカスが外れるようにする
        onSubmitted: (_) {
          focusNode.unfocus();
        },
        // 入力欄に文字を入力したときに、編集未保存フラグを立てる。
        onChanged: (String value) {
          ref.read(editSavingControllerProvider.notifier).onEdited();
        },
      ),
    );
  }
}

/// チェックボックス付きタスク入力欄
class _CheckableTaskField extends HookConsumerWidget {
  const _CheckableTaskField({
    required this.position,
    required this.taskTitle,
    required this.isTaskLabeled,
    required this.onSaveTask,
    required this.onLabeled,
    required this.saveCheckAuto, required this.isChecked,
    required this.notifyCheck,
    required this.titleController,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// ラベル化されているかどうか
  final bool isTaskLabeled;

  /// タスクを保存する処理
  final Future<void> Function(String)? onSaveTask;

  /// ラベル化処理
  final Future<void> Function(bool value) onLabeled;

  /// チェックボックスの値が更新される時の処理
  final Future<void> Function(bool)? saveCheckAuto;

  /// チェックボックスの値
  final bool isChecked;

  /// チェックボックスの値が変わったときのコントローラの操作
  final void Function(bool) notifyCheck;

  /// タスク入力値のコントローラ
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todo （2026/06/26）＞＞
    // ラベル化されているかどうか
    final isLabeled = useState<bool>(isTaskLabeled);

    return CheckboxListTile(
      title: _TaskField(
        position: position,
        taskTitle: taskTitle,
        onSaveTask: onSaveTask,
        titleController: titleController,
      ),
      value: isChecked,
      // チェックボックスが leading （左）側
      controlAffinity: ListTileControlAffinity.leading,
      // チェックボックス変更時
      onChanged: (bool? value) async {
        if (isChecked != value!) {
          // チェックボックスの値が切り替わったことをコントローラクラスに通知
          notifyCheck(value);

          // 自動保存オンの場合
          if (saveCheckAuto != null) {
            // 自動保存
            await saveCheckAuto!(value);
          }
          // 自動保存オフの場合
          else {
            // 編集未保存フラグを立てる
            ref.read(editSavingControllerProvider.notifier).onEdited();
          }
        }
      },
      // trailing （右）側の Widget
      secondary: IconButton(
        // ラベル化済みなら塗りつぶし
        icon: isLabeled.value
            ? Icon(Icons.bookmark)
            : Icon(
          Icons.bookmark_add_outlined,
        ),
        onPressed: () {
          // todo 確認ダイアログ（2026/06/16）＞＞
          // bool 値を変換
          isLabeled.value = !isLabeled.value;
          // 変換後の bool 値でラベル化処理
          onLabeled(isLabeled.value);
        },
      ),
    );
  }
}

class _IconTaskField extends HookWidget {
  const _IconTaskField({
    required this.position,
    required this.taskTitle,
    required this.isTaskLabeled,
    required this.onSaveTask,
    required this.onLabeled, required this.titleController,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// ラベル化されているかどうか
  final bool isTaskLabeled;

  /// タスクを保存する処理
  final Future<void> Function(String value)? onSaveTask;

  /// ラベル化処理
  final Future<void> Function(bool value) onLabeled;

  /// タスク入力値のコントローラ
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    // ラベル化されているかどうか
    final isLabeled = useState<bool>(isTaskLabeled);

    return ListTile(
      leading: const Icon(Icons.task),
      title: _TaskField(
        position: position,
        taskTitle: taskTitle,
        onSaveTask: onSaveTask, titleController: titleController,
      ),
      trailing: IconButton(
        // ラベル化済みなら塗りつぶし
        icon: isLabeled.value
            ? Icon(Icons.bookmark)
            : Icon(
          Icons.bookmark_add_outlined,
        ),
        onPressed: () {
          // todo 確認ダイアログ（2026/06/16）＞＞
          // bool 値を変換
          isLabeled.value = !isLabeled.value;
          // 変換後の bool 値でラベル化処理
          onLabeled(isLabeled.value);
        },
      ),
    );
  }
}

/// printメソッド [tasks_view.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[tasks_view.dart]　" + s1);
    if (s2 != null) print("[tasks_view.dart]　" + s2);
    if (s3 != null) print("[tasks_view.dart]　" + s3);
    if (s4 != null) print("[tasks_view.dart]　" + s4);
    if (s5 != null) print("[tasks_view.dart]　" + s5);
    print("");
  }
}
