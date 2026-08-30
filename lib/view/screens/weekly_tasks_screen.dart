import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/labeled_task_list_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';
import 'package:three_tasks/view_models/weekly_tasks_view_model/weekly_tasks_view_model.dart';
import 'history_screen.dart';

// 週の初め
int _firstDay = 0;

int get firstDay => _firstDay;

int _firstWeekday = 0;

int get firstWeekday => _firstWeekday;

class WeeklyTasksScreen extends HookConsumerWidget {
  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // VMを監視
    final List<VWeeklyTask> weeklyTaskList = ref.watch(
        weeklyTasksViewModelProvider);

    Future<void> _saveTaskChanges({
      required int position,
      String? newTitle,
      bool? newChecked,
      int? newLabelId,}) async {
      // 週タスクのコントローラを参照
      final controller = ref.read(weeklyTasksControllerProvider);
      // 入力値の保存を依頼
      await controller.saveTaskChanges(taskInfo: [
        (
        targetVTask: weeklyTaskList[0],
        newTitle: position == 0 ? newTitle : null,
        newChecked: position == 0 ? newChecked : null, // 変更しない項目は null
        newLabelId: position == 0 ? newLabelId : null,
        ),
        (
        targetVTask: weeklyTaskList[1],
        newTitle: position == 1 ? newTitle : null,
        newChecked: position == 1 ? newChecked : null, // 変更しない項目は null
        newLabelId: position == 1 ? newLabelId : null,
        ),
        (
        targetVTask: weeklyTaskList[2],
        newTitle: position == 2 ? newTitle : null,
        newChecked: position == 2 ? newChecked : null, // 変更しない項目は null
        newLabelId: position == 2 ? newLabelId : null,
        ),
      ],);
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            // 余白
            SizedBox(height: 30.0.h.h),

            // 週タスク入力欄
            TasksView.checkbox(
              taskList: weeklyTaskList,
              // 保存処理
              saveTaskAuto: (int position, String newValue) =>
                  _saveTaskChanges(position: position, newTitle: newValue,),
              saveCheckAuto: (int position, bool newValue)  =>
                  _saveTaskChanges(position: position, newChecked: newValue,),
              // todo ラベル化処理（2026/06/11）＞＞
              saveAdditionToLabelAuto: ,
              saveNewLabelAuto: (int position) {  },
              saveUnlabelAuto: (int position) {  },
            ),

            // 余白
            SizedBox(height: 30.0.h.h),

            // ボタンは縁をそろえて配置
            Padding(
              padding: EdgeInsets.all(4.0.r),
              child: Column(
                children: [
                  // 「ラベル化されたタスク一覧」ボタン
                  const LabeledTaskListButton(),
                  // 履歴ボタン
                  BottomButton.sync(
                    text: "履歴",
                    onPressedSync: () {
                      Navigator.of(context).pushWithUnfocus(
                        MaterialPageRoute(
                          builder: (context) =>
                              HistoryScreen(
                                  formatAtNavigation: TaskFormat.date),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // todo 週の終わりまで何日かを通知（2026/06/01）＞＞

  /// データ全削除メソッド（デバッグ用）
  void _greatReset() {}
}
