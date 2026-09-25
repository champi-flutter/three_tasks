import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/hooks/use_labels_view_model.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/confirming_existing_label_dialog.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/label_list_dialog.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/type_definition.dart';


/// 「ラベル化されたタスク一覧」ダイアログを開くトップレベル関数
Future<T?> showLabelApplyingDialog<T>(
  BuildContext context, {
  required TaskList<VTask> taskState,
  required int targetPosition,
  required AddTaskIdInLabelCallback onApply,
})
// 折りたたみ用
async {
  return await showDialog(
    context: context,
    builder: (dialogContext) => _LabelDialogWrapper.toSingleTask(
      taskState: taskState,
      targetPosition: targetPosition,
      onApply: onApply,
    ),
  );
}

/// 「ラベル化されたタスク一覧」ダイアログを開くトップレベル関数
Future<T?> showLabelSearchDialog<T>(
  BuildContext context,{
  required TaskList<VTask> taskState,
  required AddTaskIdInLabelCallback onApply,
})
// 折りたたみ用
async {
  return await showDialog(
    context: context,
    builder: (dialogContext) => _LabelDialogWrapper.forSearch(
      taskState: taskState,
      onApply: onApply,
    ),
  );
}

class _LabelDialogWrapper extends HookConsumerWidget {
  const _LabelDialogWrapper.forSearch({
    super.key,
    required this.taskState,
    required this.onApply,
  }) : _singlePosition = null;

  const _LabelDialogWrapper.toSingleTask({
    super.key,
    required this.taskState,
    required int targetPosition,
    required this.onApply,
  }) : _singlePosition = targetPosition;

  /// 対象の [VTask] のリスト
  final TaskList<VTask> taskState;

  final int? _singlePosition;

  /// 対象のラベルの適用した際のコールバック
  final AddTaskIdInLabelCallback onApply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // VM が管理するリスト（state）を監視
    final List<VLabel>? labelListState = useLabelsViewModel(ref);
    // データが届いた場合
    if (labelListState != null) {
      // ラベルアイコンからのアクセスの場合
      if (_singlePosition != null) {
        final VTask targetVTask = taskState[_singlePosition].value;
        final String targetTitle = targetVTask.title;
        final VLabel? existingLabel = labelListState.asSameTitleAs(targetTitle);
        // 該当IDがなかった場合
        if (existingLabel == null) {
          return LabelListDialog.toSingleTask(
            taskState: taskState,
            labelListState: labelListState,
            targetPosition: _singlePosition,
            onApply: onApply,
          );
        }
        // 該当IDが存在した場合
        else {
          return ConfirmingExistingLabelDialog(
            labelTitle: targetTitle,
            onApply: () => onApply(
              vLabel: existingLabel,
              vTask:  targetVTask,
            ),
          );
        }
      }
      // 「ラベル一覧ボタン」からのアクセス
      else {
        return LabelListDialog.forSearch(
          taskState: taskState,
          labelListState: labelListState,
          onApply: onApply,
        );
      }
    }
    // データローディング中の場合
    else {
      return SimpleDialog(
        contentPadding: EdgeInsets.fromLTRB(0.0, 12.h, 0.0, 24.h),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * 0.8,
              maxHeight: context.screenHeight * 0.6,
            ),
            // リスト要素数 0 に対応した contents
            child: Container(),
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
}
