import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_label/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';

/// 「ラベル化されたタスク一覧」ダイアログ
class LabeledTaskListDialog extends ConsumerWidget {
  const LabeledTaskListDialog({
    super.key,
    required this.taskList,
  }) : assert(
          taskList.length == 1 || taskList.length == 3,
          "[LabeledTaskListDialog] 引数が不適当です。\ntaskList.length = ${taskList.length}",
        );

  /// 対象の [VTask] のリスト
  final List<VTask> taskList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // デバイスの画面の横幅
    final double screenWidth = context.screenWidth;

    // デバイスの画面の縦幅
    final double screenHeight = context.screenHeight;

    // VM が管理するリスト（state）を監視
    final List<VLabeledTask> labelList =
        ref.watch(labeledTasksViewModelProvider);
    // リストが1つ以上あるかどうか（リスト要素数 0 に対応）
    final bool existsTask = labelList.isNotEmpty;

    // 本体
    final Widget contents = ListView.separated(
      // `existsTask` で条件分岐して、リスト要素数 0 にしないようにする
      itemCount: labelList.length,
      itemBuilder: (context, int position) {
        // タスクタイトル
        final String taskTitle = labelList[position].label;
        return ListTile(
          // dense: true,
          title: UtilizedText(
            taskTitle,
            // todo サイズ確認（2026/06/11）＞＞
            fontSize: 12,
          ),
          // trailing: IconButton(
          //   onPressed: () async {
          //     // タスクタイトルをクリップボードにコピー
          //     final readClipboardVM = ref.read(clipboardServiceProvider);
          //     await readClipboardVM.copyToClipboard(taskTitle);
          //   },
          //   icon: Icon(Icons.copy),
          // ),
          onTap: () async {
            final bool? willPop = await showDialog<bool>(
              context: context,
              builder: (_) => _LabeledTaskApplyingDialog(
                taskList: taskList,
                labeledTask: labelList[position],
              ),
            );
            assert(
              willPop != null,
              "Navigator.pop の戻り値が設定されていません（_LabeledTaskListDialog）。",
            );
            if (context.mounted) {
              // _LabeledTaskApplyingDialog から true を渡されたときのみ、
              // このダイアログも閉じる
              if (willPop!) {
                Navigator.of(context).popWithUnfocus();
              }
            }
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        indent: 8,
        endIndent: 8,
        thickness: 2.0,
      ),
    );
    return SimpleDialog(
      title: UtilizedText("ラベル化されたタスク"),
      contentPadding: EdgeInsets.fromLTRB(0.0, 12.h, 0.0, 24.h),
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.8,
            maxHeight: screenHeight * 0.6,
          ),
          // リスト要素数 0 に対応
          child: existsTask ? contents : Container(),
        ),
        // 戻るボタン
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // TextField 等にフォーカスを残さない
                Navigator.of(context).popWithUnfocus();
              },
              child: Icon(Icons.clear),
              elevation: 2,
            ),
          ),
        )
      ],
    );
  }
}

class _LabeledTaskApplyingDialog extends ConsumerWidget {
  const _LabeledTaskApplyingDialog({
    super.key,
    required this.taskList,
    required this.labeledTask,
  })  : assert(
          taskList.length == 1 || taskList.length == 3,
          "[_LabeledTaskApplyingDialog] 引数が不適当です。\ntaskList.length = ${taskList.length}",
        ),
        _isSingle = taskList.length == 1;

  /// 対象タスクが1つかどうか
  ///
  /// `LabeledTaskListButton` から呼ばれた場合は、3つ全てのタスクが対象（`false`）
  /// となる。
  final bool _isSingle;

  /// 指定したラベル
  final VLabeledTask labeledTask;

  /// 対象の [VTask] のリスト
  final List<VTask> taskList;

  /// タスク入力欄に指定のラベル化タスクを当てはめるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  Future<void> _applyLabel(
    WidgetRef ref, {
    required int position,
    required VLabeledTask label,
  })
  // 折りたたみ用
  async {
    await ref.read(tasksControllerProvider).saveTaskChanges(
      taskInfo: [TaskUpdateParameter(
        targetVTask: taskList[position],
        newLabelId: label.labelId,
        newTitle: label.label,
      )],
    );
  }

  /// **週単位タスクの空欄** に指定のラベル化タスクを当てはめるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  Future<void> _applyLabelToWeeklyTasksPlaceHolder(
      WidgetRef ref, {
        required int position,
        required VLabeledTask label,
      })
  // 折りたたみ用
  async {
    final VTask targetVTask = taskList[position];
    if(targetVTask is VWeeklyTask) {
      await ref.read(weeklyTasksControllerProvider).saveTaskChanges(
        taskInfo: [WeeklyTaskUpdateParameter(
          targetVTask: targetVTask,
          newLabelId: label.labelId,
          newTitle: label.label,
        )],
      );
    } else {
      // todo エラーハンドリング（2026/08/31）＞＞
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3 つの ListTile 要素を持つ List<Widget>
    final List<Widget> contentsList = switch (_isSingle) {
      true => [
          ListTile(
            title: UtilizedText(
              "「${taskList.single.task}」を置き換える",
              fontSize: 21,
            ),
            onTap: () async {
              final VTask targetTask = taskList.single;
              final bool isTaskEmpty = targetTask.task.isEmpty;
              // 対象のタスクが週単位で、かつ空欄の場合
              if (isTaskEmpty && targetTask is VWeeklyTask) {
                await _applyLabel(ref, position: 0, label: labeledTask);
                if (context.mounted) {
                  // 遷移元に true を返し、全てのダイアログを閉じるよう促す
                  Navigator.of(context).popWithUnfocus(true);
                }
              }
              // タスクタイトルがすでに入力済みの場合
              else {
                await _applyLabel(ref, position: 0, label: labeledTask);
                if (context.mounted) {
                  // 遷移元に true を返し、全てのダイアログを閉じるよう促す
                  Navigator.of(context).popWithUnfocus(true);
                }
              }
            },
          )
        ],
      false => List.generate(3, (position) {
        final VTask targetTask = taskList[position];
          final bool isTaskEmpty = targetTask.task.isEmpty;
          return ListTile(
            title: UtilizedText(
              isTaskEmpty
                  ? "タスク${position + 1}に当てはめる"
                  : "「${targetTask.task}」を置き換える",
              fontSize: 21,
            ),
            onTap: () async {
              // 対象のタスクが週単位で、かつ空欄の場合
              if (isTaskEmpty && targetTask is VWeeklyTask) {
                await _applyLabel(ref, position: position, label: labeledTask);
                if (context.mounted) {
                  // 遷移元に true を返し、全てのダイアログを閉じるよう促す
                  Navigator.of(context).popWithUnfocus(true);
                }
              }
              // タスクタイトルがすでに入力済みの場合
              else {
                await _applyLabel(ref, position: position, label: labeledTask);
                if (context.mounted) {
                  // 遷移元に true を返し、全てのダイアログを閉じるよう促す
                  Navigator.of(context).popWithUnfocus(true);
                }
              }
            },
          );
        }),
    };
    return SizedSimpleDialog.backOnly(
      contentsList: contentsList,
      // 戻るボタンの処理
      onReturn: () {
        // showDialog の呼び出し元に false を返す
        Navigator.of(context).popWithUnfocus<bool>(false);
      },
    );
  }
}

/// 「ラベル化されたタスク一覧」ダイアログを開くトップレベル関数
Future<T?> showLabeledTaskListDialogToSingleTask<T>(
  BuildContext context,
  WidgetRef ref, {
  required VTask targetVTask,
})
// 折りたたみ用
async {
  return await showDialog(
    context: context,
    builder: (dialogContext) => LabeledTaskListDialog(taskList: [targetVTask]),
  );
}
