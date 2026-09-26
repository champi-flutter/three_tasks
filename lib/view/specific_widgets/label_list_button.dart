import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/presentation_providers/controller_providers.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/presentation/controller/dto/label_control_parameter/label_control_parameter.dart';
import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/label_list_dialog.dart';
import 'package:three_tasks/view/specific_widgets/overlays/label_list_dialog/show_label_dialog.dart';

/// 「ラベル化されたタスク一覧」ボタンクラス
class LabelListButton extends ConsumerWidget {
  const LabelListButton({
    super.key,
    required this.taskState,
    required this.isAutoSave,
  });

  /// 対象の [VTask] のリスト
  final TaskList<VTask> taskState;

  /// 自動保存かどうか
  final bool isAutoSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // ラベルをタスクに適用した際のコールバック
    final onApply = ({
      required ListEntry<VLabel> vLabelEntry,
      required ListEntry<VTask> vTaskEntry,
    })
    // 折りたたみ用
    async {
      final VTask vTask = vTaskEntry.value;
      // タスク ID がどのタスクの ID か
      final LabelControlParameter parameter = switch (vTask) {
        VDailyTask() => LabelControlParameter(newDailyId: vTask.id),
        VWeeklyTask() => LabelControlParameter(newWeeklyId: vTask.id),
        VMonthlyTask() => LabelControlParameter(newMonthlyId: vTask.id),
        VYearlyTask() => LabelControlParameter(newYearlyId: vTask.id),
      };
      await ref.read(labelsControllerProvider).controlLabel(
        isAutoSave: isAutoSave,
        vLabelEntry: vLabelEntry,
        parameter: parameter,
      );
      // タスクのラベル情報を更新する
      await ref.read(tasksControllerProvider).controlTask(
          isAutoSave: isAutoSave,
          taskState: taskState,
          position: vTaskEntry.index,
          parameter: TaskControlParameter(
            newLabelId: vLabelEntry.value.labelId,
          )
      );
    };

    return BottomButton.async(
      text: "ラベル化されたタスク一覧",
      onPressedAsync: () async{
        // 「ラベル化されたタスク一覧」ダイアログを表示
        await showLabelSearchDialog(
          context,
          taskState: taskState,
          onApply: onApply,
        );
      },
    );
  }
}


