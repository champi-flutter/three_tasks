import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
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
  Widget build(BuildContext context) {
    return BottomButton.async(
      text: "ラベル化されたタスク一覧",
      onPressedAsync: () async{
        // 「ラベル化されたタスク一覧」ダイアログを表示
        await showLabelSearchDialog(context, taskState: taskState, onApply: onApply);
      },
    );
  }
}

extension ControlActionOnLabelListButton on WidgetRef {
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


