import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';

/// 「ラベル化されたタスク一覧」ボタンクラス
class LabeledTaskListButton extends StatelessWidget {
  const LabeledTaskListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomButton.sync(
      text: "ラベル化されたタスク一覧",
      onPressedSync: (){
        // 「ラベル化されたタスク一覧」ダイアログを表示
        showDialog(
          context: context,
          builder: (context)=>_LabeledTaskListDialog(),
        );
      },
    );
  }
}

/// 「ラベル化されたタスク一覧」ダイアログ
class _LabeledTaskListDialog extends ConsumerWidget {
  const _LabeledTaskListDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // デバイスの画面の横幅
    final double screenWidth = context.screenWidth;

    // デバイスの画面の縦幅
    final double screenHeight = context.screenHeight;

    // VM が管理するリスト（state）を監視
    final List<VLabeledTask> taskList = ref.watch(labeledTasksViewModelProvider);
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
          trailing: IconButton(
            onPressed: () async {
              // タスクタイトルをクリップボードにコピー
              final readClipboardVM = ref.read(clipboardServiceProvider);
              await readClipboardVM.copyToClipboard(taskTitle);
            },
            icon: Icon(Icons.copy),
          ),
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

