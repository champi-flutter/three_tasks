import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_label/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'package:three_tasks/view_controller/task_check_editing_controller.dart';
import 'package:three_tasks/view_controller/task_label_editing_controller.dart';
import 'package:three_tasks/view_controller/task_title_editing_controller.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';

class DraftSavingButton extends ConsumerWidget {
  const DraftSavingButton({
    super.key,
    required this.isValid,
    required this.taskList,
    required this.tasksViewStyle,
    required this.saveTitle,
    required this.saveCheck,
  }) : assert(
          tasksViewStyle == TasksViewStyle.icon || saveCheck != null,
          "チェックボックス変更の更新処理の記述がありません。（DraftSavingButton）",
        );

  final bool isValid;

  final List<VTask> taskList;

  final TasksViewStyle tasksViewStyle;

  final Future<void> Function({
    required int position,
    required String newValue,
  }) saveTitle;

  final Future<void> Function({
    required int position,
    required bool newValue,
  })? saveCheck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomButton.async(
      text: "下書き保存",
      isValid: isValid,
      onPressedAsync: () async {
        // ラベル化タスクのリストの最後の保存時の値
        final List<VLabeledTask> labeledTaskList =
            ref.read(labeledTasksViewModelProvider);
        // タスクタイトルコントローラの provider
        final titleProvider = taskTitleEditingControllerProvider(
          title1: taskList[0].task,
          title2: taskList[1].task,
          title3: taskList[2].task,
        );
        // 現在（編集後保存前）のタスクタイトルの値
        final titleState = ref.read(titleProvider);
        // タスクタイトルの変更状態
        final titleController = ref.read(titleProvider.notifier);
        // チェックボックスコントローラの provider
        final checkProvider = taskCheckEditingControllerProvider(
          taskList[0].isChecked,
          taskList[1].isChecked,
          taskList[2].isChecked,
        );
        // 現在（編集後保存前）のチェックボックスの値
        final checkState = ref.read(checkProvider);
        // チェックボックスの変更状態
        final checkController = ref.read(checkProvider.notifier);
        // ラベル化コントローラの provider
        final labelProvider = taskLabelEditingControllerProvider(
          taskList[0].isLabeled(
            labeledTaskList: labeledTaskList,
          ),
          taskList[1].isLabeled(
            labeledTaskList: labeledTaskList,
          ),
          taskList[2].isLabeled(
            labeledTaskList: labeledTaskList,
          ),
        );
        // 現在（編集後保存前）のラベルの値
        final labelState = ref.read(labelProvider);
        // ラベルの変更状態
        final labelController = ref.read(labelProvider.notifier);

        // 各変更保存処理

        // タスクタイトルの変更の保存
        // タスク1のタイトルに変更があった場合
        if (titleController.isChanged1) {
          await saveTitle(
            position: 0,
            newValue: titleState.titleController1.text,
          );
        }
        // タスク2のタイトルに変更があった場合
        if (titleController.isChanged2) {
          await saveTitle(
            position: 1,
            newValue: titleState.titleController2.text,
          );
        }
        // タスク3のタイトルに変更があった場合
        if (titleController.isChanged3) {
          await saveTitle(
            position: 2,
            newValue: titleState.titleController3.text,
          );
        }

        // チェックボックスの変更の保存
        if (tasksViewStyle == TasksViewStyle.checkbox) {
          // タスク1のチェックボックスに変更があった場合
          if (checkController.isChanged1) {
            // assert で防御済み
            await saveCheck!(position: 0, newValue: checkState.check1);
          }
          // タスク2のチェックボックスに変更があった場合
          if (checkController.isChanged2) {
            await saveCheck!(position: 1, newValue: checkState.check2);
          }
          // タスク3のチェックボックスに変更があった場合
          if (checkController.isChanged3) {
            await saveCheck!(position: 2, newValue: checkState.check3);
          }
        }

        // ラベルの保存
        // タスク1のラベルに変更があった場合
        if (labelController.isChanged1) {
          // 変化後の値が true （ラベル化されている状態）だった場合
          if (labelState.label1) {
            // ラベル化の登録を依頼
            _print("タスク1のラベル化の登録を依頼");
            await ref
                .read(labeledTasksViewModelProvider.notifier)
                .labeling(vTask: taskList[0]);
          }
          // 変化後の値が false （ラベル化されていない状態）だった場合
          else {
            // ラベル化の解除を依頼
            _print("タスク1のラベル化の解除を依頼");
            // このタイミングでタスクの labelId が null になることはないと思われるが一応
            if (taskList[0].labelId != null) {
              await ref.read(labeledTasksViewModelProvider.notifier).unlabeling(
                    vTask: taskList[0],
                    labelId: taskList[0].labelId!,
                  );
            } else {
              // todo エラーハンドリング（2026/07/01）＞＞
            }
          }
        }

        // タスク2のラベルに変更があった場合
        if (labelController.isChanged2) {
          // 変化後の値が true （ラベル化されている状態）だった場合
          if (labelState.label2) {
            // ラベル化の登録を依頼
            _print("タスク2のラベル化の登録を依頼");
            await ref
                .read(labeledTasksViewModelProvider.notifier)
                .labeling(vTask: taskList[1]);
          }
          // 変化後の値が false （ラベル化されていない状態）だった場合
          else {
            // ラベル化の解除を依頼
            _print("タスク2のラベル化の解除を依頼");
            // このタイミングでタスクの labelId が null になることはないと思われるが一応
            if (taskList[1].labelId != null) {
              await ref.read(labeledTasksViewModelProvider.notifier).unlabeling(
                vTask: taskList[1],
                labelId: taskList[1].labelId!,
              );
            } else {
              // todo エラーハンドリング（2026/07/01）＞＞
            }
          }
        }

        // タスク3のラベルに変更があった場合
        if (labelController.isChanged3) {
          // 変化後の値が true （ラベル化されている状態）だった場合
          if (labelState.label3) {
            // ラベル化の登録を依頼
            _print("タスク3のラベル化の登録を依頼");
            await ref
                .read(labeledTasksViewModelProvider.notifier)
                .labeling(vTask: taskList[2]);
          }
          // 変化後の値が false （ラベル化されていない状態）だった場合
          else {
            // ラベル化の解除を依頼
            _print("タスク3のラベル化の解除を依頼");
            // このタイミングでタスクの labelId が null になることはないと思われるが一応
            if (taskList[2].labelId != null) {
              await ref.read(labeledTasksViewModelProvider.notifier).unlabeling(
                vTask: taskList[2],
                labelId: taskList[2].labelId!,
              );
            } else {
              // todo エラーハンドリング（2026/07/01）＞＞
            }
          }
        }

        // ラッパー側の値を変化
        ref.read(editSavingControllerProvider.notifier).onSaved();
      },
    );
  }
}

/// printメソッド [draft_saving_button.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[draft_saving_button.dart]　" + s1);
    if (s2 != null) print("[draft_saving_button.dart]　" + s2);
    if (s3 != null) print("[draft_saving_button.dart]　" + s3);
    if (s4 != null) print("[draft_saving_button.dart]　" + s4);
    if (s5 != null) print("[draft_saving_button.dart]　" + s5);
    print("");
  }
}
