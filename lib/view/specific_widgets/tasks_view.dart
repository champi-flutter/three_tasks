import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/presentation_providers/controller_providers.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/presentation/controller/dto/label_control_parameter/label_control_parameter.dart';
import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/presentation/controller/labels_controller.dart';
import 'package:three_tasks/presentation/controller/tasks_controller.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/show_label_dialog.dart';

/// [TasksView] の表示形式
///  - [TasksViewStyle.checkbox] : チェックボックス付き
///  - [TasksViewStyle.icon] : チェエクボックスなし（アイコン付き）
enum TasksViewStyle { checkbox, icon }

/// チェックボックス付きタスク入力欄
class TasksView extends ConsumerWidget {
  const TasksView.checkbox({
    required this.taskState,
    required this.isAutoSave,
  }) : tasksViewStyle = TasksViewStyle.checkbox;

  const TasksView.icon({
    required this.taskState,
    required this.isAutoSave,
  }) : tasksViewStyle = TasksViewStyle.icon;

  final TasksViewStyle tasksViewStyle;

  /// タスクのリスト
  final TaskList<VTask> taskState;

  /// 自動保存かどうか
  final bool isAutoSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, position) {

        // todo 各コールバックのロジックをコントローラに委ねる（2026/09/25）＞＞
        // 各タスク編集時のコールバック
        final onControlTask = ({
          String? newTitle,
          bool? newChecked,
          int? newLabelId,
        })
        // 折りたたみ用
        =>
            ref._onControlTask(
              isAutoSave: isAutoSave,
              taskState: taskState,
              position: position,
              newTitle: newTitle,
              newChecked: newChecked,
              newLabelId: newLabelId,
            );

        // ラベルにタスク情報が加わるときのコールバック
        final onAddTaskInLabel = ({
          required VLabel vLabel,
          required VTask vTask,
        })
        // 折りたたみ用
        =>
            ref._onAddTaskInLabel(
              isAutoSave: isAutoSave,
              vLabel: vLabel,
              vTask: vTask,
            );

        // ラベル適用時のコールバック
        final onSetLabel = (BuildContext context) => showLabelApplyingDialog(
              context,
              taskState: taskState,
              targetPosition: position,
              onApply: ({
                required VLabel vLabel,
                required VTask vTask,
              }) async {
                // ラベルにタスク情報を追加する
                await onAddTaskInLabel(
                  vLabel: vLabel,
                  vTask: vTask,
                );
                // タスクのラベル情報を更新する
                await onControlTask(
                  newLabelId: vLabel.labelId,
                );
              },
            );

        // ラベル解除時のコールバック
        final onUnlabel =
            (BuildContext context) => onControlTask(newLabelId: -1);

        switch (tasksViewStyle) {
          case TasksViewStyle.checkbox:
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              // position ごとの入力欄
              child: _CheckableTaskField(
                taskEntry: taskState[position],
                onControlTask: onControlTask,
                onSetLabel: onSetLabel,
                onUnlabel: onUnlabel,
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
                    taskEntry: taskState[position],
                    onControlTask: onControlTask,
                    onSetLabel: onSetLabel,
                    onUnlabel: onUnlabel,
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
///
/// custom_widgets の [useTextFocusController] を用いる。
class _TaskField extends HookConsumerWidget {
  const _TaskField({
    required this.taskEntry,
    required this.onTextEdited,
  });

  /// 対象の [VTask] のエントリ
  final ListEntry<VTask> taskEntry;

  /// 自動保存オン時の、各タスクの入力値の自動保存ロジック
  final Future<void> Function({
    String? newTitle,
  }) onTextEdited;

  // // フォーカスが外れたことをフラグに、その段階での入力値を保存する処理を起動するハンドラ
  // Future<void> _handleSave(String value) async {
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // タスクの位置
    final int position = taskEntry.index;
    // タスク本体
    final VTask targetTask = taskEntry.value;

    // タスクタイトル
    final String taskTitle = targetTask.title;
    // 入力欄からフォーカスが外れた際のコールバック
    Future<void> _onUnfocused(String textSnapshot) async {
      _print(
        "フォーカスが解除された際に、そのときの入力値を保存",
        "保存される入力値: ${textSnapshot}",
      );
      // 最後に保存した値から変化しているかどうか
      final bool isChanged = textSnapshot != taskTitle;
      // 自動保存オンのときの保存処理
      if (isChanged) {
        await onTextEdited(newTitle: textSnapshot);
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
    required this.taskEntry,
    required this.onControlTask,
    required this.onSetLabel,
    required this.onUnlabel,
  });

  /// 対象の [VTask] のエントリ
  final ListEntry<VTask> taskEntry;

  /// 各タスク編集時のコールバック
  final Future<void> Function({
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) onControlTask;

  /// ラベル適用時のコールバック
  final Future<void> Function(BuildContext context) onSetLabel;

  /// ラベル解除時のコールバック
  final Future<void> Function(BuildContext context) onUnlabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // タスク本体
    final VTask targetTask = taskEntry.value;
    // ラベルに登録されているタスクかどうか
    final bool isLabeled = targetTask.labelId != -1;
    // チェックボックスの値
    final bool isChecked = targetTask.isChecked;

    return CheckboxListTile(
      title: _TaskField(
        taskEntry: taskEntry,
        onTextEdited: ({String? newTitle}) => onControlTask(
          newTitle: newTitle,
        ),
      ),
      value: isChecked,
      // チェックボックスが leading （左）側
      controlAffinity: ListTileControlAffinity.leading,
      // チェックボックス変更時
      onChanged: (bool? value) async {
        if (isChecked != value!) {
          await onControlTask(
            newChecked: value,
          );
        }
      },
      // trailing （右）側の Widget
      secondary: _LabelIconTrailing(
        isLabeled: isLabeled,
        onSetLabel: onSetLabel,
        onUnlabel: onUnlabel,
      ),
    );
  }
}

class _IconTaskField extends ConsumerWidget {
  const _IconTaskField({
    required this.taskEntry,
    required this.onControlTask,
    required this.onSetLabel,
    required this.onUnlabel,
  });

  /// 対象の [VTask] のエントリ
  final ListEntry<VTask> taskEntry;

  /// 各タスク編集時のコールバック
  final Future<void> Function({
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  }) onControlTask;

  /// ラベル適用時のコールバック
  final Future<void> Function(BuildContext context) onSetLabel;

  /// ラベル解除時のコールバック
  final Future<void> Function(BuildContext context) onUnlabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // // タスクの位置
    // final int position = taskEntry.index;
    // タスク本体
    final VTask targetTask = taskEntry.value;
    // ラベルに登録されているタスクかどうか
    final bool isLabeled = targetTask.labelId != -1;
    return ListTile(
      leading: const Icon(Icons.task),
      title: _TaskField(
        taskEntry: taskEntry,
        onTextEdited: ({String? newTitle}) => onControlTask(
          newTitle: newTitle,
        ),
      ),
      trailing: _LabelIconTrailing(
        isLabeled: isLabeled,
        onSetLabel: onSetLabel,
        onUnlabel: onUnlabel,
      ),
    );
  }
}

class _LabelIconTrailing extends StatelessWidget {
  const _LabelIconTrailing({
    super.key,
    required this.isLabeled,
    required this.onSetLabel,
    required this.onUnlabel,
  });

  /// ラベル化されているかどうか
  final bool isLabeled;

  /// ラベル適用時のコールバック
  final Future<void> Function(BuildContext context) onSetLabel;

  /// ラベル解除時のコールバック
  final Future<void> Function(BuildContext context) onUnlabel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
          await onSetLabel(context);
        }
        // マークが解除された場合
        else {
          // popup メニューを表示して、解除か変更かを選択させる
          final bool? willUnlabel = await showMenuFromWidgetRect<bool>(
            context,
            menuItems: <PopupMenuEntry<bool>>[
              PopupMenuItem(
                child: UtilizedText(
                  "ラベルを削除する",
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
          // 「ラベルを削除する」を選択した場合
          else if (willUnlabel) {
            await onUnlabel(context);
          }
          // 「ラベルを変更する」を選択した場合
          else {
            // 「ラベル化されたタスク一覧」ダイアログを表示
            await onSetLabel(context);
          }
        }
      },
    );
  }
}

extension ControlActionOnTasksView on WidgetRef {
  /// タスク操作時のコールバック
  Future<void> _onControlTask({
    required bool isAutoSave,
    required TaskList<VTask> taskState,
    required int position,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  })
      // 折りたたみ用
      =>
      isAutoSave
          ? _saveTask(
              taskState: taskState,
              position: position,
              newTitle: newTitle,
              newChecked: newChecked,
              newLabelId: newLabelId,
            )
          : _draftTask(
              taskState: taskState,
              position: position,
              newTitle: newTitle,
              newChecked: newChecked,
              newLabelId: newLabelId,
            );

  /// タスク情報保存処理を呼び出すトップレベル関数（プライベート）
  ///  - 保存フラグを立てる
  ///  - [TasksController] の保存処理を呼び出す
  Future<void> _saveTask({
    required TaskList<VTask> taskState,
    required int position,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  })
  // 折りたたみ用
  async {
    final parameter = TaskControlParameter(
      newTitle: newTitle,
      newChecked: newChecked,
      newLabelId: newLabelId,
    );
    // 編集未保存フラグをおろす
    read(editSavingControllerProvider.notifier).onSaved();
    await read(tasksControllerProvider).saveAt(
      position,
      state: taskState,
      parameter: parameter,
    );
  }

  /// タスク情報の下書きを反映する処理を呼び出すトップレベル関数（プライベート）
  ///  - 編集未保存フラグを立てる
  ///  - [TasksController] の下書き反映処理を呼び出す
  Future<void> _draftTask({
    required TaskList<VTask> taskState,
    required int position,
    String? newTitle,
    bool? newChecked,
    int? newLabelId,
  })
  // 折りたたみ用
  async {
    final parameter = TaskControlParameter(
      newTitle: newTitle,
      newChecked: newChecked,
      newLabelId: newLabelId,
    );
    // 編集未保存フラグを立てる
    read(editSavingControllerProvider.notifier).onEdited();
    // [TasksController] の下書き反映処理を呼び出す
    await read(tasksControllerProvider).draftAt(
      position,
      state: taskState,
      parameter: parameter,
    );
  }

  /// ラベルにタスク情報が加わるときのコールバック
  Future<void> _onAddTaskInLabel({
    required bool isAutoSave,
    required VLabel vLabel,
    required VTask vTask,
  })
  // 折りたたみ用
  async {
    // タスク ID がどのタスクの ID か
    final LabelControlParameter parameter = switch (vTask) {
      VDailyTask() => LabelControlParameter(newDailyId: vTask.id),
      VWeeklyTask() => LabelControlParameter(newWeeklyId: vTask.id),
      VMonthlyTask() => LabelControlParameter(newMonthlyId: vTask.id),
      VYearlyTask() => LabelControlParameter(newYearlyId: vTask.id),
    };
    await _onControlLabel(
      isAutoSave: isAutoSave,
      vLabel: vLabel,
      parameter: parameter,
    );
  }

  // region todo ラベルタイトル変更時のコールバック（2026/09/25）＞＞
  // Future<void> _onChangeLabelTitle({
  //   required bool isAutoSave,
  //   required VLabel vLabel,
  //   required String newTitle,
  // })
  //     // 折りたたみ用
  //     =>
  //     _onControlLabel(
  //       isAutoSave: isAutoSave,
  //       vLabel: vLabel,
  //       parameter: LabelControlParameter(
  //         newTitle: newTitle,
  //       ),
  //     );
  //     endregion

  /// ラベル操作時のコールバック
  Future<void> _onControlLabel({
    required bool isAutoSave,
    required VLabel vLabel,
    required LabelControlParameter parameter,
  })
      // 折りたたみ用
      =>
      isAutoSave
          ? _saveLabel(
              vLabel: vLabel,
              parameter: parameter,
            )
          : _draftLabel(
              vLabel: vLabel,
              parameter: parameter,
            );

  /// ラベル情報保存処理を呼び出すトップレベル関数（プライベート）
  ///  - 保存フラグを立てる
  ///  - [LabelsController] の保存処理を呼び出す
  Future<void> _saveLabel({
    required VLabel vLabel,
    required LabelControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // final parameter = LabelControlParameter(
    //   newTitle: newTitle,
    //   newDailyId: newDailyId,
    //   newWeeklyId: newWeeklyId,
    //   newMonthlyId: newMonthlyId,
    //   newYearlyId: newYearlyId,
    // );
    // 編集未保存フラグをおろす
    read(editSavingControllerProvider.notifier).onSaved();
    await read(labelsControllerProvider).save(
      vLabel: vLabel,
      parameter: parameter,
    );
  }

  /// タスク情報の下書きを反映する処理を呼び出すトップレベル関数（プライベート）
  ///  - 編集未保存フラグを立てる
  ///  - [LabelsController] の下書き反映処理を呼び出す
  Future<void> _draftLabel({
    required VLabel vLabel,
    required LabelControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // final parameter = LabelControlParameter(
    //   newTitle: newTitle,
    //   newDailyId: newDailyId,
    //   newWeeklyId: newWeeklyId,
    //   newMonthlyId: newMonthlyId,
    //   newYearlyId: newYearlyId,
    // );
    // 編集未保存フラグを立てる
    read(editSavingControllerProvider.notifier).onEdited();
    // [LabelsController] の下書き反映処理を呼び出す
    await read(labelsControllerProvider).draft(
      vLabel: vLabel,
      parameter: parameter,
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
