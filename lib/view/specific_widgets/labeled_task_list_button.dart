import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_tasks/entities/view_type/v_label/v_labeled_task.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/overlays/labeled_task_list_dialog.dart';
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
              LabeledTaskListDialog(
                taskTitleList: taskTitleList,
                onApplyLabeledTask: onApplyLabeledTask,
                onReplaceLabeledTask: onReplaceLabeledTask,
              ),
        );
      },
    );
  }
}


