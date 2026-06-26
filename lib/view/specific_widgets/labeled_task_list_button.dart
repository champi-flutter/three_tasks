import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';

/// 「ラベル化されたタスク一覧」ボタンクラス
class LabeledTaskListButton extends StatelessWidget {
  const LabeledTaskListButton({
    super.key,
    required this.taskTitleList,
    required this.onApplyLabeledTask,
    required this.onReplaceLabeledTask,
  });

  /// 呼び出し元の画面のタスクのタイトルのリスト
  final List<String> taskTitleList;

  /// 空欄のタスク入力欄に指定のラベル化タスクを当てはめるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  final Future<void> Function(int, VLabeledTask) onApplyLabeledTask;

  /// 入力済みのタスク入力欄を指定のラベル化タスクに置き換えるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  final Future<void> Function(int, VLabeledTask) onReplaceLabeledTask;

  @override
  Widget build(BuildContext context) {
    return BottomButton.sync(
      text: "ラベル化されたタスク一覧",
      onPressedSync: () {
        // 「ラベル化されたタスク一覧」ダイアログを表示
        showDialog(
          context: context,
          builder: (context) =>
              _LabeledTaskListDialog(
                taskTitleList: taskTitleList,
                onApplyLabeledTask: onApplyLabeledTask,
                onReplaceLabeledTask: onReplaceLabeledTask,
              ),
        );
      },
    );
  }
}

/// 「ラベル化されたタスク一覧」ダイアログ
class _LabeledTaskListDialog extends ConsumerWidget {
  const _LabeledTaskListDialog({
    super.key,
    required this.taskTitleList,
        required this.onApplyLabeledTask,
    required this.onReplaceLabeledTask,
  }): assert(
  taskTitleList.length == 3,
  "3つのタスクの状態値を当てはめてください（_LabeledTaskApplyingDialog.isEmpty）。",
  );

  /// 呼び出し元の画面のタスクのタイトルのリスト
  final List<String> taskTitleList;

  /// 空欄のタスク入力欄に指定のラベル化タスクを当てはめるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  final Future<void> Function(int, VLabeledTask) onApplyLabeledTask;

  /// 入力済みのタスク入力欄を指定のラベル化タスクに置き換えるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  final Future<void> Function(int, VLabeledTask) onReplaceLabeledTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // デバイスの画面の横幅
    final double screenWidth = context.screenWidth;

    // デバイスの画面の縦幅
    final double screenHeight = context.screenHeight;

    // VM が管理するリスト（state）を監視
    final List<VLabeledTask> taskList = ref.watch(
        labeledTasksViewModelProvider);
    // リストが1つ以上あるかどうか（リスト要素数 0 に対応）
    final bool existsTask = taskList.isNotEmpty;

    // 本体
    final Widget contents = ListView.separated(
      // `existsTask` で条件分岐して、リスト要素数 0 にしないようにする
      itemCount: taskList.length,
      itemBuilder: (context, int position) {
        // タスクタイトル
        final String taskTitle = taskList[position].label;
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
            final bool? willPop = await showDialog<bool>(context: context, builder: (_) =>
                _LabeledTaskApplyingDialog(
                  taskTitleList: taskTitleList,
                  labeledTask: taskList[position],
                  onApplyLabeledTask: onApplyLabeledTask,
                  onReplaceLabeledTask: onReplaceLabeledTask,
                ),
            );
            assert(
              willPop != null,
              "Navigator.pop の戻り値が設定されていません（_LabeledTaskListDialog）。",
            );
            if(context.mounted) {
              // _LabeledTaskApplyingDialog から true を渡されたときのみ、
              // このダイアログも閉じる
              if (willPop!) {
                Navigator.of(context).popWithUnfocus();
              }
            }
          },
        );
      },
      separatorBuilder: (context, index) =>
          Divider(
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

class _LabeledTaskApplyingDialog extends StatelessWidget {
  const _LabeledTaskApplyingDialog({
    super.key,
    required this.taskTitleList,
    required this.labeledTask,
    required this.onApplyLabeledTask,
    required this.onReplaceLabeledTask,
  })
      : assert(
  taskTitleList.length == 3,
  "3つのタスクの状態値を当てはめてください（_LabeledTaskApplyingDialog.isEmpty）。",
  );

  /// 呼び出し元の画面のタスクのタイトルのリスト
  final List<String> taskTitleList;

  final VLabeledTask labeledTask;

  /// 空欄のタスク入力欄に指定のラベル化タスクを当てはめるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  final Future<void> Function(int, VLabeledTask) onApplyLabeledTask;

  /// 入力済みのタスク入力欄を指定のラベル化タスクに置き換えるコールバック
  ///  - 第1引数（[int]）: タスク入力欄のリスト番号
  ///  - 第2引数（[VLabeledTask]）: 対象のラベル化タスク
  final Future<void> Function(int, VLabeledTask) onReplaceLabeledTask;

  @override
  Widget build(BuildContext context) {
    // 3 つの ListTile 要素を持つ List<Widget>
    final List<Widget> contentsList = List.generate(3, (position) {
      final bool isTaskEmpty = taskTitleList[position].isEmpty;
      return ListTile(
        title: UtilizedText(
          isTaskEmpty
              ? "タスク${position + 1}に当てはめる"
              : "「${taskTitleList[position]}」を置き換える",
          fontSize: 21,
        ),
        onTap: () async {
          // タスクタイトルが空欄の場合
          if (isTaskEmpty) {
            await onApplyLabeledTask(position, labeledTask);
            if(context.mounted){
              // 遷移元に true を返し、全てのダイアログを閉じるよう促す
              Navigator.of(context).popWithUnfocus(true);
            }
          }
          // タスクタイトルがすでに入力済みの場合
          else {
            await onReplaceLabeledTask(position, labeledTask);
            if(context.mounted){
              // 遷移元に true を返し、全てのダイアログを閉じるよう促す
              Navigator.of(context).popWithUnfocus(true);
            }
          }
        },
      );
    });
    return SizedSimpleDialog.backOnly(
      contentsList: contentsList,
      // 戻るボタンの処理
      onReturn: (){
        // showDialog の呼び出し元に false を返す
        Navigator.of(context).popWithUnfocus<bool>(false);
      },
    );
  }
}


