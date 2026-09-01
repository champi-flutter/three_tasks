import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/specific_widgets/overlays/confirming_existing_label_dialog.dart';
import 'package:three_tasks/view/specific_widgets/overlays/labeled_task_list_dialog.dart';
import 'package:three_tasks/view_controller/task_check_editing_controller.dart';
import 'package:three_tasks/view_controller/task_label_editing_controller.dart';
import 'package:three_tasks/view_controller/task_title_editing_controller.dart';
import 'package:three_tasks/view_models/controller/tasks_controller.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';

/// [TasksView] の表示形式
///  - [TasksViewStyle.checkbox] : チェックボックス付き
///  - [TasksViewStyle.icon] : チェエクボックスなし（アイコン付き）
enum TasksViewStyle { checkbox, icon }

/// チェックボックス付きタスク入力欄
class TasksView extends ConsumerWidget {
  const TasksView.checkbox({
    required this.taskList,
    required this.onAutoSave,
    required this.saveNewLabelAuto,
    required this.saveUnlabelAuto,
  })  : assert(
          saveCheckAuto != null,
          "チェックボックス更新時の処理が設定されていません。",
        ),
        tasksViewStyle = TasksViewStyle.checkbox,
        // assert(
        // saveTaskAuto != null || onJustEdited != null,
        // "自動保存における編集フラグのコールバックが設定されていません。",
        // ),
        assert(
          (saveTaskAuto == null &&
                  saveCheckAuto == null &&
                  saveNewLabelAuto == null &&
                  saveAdditionToLabelAuto == null &&
                  saveUnlabelAuto == null) ||
              (saveTaskAuto != null &&
                  saveCheckAuto != null &&
                  saveNewLabelAuto != null &&
                  saveAdditionToLabelAuto != null &&
                  saveUnlabelAuto != null),
          "コールバックが正しく設定されていません（TasksView.checkbox）",
        ),
        _isAutoSave = saveTaskAuto != null;

  const TasksView.icon({
    required this.taskList,
    required this.onAutoSave,
    required this.saveNewLabelAuto,
    required this.saveUnlabelAuto,
  })  : tasksViewStyle = TasksViewStyle.icon,
        saveCheckAuto = null,
        // assert(
        // saveTaskAuto != null || onJustEdited != null,
        // "自動保存における編集フラグのコールバックが設定されていません。",
        // ),
        assert(
          (saveTaskAuto == null &&
                  saveNewLabelAuto == null &&
                  saveAdditionToLabelAuto == null &&
                  saveUnlabelAuto == null) ||
              (saveTaskAuto != null &&
                  saveNewLabelAuto != null &&
                  saveAdditionToLabelAuto != null &&
                  saveUnlabelAuto != null),
          "コールバックが正しく設定されていません（TasksView.icon）",
        ),
        _isAutoSave = saveTaskAuto != null;

  final TasksViewStyle tasksViewStyle;

  /// タスクのリスト
  final List<VTask> taskList;

  /// 自動保存オン時の、各タスクの自動保存ロジック
  final Future<void> Function(
    int position, {
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) onAutoSave;

  // /// 自動保存でない場合に、編集を加えたときの処理
  // final VoidCallback? onJustEdited;

  /// 自動保存かどうか
  final bool isAutoSave;

  /// ラベル化処理
  final Future<int> Function(
    int position,
  )? saveNewLabelAuto;

  /// ラベル化解除処理
  final Future<void> Function(
    int position,
  )? saveUnlabelAuto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // // ラベル化タスクのリスト
    // final List<VLabeledTask> labeledTaskList =
    //     ref.watch(labeledTasksViewModelProvider);
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
            (state) => switch (position) {
              0 => state.titleController1,
              1 => state.titleController2,
              2 => state.titleController3,
              // itemCount の制限上ありえないが、網羅性のため記述
              _ => TextEditingController(),
            },
          ),
        );
        final isLabeled = ref.watch(
          taskLabelEditingControllerProvider(
            taskList[0].labelId,
            taskList[1].labelId,
            taskList[2].labelId,
          ).select((state) =>
              // position に応じて、監視するプロパティを切り替える
              switch (position) {
                0 => state.isLabeled1,
                1 => state.isLabeled2,
                2 => state.isLabeled3,
                // itemCount の制限上ありえないが、網羅性のため記述
                _ => false,
              }),
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
                targetTask: taskList[position],
                saveTaskAuto: _isAutoSave
                    ? (String value) => saveTaskAuto!(position, value)
                    : null,
                saveNewLabelAuto:
                    _isAutoSave ? () => saveNewLabelAuto!(position) : null,
                saveAdditionToLabelAuto: _isAutoSave
                    ? (int value) => saveAdditionToLabelAuto!(position, value)
                    : null,
                saveUnlabelAuto:
                    _isAutoSave ? () => saveUnlabelAuto!(position) : null,
                saveCheckAuto: _isAutoSave
                    ? (bool value) => saveCheckAuto!(position, value)
                    : null,
                isChecked: isChecked,
                notifyCheck: (bool value) {
                  ref
                      .read(taskCheckEditingControllerProvider(
                        taskList[0].isChecked,
                        taskList[1].isChecked,
                        taskList[2].isChecked,
                      ).notifier)
                      .check(position, value);
                },
                notifyLabel: (int? value) {
                  ref
                      .read(taskLabelEditingControllerProvider(
                        taskList[0].labelId,
                        taskList[1].labelId,
                        taskList[2].labelId,
                      ).notifier)
                      .label(position, value);
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
                    isLabeled: isLabeled,
                    saveTaskAuto: _isAutoSave
                        ? (String value) => saveTaskAuto!(position, value)
                        : null,
                    saveNewLabelAuto:
                        _isAutoSave ? () => saveNewLabelAuto!(position) : null,
                    saveAdditionToLabelAuto: _isAutoSave
                        ? (int value) =>
                            saveAdditionToLabelAuto!(position, value)
                        : null,
                    saveUnlabelAuto:
                        _isAutoSave ? () => saveUnlabelAuto!(position) : null,
                    notifyLabel: (int? value) {
                      ref
                          .read(taskLabelEditingControllerProvider(
                            taskList[0].labelId,
                            taskList[1].labelId,
                            taskList[2].labelId,
                          ).notifier)
                          .label(position, value);
                    },
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
    required this.onAutoSave,
    required this.isAutoSave,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// 自動保存オン時の、各タスクの入力値の自動保存ロジック
  final Future<void> Function(
    int position, {
    String? newTitle,
  }) onAutoSave;

  /// 自動保存がオンかオフか
  final bool isAutoSave;

  // // フォーカスが外れたことをフラグに、その段階での入力値を保存する処理を起動するハンドラ
  // Future<void> _handleSave(String value) async {
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 入力欄からフォーカスが外れた際のコールバック
    Future<void> _onUnfocused(String textSnapshot) async {
      _print(
        "フォーカスが解除された際に、そのときの入力値を保存",
        "保存される入力値: ${textSnapshot}",
      );
      // 最後に保存した値から変化しているかどうか
      final bool isChanged = textSnapshot != taskTitle;
      // 自動保存オンのときの保存処理
      if (isChanged && isAutoSave) {
        // 編集未保存フラグをおろす
        ref.read(editSavingControllerProvider.notifier).onSaved();
        // TasksView 呼び出し元（各画面クラス）で指定した自動保存処理を実行する
        await onAutoSave(position, newTitle: textSnapshot);
      }
    }

    // TextEditingController と FocusNode の管理元
    final TextFocusController textFocusController =
        useTextFocusController(onUnfocused: _onUnfocused);

    // 入力欄本体
    return TextFieldTapRegion(
      // この領域の「外」がタップされたらフォーカスを外す
      onTapOutside: (event) {
        textFocusController.focusNode.unfocus();
      },
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          labelText: "タスク${position + 1}",
          // contentPadding: EdgeInsets.all(0),
        ),
        controller: textFocusController.controller,
        style: TextStyle(fontSize: 17.0.sp),
        textInputAction: TextInputAction.done,
        // エンターキー等で、入力完了によってフォーカスが外れるようにする
        onSubmitted: (_) {
          textFocusController.focusNode.unfocus();
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
    required this.targetTask,
    required this.isAutoSave,
    required this.saveNewLabelAuto,
    required this.saveAdditionToLabelAuto,
    required this.saveUnlabelAuto,
  });

  /// タスクのリスト番号
  final int position;

  /// 対象の [VTask]
  final VTask targetTask;

  /// 自動保存オン時の、各タスクの自動保存ロジック
  final Future<void> Function(
    int position, {
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) onAutoSave;

  /// 自動保存がオンかオフか
  final bool isAutoSave;

  /// ラベル化処理
  final Future<int> Function()? saveNewLabelAuto;

  /// 既存のラベルに追加する処理
  final Future<void> Function(int)? saveAdditionToLabelAuto;

  /// ラベル化解除処理
  final Future<void> Function()? saveUnlabelAuto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ラベルに登録されているタスクかどうか
    final bool isLabeled = targetTask.labelId != -1;
    // タスクタイトル（String）
    final String taskTitle = targetTask.task;
    // チェックボックスの値
    final bool isChecked = targetTask.isChecked;

    return CheckboxListTile(
      title: _TaskField(
        position: position,
        taskTitle: targetTask.task,
        onAutoSave: onAutoSave,
        isAutoSave: isAutoSave,
      ),
      value: isChecked,
      // チェックボックスが leading （左）側
      controlAffinity: ListTileControlAffinity.leading,
      // チェックボックス変更時
      onChanged: (bool? value) async {
        if (isChecked != value!) {
          // 自動保存オンの場合
          if (isAutoSave) {
            // 自動保存
            await onAutoSave(position, newChecked: value);
          }
          // 自動保存オフの場合
          else {
            // 下書きとして反映させる
            await _keepAsDraft(ref,
              targetTask: targetTask,
              newChecked: value,
            );
          }
        }
      },
      // trailing （右）側の Widget
      secondary: IconButton(
        // ラベル化済みなら塗りつぶし
        icon: isLabeled
            ? Icon(Icons.bookmark)
            : Icon(
                Icons.bookmark_add_outlined,
              ),
        // ラベルマークをタップ
        onPressed: () async {
          // マークがついていない状態で押した場合
          if (!isLabeled) {
            // このタイルのタスクのタイトルと合致するラベルがあるかどうか
            final int? existingLabelId = ref.read(
              labeledTasksViewModelProvider.select(
                (state) => state.idWithSameTitleAs(
                  taskTitle,
                ),
              ),
            );
            // 同じ名前のラベルがすでに存在する場合
            if (existingLabelId != null) {
              // 対象のラベルに登録するかを確認するダイアログを表示
              final bool willLabel = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return ConfirmingExistingLabelDialog(labelTitle: taskTitle);
                },
              );
              // 「いいえ」を選択した場合は、早期リターン
              if (!willLabel) {
                return;
              }

              // 自動保存オンの場合
              if (saveAdditionToLabelAuto != null) {
                // TasksView 呼び出し元（各画面クラス）で指定した自動保存処理を実行する
                await saveAdditionToLabelAuto!(existingLabelId);
              }
              // 自動保存オフの場合
              else {
                // 下書きとして反映させる
                await _keepAsDraft(
                  ref,
                  targetTask: targetTask,
                  newLabelId: existingLabelId,
                );
              }
            }
            // （マークが 無 → 有 で且つ、）同じ名前のラベルがない場合
            else {
              // 自動保存オンの場合
              if (isAutoSave) {
                // 「ラベル化されたタスク一覧」ダイアログを表示
                await showLabeledTaskListDialogToSingleTask(
                  context,
                  ref,
                  targetVTask: targetTask,
                );
                // 自動保存
                final int newId = await saveNewLabelAuto!();
                // ラベルの値を新規ラベルの ID に変換
                notifyLabel(newId);
              }
              // 自動保存オフの場合
              else {
                // todo （2026/09/01）＞＞
                // 編集未保存フラグを立てる
                ref.read(editSavingControllerProvider.notifier).onEdited();
              }
            }
          }
          // マークが解除された場合
          else {
            // popup メニューを表示して、解除か変更かを選択させる
            final bool? willUnlabel = await showMenuFromWidgetRect<bool>(
              context,
              menuItems: <PopupMenuEntry<bool>>[
                PopupMenuItem(
                  child: UtilizedText(
                    "ラベルを変更する",
                    fontSize: 18,
                  ),
                  value: true,
                ),
                PopupMenuItem(
                  child: UtilizedText(
                    "ラベルを変更する",
                    fontSize: 18,
                  ),
                  value: false,
                ),
              ],
            );
            // どちらも押されずに戻った場合
            if (willUnlabel == null) {
              return;
            }
            // 「ラベルを変更する」を選択した場合
            else if (willUnlabel) {
              // ラベルの値を null に変換
              notifyLabel(null);

              // 自動保存オンの場合
              if (saveUnlabelAuto != null) {
                // 自動保存
                await saveUnlabelAuto!();
              }
              // 自動保存オフの場合
              else {
                // 編集未保存フラグを立てる
                ref.read(editSavingControllerProvider.notifier).onEdited();
              }
            }
            // 「ラベルを変更する」を選択した場合
            else {
              // 「ラベル化されたタスク一覧」ダイアログを表示
              await showLabeledTaskListDialogToSingleTask(
                context,
                ref,
                targetVTask: targetTask,
              );
            }
          }
        },
      ),
    );
  }
}

class _IconTaskField extends ConsumerWidget {
  const _IconTaskField({
    required this.position,
    required this.taskTitle,
    required this.titleController,
    required this.isLabeled,
    required this.notifyLabel,
    required this.saveTaskAuto,
    required this.saveNewLabelAuto,
    required this.saveAdditionToLabelAuto,
    required this.saveUnlabelAuto,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// ラベル化されているかどうか
  final bool isLabeled;

  /// ラベル化マークの値が変わったときのコントローラの操作
  final void Function(int?) notifyLabel;

  /// タスクを自動保存する処理
  final Future<void> Function(String)? saveTaskAuto;

  /// ラベル化処理
  final Future<int> Function()? saveNewLabelAuto;

  /// 既存のラベルに追加する処理
  final Future<void> Function(int)? saveAdditionToLabelAuto;

  /// ラベル化解除処理
  final Future<void> Function()? saveUnlabelAuto;

  /// タスク入力値のコントローラ
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.task),
      title: _TaskField(
        position: position,
        taskTitle: taskTitle,
        saveTaskAuto: saveTaskAuto,
        titleController: titleController,
      ),
      trailing: IconButton(
        // ラベル化済みなら塗りつぶし
        icon: isLabeled
            ? Icon(Icons.bookmark)
            : Icon(
                Icons.bookmark_add_outlined,
              ),
        onPressed: () async {
          final bool newMark = !isLabeled;
          // マークがついた場合
          if (newMark) {
            // ラベルVM の state を read で参照
            final List<VLabeledTask> labelList =
                ref.read(labeledTasksViewModelProvider);
            // このタイルのタスクのタイトルと合致するラベルがあるかどうか
            final int? existingLabelId = labelList.idWithSameTitleAs(taskTitle);
            // 同じ名前のラベルがすでに存在する場合
            if (existingLabelId != null) {
              // 対象のラベルに登録するかを確認するダイアログを表示
              final bool willLabel = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return ConfirmingExistingLabelDialog(labelTitle: taskTitle);
                },
              );
              // 「いいえ」を選択した場合は、早期リターン
              if (!willLabel) {
                return;
              }
              // ラベルの値を変換
              notifyLabel(existingLabelId);

              // 自動保存オンの場合
              if (saveAdditionToLabelAuto != null) {
                // 自動保存
                await saveAdditionToLabelAuto!(existingLabelId);
              }
              // 自動保存オフの場合
              else {
                // 編集未保存フラグを立てる
                ref.read(editSavingControllerProvider.notifier).onEdited();
              }
            }
            // （マークがついて且つ、）同じ名前のラベルがない場合
            else {
              // 自動保存オンの場合
              if (saveNewLabelAuto != null) {
                // 自動保存
                final int newId = await saveNewLabelAuto!();
                // ラベルの値を新規ラベルの ID に変換
                notifyLabel(newId);
              }
              // 自動保存オフの場合
              else {
                // ラベルの値を新規ラベルの -1 に変換
                notifyLabel(-1);
                // 編集未保存フラグを立てる
                ref.read(editSavingControllerProvider.notifier).onEdited();
              }
            }
          }
          // マークが解除された場合
          else {
            // ラベルの値を null に変換
            notifyLabel(null);

            // 自動保存オンの場合
            if (saveUnlabelAuto != null) {
              // 自動保存
              await saveUnlabelAuto!();
            }
            // 自動保存オフの場合
            else {
              // 編集未保存フラグを立てる
              ref.read(editSavingControllerProvider.notifier).onEdited();
            }
          }
        },
      ),
    );
  }
}

/// 下書きを反映する処理を呼び出すトップレベル関数（プライベート）
///  - 編集未保存フラグを立てる
///  - [TasksController] の下書き反映処理を呼び出す
Future<void> _keepAsDraft(
  WidgetRef ref, {
  required VTask targetTask,
  String? newTitle,
  bool? newChecked,
  int? newLabelId,
}) async {
  // 編集未保存フラグを立てる
  ref.read(editSavingControllerProvider.notifier).onEdited();
  // [TasksController] の下書き反映処理を呼び出す
  await ref.read(tasksControllerProvider).keepAsDraft(
      taskInfo: [
        TaskUpdateParameter(
            targetVTask: targetTask,
            newTitle: newTitle,
            newChecked: newChecked,
            newLabelId: newLabelId),
      ],
    );
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
