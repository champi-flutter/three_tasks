import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_label/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/draft_saving_button.dart';
import 'package:three_tasks/view/specific_widgets/labeled_task_list_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'package:three_tasks/view_controller/task_label_editing_controller.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';
import 'package:three_tasks/view_models/tomorrows_view_model.dart';

import 'history_screen.dart';

class TomorrowsScreen extends HookConsumerWidget {

  const TomorrowsScreen({super.key});

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 「明日のタスク」のリスト
    final List<VDayTask> tomorrowsTaskList = ref.watch(
        tomorrowsViewModelProvider);
    // 現在表示している画面に、未保存の編集があるかどうか
    final isEdited = ref.watch(editSavingControllerProvider);
    // 自動保存のオンオフ状態を管理
    final isAutoSaveEnabled = useState<bool>(false);
    // 主要なWidgetの背景など
    final Color widgetColor = Theme
        .of(context)
        .colorScheme
        .primary;
    // 主要なWidget内の文字、アイコンなど
    final Color textColor = Theme
        .of(context)
        .colorScheme
        .primary;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 自動保存オンオフ
          Align(
            alignment: AlignmentGeometry.topRight,
            child: Row(
              children: [
                const UtilizedText(
                  "自動保存",
                  fontSize: 18,
                ),
                SizedBox(width: 4.w),
                // オンオフスイッチ本体
                OnOffSwitch.onWhite(
                  state: isAutoSaveEnabled.value,
                  onChanged: (bool value) {
                    isAutoSaveEnabled.value = value;
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                // 余白
                SizedBox(height: 30.0.h),

                // 明日のタスク
                // 未来のタスクなので、チェックボックスはなし
                TasksView.icon(
                  taskList: tomorrowsTaskList,
                  saveTaskAuto: isAutoSaveEnabled.value ?
                      (int position, String newValue) async {
                    // 入力値の保存をVMに依頼
                    await ref.read(
                        tomorrowsViewModelProvider.notifier).saveTasks(
                        newTaskMap: {
                          tomorrowsTaskList[position]: newValue,
                        });
                  }
                  // 保存を「下書き保存」ボタンで行う場合
                      : null,
                  // ラベル化処理（自動保存）
                  saveNewLabelAuto: isAutoSaveEnabled.value
                      ? (int position) async {
                    // ラベル化タスク VM をイベントハンドラとして参照
                    final readLabeledTasksVM =
                    ref.read(labeledTasksViewModelProvider.notifier);
                    // ラベル化の登録を依頼
                    // 例外が発生した場合は、 0 を返す
                    return await readLabeledTasksVM.labeling(
                        vTask: tomorrowsTaskList[position]) ??
                        0;
                  } : null,
                  // ラベル化処理（自動保存）
                  saveAdditionToLabelAuto: isAutoSaveEnabled.value ?
                      (int position, int newLabelId) async {
                    // ラベル化タスク VM をイベントハンドラとして参照
                    final readLabeledTasksVM =
                    ref.read(labeledTasksViewModelProvider.notifier);
                    // 既存のラベルに追加する処理を外注
                    await readLabeledTasksVM.addToLabel(
                      vTask: tomorrowsTaskList[position],
                      labelId: newLabelId,
                    );
                  } : null,
                  // ラベル化処理（自動保存）
                  saveUnlabelAuto: isAutoSaveEnabled.value ? (
                      int position) async {
                    // ラベル化タスク VM をイベントハンドラとして参照
                    final readLabeledTasksVM =
                    ref.read(labeledTasksViewModelProvider.notifier);
                    // 既存のラベルに追加する処理を外注
                    await readLabeledTasksVM.unlabeling(
                      vTask: tomorrowsTaskList[position],
                    );
                  } : null,
                ),

                // 余白
                SizedBox(height: 30.0.h),

                // ボタンは揃えて配置
                Padding(
                  padding: EdgeInsets.all(4.0.r),
                  child: Column(
                    children: [
                      // 「下書き保存」ボタン
                      DraftSavingButton(
                        // 自動保存オフかつ、編集未保存の場合にのみ有効
                        isValid: isEdited && !isAutoSaveEnabled.value,
                        taskList: tomorrowsTaskList,
                        tasksViewStyle: TasksViewStyle.icon,
                        saveTitle: ({
                          required int position,
                          required String newValue,
                        }) async {
                          // 翌日タスクのタイトルの保存を VM に依頼
                          await ref.read(
                              tomorrowsViewModelProvider.notifier)
                              .saveTasks(newTaskMap: {
                            tomorrowsTaskList[position]: newValue,
                          });
                        },
                        // 翌日タスクにチェックボックスはない
                        saveCheck: null,
                      ),

                      // 「ラベル化されたタスク一覧」ボタン
                      LabeledTaskListButton(
                        // タスクタイトルのリストに変換
                        taskTitleList: tomorrowsTaskList.map<String>((
                            VDayTask task) => task.task).toList(),
                        // 空欄の場所にラベル化タスクを当てはめる処理
                        onApplyLabeledTask: (int position,
                            VLabeledTask labeledTask) async {

                        },
                        onReplaceLabeledTask:,
                      ),

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
        ],
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
