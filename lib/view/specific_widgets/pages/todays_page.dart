import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/presentation/view_model/daily_tasks_view_model/daily_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/screens/history_screen.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/label_list_button.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_page_base.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';

class TodaysPage extends TaskPageBase {

  TodaysPage({
    required this.pageIndex,
    required this.scopeToken,
  });

  @override
  final String title = "今日のタスク";

  @override
  final String shortTitle = "今日";

  @override
  final TaskRec rec = TaskRec.day;

  @override
  final int pageIndex;

  final Token scopeToken;

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // VMを監視
    final dailyTasksViewModelState =
    ref.watch(dailyTasksViewModelProvider.select((state) => state[today]));

    // ローディング表示は riverpod_wrapper の LoadingService に任せるので、
    // `.when` は使わず、 `.data` を直接参照する
    final TaskList<VDailyTask> taskState = dailyTasksViewModelState.data;

    // 自動保存オンオフを監視する
    final bool willAutoSave = ref.watch(pageSettingsViewModelProvider.select((state)=>state.data[pageIndex].autoSave));

    return SingleChildScrollView(
      child: Center(
        // todo （2026/05/27）＞＞
        child: kDebugMode
            ? Container()
            : Column(
          children: [
            // 余白
            SizedBox(height: 30.0.h.h),

            // 「今日のタスク」欄
            TasksView.checkbox(
              taskState: taskState,
              willAutoSave: willAutoSave,
              scopeToken: scopeToken,
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
                    willAutoSave: willAutoSave,
                  ),
                  // 履歴ボタン
                  BottomButton.sync(
                    text: "履歴",
                    onPressedSync: () {
                      Navigator.of(context).pushWithUnfocus(
                        MaterialPageRoute(
                          builder: (context) => HistoryScreen(
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

/// printメソッド [todays_page.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[todays_page.dart]　" + s1);
    if (s2 != null) print("[todays_page.dart]　" + s2);
    if (s3 != null) print("[todays_page.dart]　" + s3);
    if (s4 != null) print("[todays_page.dart]　" + s4);
    if (s5 != null) print("[todays_page.dart]　" + s5);
    print("");
  }
}
