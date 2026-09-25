import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/show_label_dialog.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/type_definition.dart';


/// 「ラベル化されたタスク一覧」ダイアログ
class LabelListDialog extends HookConsumerWidget {
  const LabelListDialog.forSearch({
    super.key,
    required this.taskState,
    required this.labelListState,
    required this.onApply,
  }) : _singlePosition = null;

  const LabelListDialog.toSingleTask({
    super.key,
    required this.taskState,
    required this.labelListState,
    required int targetPosition,
    required this.onApply,
  }) : _singlePosition = targetPosition;

  /// 対象が1つの場合の要素の位置（nullable）
  ///
  /// [LabelListDialog.forSearch] から呼ばれた場合は、`null` になり、
  /// [_LabelApplyingDialog] に `null` を渡す。
  final int? _singlePosition;

  /// 対象の [VTask] のリスト
  final TaskList<VTask> taskState;

  /// 対象ラベルリスト
  final List<VLabel> labelListState;

  /// 対象のラベルの適用した際のコールバック
  final AddTaskIdInLabelCallback onApply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // デバイスの画面の横幅
    final double screenWidth = context.screenWidth;

    // デバイスの画面の縦幅
    final double screenHeight = context.screenHeight;

    // リストが1つ以上あるかどうか（リスト要素数 0 に対応）
    final bool existsTask = labelListState.isNotEmpty;

    // 本体
    final Widget contents = existsTask
        ? ListView.separated(
            // `existsTask` で条件分岐して、リスト要素数 0 にしないようにする
            itemCount: labelListState.length,
            itemBuilder: (context, int position) {
              // ラベルタイトル
              final String labelTitle = labelListState[position].title;
              return ListTile(
                // dense: true,
                title: UtilizedText(
                  labelTitle,
                  // todo サイズ確認（2026/06/11）＞＞
                  fontSize: 12,
                ),
                onTap: () async {
                  final bool? willPop = await showDialog<bool>(
                    context: context,
                    builder: (_) => _LabelApplyingDialog(
                      taskState: taskState,
                      vLabel: labelListState[position],
                      // .forSearch から呼ばれた場合は、null を渡す。
                      targetPosition: _singlePosition, // nullable
                      onApply: onApply,
                    ),
                  );
                  assert(
                    willPop != null,
                    "Navigator.pop の戻り値が設定されていません（_LabelApplyingDialog）。",
                  );
                  if (context.mounted) {
                    // _LabelApplyingDialog から true を渡されたときのみ、
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
          )
        : Container();
    return SimpleDialog(
      title: existsTask ? UtilizedText("ラベル化されたタスク") : null,
      contentPadding: EdgeInsets.fromLTRB(0.0, 12.h, 0.0, 24.h),
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.8,
            maxHeight: screenHeight * 0.6,
          ),
          // リスト要素数 0 に対応した contents
          child: contents,
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

class _LabelApplyingDialog extends ConsumerWidget {
  // const _LabelApplyingDialog.inTaskList({
  //   super.key,
  //   required this.taskState,
  //   required this.vLabel,
  // }) : _singlePosition = null;

  const _LabelApplyingDialog({
    required this.taskState,
    required this.vLabel,
    required this.onApply,
    required int? targetPosition,
  }) : _singlePosition = targetPosition;

  final int? _singlePosition;

  /// 指定したラベル
  final VLabel vLabel;

  /// 対象の [VTask] のリスト
  final TaskList<VTask> taskState;

  /// 対象のラベルの適用した際のコールバック
  final AddTaskIdInLabelCallback onApply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3 つの ListTile 要素を持つ List<Widget>
    final List<Widget> contentsList = switch (_singlePosition != null) {
      true => [
          ListTile(
            title: UtilizedText(
              "「${taskState[_singlePosition!].value.title}」と置き換える",
              fontSize: 21,
            ),
            onTap: () async {
              final VTask targetTask = taskState[_singlePosition].value;

              // targetTask に、 vLabel を当てはめる
              await onApply(vLabel: vLabel, vTask: targetTask);
              if (context.mounted) {
                // 遷移元に true を返し、全てのダイアログを閉じるよう促す
                Navigator.of(context).popWithUnfocus(true);
              }
            },
          )
        ],
      false => List.generate(3, (position) {
          final VTask targetTask = taskState[position].value;
          final bool isTaskEmpty = targetTask.title.isEmpty;
          return ListTile(
            title: UtilizedText(
              isTaskEmpty
                  ? "タスク${position + 1}に当てはめる"
                  : "「${targetTask.title}」を置き換える",
              fontSize: 21,
            ),
            onTap: () async {
              // targetTask に、 vLabel を当てはめる
              await onApply(vLabel: vLabel, vTask: targetTask);
              if (context.mounted) {
                // 遷移元に true を返し、全てのダイアログを閉じるよう促す
                Navigator.of(context).popWithUnfocus(true);
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

