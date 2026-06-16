import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/labeled_task_list_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'package:three_tasks/view_models/weekly_tasks_view_model.dart';
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
              onSaveTask: (int position, String newValue) async {
                // VM をイベントハンドラとして参照
                final readWeeklyTasksVM = ref.read(
                    weeklyTasksViewModelProvider.notifier);
                // 入力値の保存を依頼
                await readWeeklyTasksVM.saveTask(
                  targetTask: weeklyTaskList[position],
                  newTitle: newValue,
                );
              },
              onCheckChanged: (int position, bool newValue) async {
                // VM をイベントハンドラとして参照
                final readWeeklyTasksVM = ref.read(
                    weeklyTasksViewModelProvider.notifier);
                // チェックの保存を依頼
                await readWeeklyTasksVM.saveCheck(
                  targetTask: weeklyTaskList[position],
                  newValue: newValue,
                );
              },
              // todo ラベル化処理（2026/06/11）＞＞
              onLabeled: (int position, bool value) {

              },
              onJustEdited: ,
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
