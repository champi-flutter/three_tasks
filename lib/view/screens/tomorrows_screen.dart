import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/labeled_task_list_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'package:three_tasks/view_models/tomorrows_view_model.dart';

import 'history_screen.dart';

class TomorrowsScreen extends HookConsumerWidget {

  const TomorrowsScreen({super.key});

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<VDayTask> tomorrowsTaskList = ref.watch(
        tomorrowsViewModelProvider);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            // 余白
            SizedBox(height: 30.0.h.h),

            // 明日のタスク
            // 未来のタスクなので、チェックボックスはなし
            TasksView.icon(
              taskList: tomorrowsTaskList,
              // 保存は「下書き保存」ボタンで
              onSaveTask: null,
              // todo ラベル化処理（2026/06/11）＞＞
              onLabeled: (int position, bool value) async{},
              // 自動保存でない場合に編集が加わったフラグがたつ
              onJustEdited: ref.read(editSavingControllerProvider.notifier).onEdited,
            ),

            // 余白
            SizedBox(height: 30.0.h.h),

            // ボタンは揃えて配置
            Padding(
              padding: EdgeInsets.all(4.0.r),
              child: Column(
                children: [
                  // 「下書き保存」ボタン
                  BottomButton.async(
                    text: "下書き保存",
                    onPressedAsync: () async {
                      final Map<VDayTask, String> newTasks = {
                        for (VDayTask task in tomorrowsTaskList)
                          task: task.task,
                      };
                      // 翌日タスクの保存を VM に依頼
                      await ref.read(
                          tomorrowsViewModelProvider.notifier)
                          .saveTasks(newTaskMap: newTasks);
                      // ラッパー側の値を変化
                      ref.read(editSavingControllerProvider.notifier).onSaved();
                    },
                  ),

                  // 「ラベル化されたタスク一覧」ボタン
                  const LabeledTaskListButton(),

                  //「履歴を参照」ボタン
                  BottomButton.sync(
                    text: "履歴を参照",
                    onPressedSync: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              HistoryScreen(
                                  formatAtNavigation: TaskFormat
                                      .date),
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
}


/// printメソッド [tomorrows_screen.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[tomorrows_screen.dart]　" + s1);
    if (s2 != null) print("[tomorrows_screen.dart]　" + s2);
    if (s3 != null) print("[tomorrows_screen.dart]　" + s3);
    if (s4 != null) print("[tomorrows_screen.dart]　" + s4);
    if (s5 != null) print("[tomorrows_screen.dart]　" + s5);
    print("");
  }
}
