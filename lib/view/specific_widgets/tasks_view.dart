import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view_controller/task_check_editing_controller.dart';
import 'package:three_tasks/view_controller/task_label_editing_controller.dart';
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
    required this.saveTaskAuto,
    required this.saveCheckAuto,
    required this.saveNewLabelAuto,
    required this.saveAdditionToLabelAuto,
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
    required this.saveTaskAuto,
    required this.saveNewLabelAuto,
    required this.saveAdditionToLabelAuto,
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

  /// 入力欄に値を入力した状態でフォーカスを外したときの自動保存ロジック
  final Future<void> Function(int position, String value)? saveTaskAuto;

  // /// 自動保存でない場合に、編集を加えたときの処理
  // final VoidCallback? onJustEdited;

  /// 自動保存かどうか
  final bool _isAutoSave;

  /// ラベル化処理
  final Future<int> Function(
    int position,
  )? saveNewLabelAuto;

  /// 既存のラベルに追加する処理
  final Future<void> Function(int position, int)? saveAdditionToLabelAuto;

  /// ラベル化解除処理
  final Future<void> Function(
    int position,
  )? saveUnlabelAuto;

  /// チェックボックスの値が更新される時の処理
  final Future<void> Function(int position, bool value)? saveCheckAuto;

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
                taskTitle: taskList[position].task,
                isLabeled: isLabeled,
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
                        ? (int value) => saveAdditionToLabelAuto!(position, value)
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
    required this.titleController,
    required this.saveTaskAuto,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// タスクを保存する処理
  final Future<void> Function(String)? saveTaskAuto;

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
          if (isChanged && saveTaskAuto != null) {
            // 編集未保存フラグをおろす
            ref.read(editSavingControllerProvider.notifier).onSaved();
            // 自動保存
            await saveTaskAuto!(titleController.text);
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
        _print("TextField への入力以外で入力欄に入れる値（taskTitle）が変化した場合");
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
    required this.saveCheckAuto,
    required this.isChecked,
    required this.notifyCheck,
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

  /// チェックボックスの値が更新される時の自動保存処理
  final Future<void> Function(bool)? saveCheckAuto;

  /// チェックボックスの値
  final bool isChecked;

  /// チェックボックスの値が変わったときのコントローラの操作
  final void Function(bool) notifyCheck;

  /// タスク入力値のコントローラ
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      title: _TaskField(
        position: position,
        taskTitle: taskTitle,
        saveTaskAuto: saveTaskAuto,
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
                  return _ConfirmingExistingLabelDialog(labelTitle: taskTitle);
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
                  return _ConfirmingExistingLabelDialog(labelTitle: taskTitle);
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

/// ラベル化時に同じ名前のラベルがすでにあった場合に、そこに登録するかを確認するダイアログ
///  - 「はい」: `pop` して `true` を返す
///  - 「いいえ」: `pop` して `false` を返す
class _ConfirmingExistingLabelDialog extends StatelessWidget {
  const _ConfirmingExistingLabelDialog({super.key, required this.labelTitle});

  final String labelTitle;

  @override
  Widget build(BuildContext context) {
    return SizedSimpleDialog.confirm(
      title: UtilizedText(
        "確認",
        fontSize: 21,
      ),
      contentsList: [
        UtilizedText(
          "「$labelTitle」 はすでに存在します。",
          fontSize: 18,
        ),
        UtilizedText(
          "「$labelTitle」 に登録しますか？",
          fontSize: 18,
        ),
        // todo 「以降表示しない」のチェックボックス（2026/07/01）＞＞
      ],
      onDecided: () {
        // pop 時に true を返す
        Navigator.of(context).pop(true);
      },
      onReturn: () {
        // pop 時に false を返す
        Navigator.of(context).pop(false);
      },
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
