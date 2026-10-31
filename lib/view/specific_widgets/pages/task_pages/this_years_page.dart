import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/presentation/view_model/yearly_tasks_view_model/yearly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/pages/screens/history_screen.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/draft_saving_button.dart';
import 'package:three_tasks/view/specific_widgets/label_list_button.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/task_page_base.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';

class ThisYearsPage extends TaskPageBase {

  ThisYearsPage({
    required this.pageIndex,
    required this.scopeToken,
  });

  @override
  final String title = "今年のタスク";

  @override
  final String shortTitle = "今年";

  @override
  final String previousShortTitle = "去年";

  @override
  final TaskRec rec = TaskRec.year;

  @override
  final int pageIndex;

  /// このページの管理元のスコープの [Token]
  final Token scopeToken;

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // VMを監視
    final yearlyTasksViewModelState =
    ref.watch(yearlyTasksViewModelProvider.select((state) => state[thisYear]));

    // ローディング表示は riverpod_wrapper の LoadingService に任せるので、
    // `.when` は使わず、 `.data` を直接参照する
    final TaskList<VYearlyTask> taskState = yearlyTasksViewModelState.data;

    // 自動保存オンオフを監視する
    final bool willAutoSave = ref.watch(pageSettingsViewModelProvider.select((state)=>state.data[pageIndex].autoSave));

    // 現在表示している画面に、未保存の編集があるかどうか
    final isEdited = ref.watch(editViewModelProvider(scopeToken));

    return SingleChildScrollView(
      child: Center(
        // todo （2026/05/27）＞＞
        child: kDebugMode
            ? Container()
            : Column(
          children: [
            // 余白
            SizedBox(height: 30.0.h.h),

            // 「今年のタスク」欄
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
                  // 「上書き保存」ボタン
                  DraftSavingButton(
                    // 自動保存オフかつ、編集未保存の場合にのみ有効
                    isValid: isEdited && !willAutoSave,
                    taskState: taskState,
                    tasksViewStyle: TasksViewStyle.checkbox,
                    scopeToken: scopeToken,
                  ),
                  // 「ラベル化されたタスク一覧」ボタン
                  LabelListButton(
                    taskState: taskState,
                    willAutoSave: willAutoSave,
                    scopeToken: scopeToken,
                  ),
                  // 履歴ボタン
                  BottomButton.sync(
                    text: "履歴",
                    onPressedSync: () {
                      Navigator.of(context).pushWithUnfocus(
                        MaterialPageRoute(
                          builder: (context) => HistoryScreen(
                              formatAtNavigation: TaskFormat.year),
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

/// printメソッド [this_years_page.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[this_years_page.dart]　" + s1);
    if (s2 != null) print("[this_years_page.dart]　" + s2);
    if (s3 != null) print("[this_years_page.dart]　" + s3);
    if (s4 != null) print("[this_years_page.dart]　" + s4);
    if (s5 != null) print("[this_years_page.dart]　" + s5);
    print("");
  }
}
