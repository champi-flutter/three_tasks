import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/presentation/view_model/weekly_tasks_view_model/weekly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/label_list_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'history_screen.dart';

// // 週の初め
// int _firstDay = 0;
//
// int get firstDay => _firstDay;
//
// int _firstWeekday = 0;
//
// int get firstWeekday => _firstWeekday;

class WeeklyTasksScreen extends HookConsumerWidget {
  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // VM のデータの、当日の分を監視する
    final weeklyTasksViewModelState = ref.watch(
        weeklyTasksViewModelProvider.select((state) => state[today]));

    // ローディング表示は riverpod_wrapper の LoadingService に任せるので、
    // `.when` は使わず、 `.data` を直接参照する
    final TaskList<VWeeklyTask> taskState = weeklyTasksViewModelState.data;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            // 余白
            SizedBox(height: 30.0.h.h),

            // 週タスク入力欄
            TasksView.checkbox(
              taskState: taskState,
              // todo isAutoSave（2026/09/29）＞＞
              isAutoSave: isAutoSave,
            ),

            // 余白
            SizedBox(height: 30.0.h.h),

            // ボタンは縁をそろえて配置
            Padding(
              padding: EdgeInsets.all(4.0.r),
              child: Column(
                children: [
                  // 「ラベル化されたタスク一覧」ボタン
                  LabelListButton(
                    taskState: taskState,
                    isAutoSave: isAutoSave,
                  ),
                  // fixme 履歴ボタン
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
