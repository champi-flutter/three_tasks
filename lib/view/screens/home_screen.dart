import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/view/screens/history_screen.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/labeled_task_list_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'package:three_tasks/view_models/labeled_tasks_view_model.dart';

import '../../view_models/todays_view_model.dart';

class HomeScreen extends ConsumerWidget {
  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // VMを監視
    final List<VDayTask> dayTaskList = ref.watch(
        todaysViewModelProvider);

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
                    taskList: dayTaskList,
                    // 保存処理
                    onSaveTask: (int position, String newValue) async {
                      // VM をイベントハンドラとして参照
                      final readTodaysVM = ref.read(
                          todaysViewModelProvider.notifier);
                      // 入力値の保存を依頼
                      await readTodaysVM.saveTask(
                        targetTask: dayTaskList[position],
                        newTitle: newValue,
                      );
                    },
                    onCheckChanged: (int position, bool newValue) async {
                      // VM をイベントハンドラとして参照
                      final readTodaysVM = ref.read(
                          todaysViewModelProvider.notifier);
                      // チェックの保存を依頼
                      await readTodaysVM.saveCheck(
                        targetTask: dayTaskList[position],
                        newValue: newValue,
                      );
                    },
                    // ラベル化処理
                    onLabeled: (int position, bool value) async {
                      // ラベル化タスク VM をイベントハンドラとして参照
                      final readLabeledTasksVM = ref.read(
                          labeledTasksViewModelProvider.notifier);
                      // ラベル化の登録を依頼
                      await readLabeledTasksVM.labeling(vTask: dayTaskList[position]);

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

/// タスク入力欄全体
class _TodaysTasksView extends StatelessWidget {
  const _TodaysTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 今日のタスク1
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
          child: _TaskField(position: 0),
        ),
        // 今日のタスク2
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
          child: _TaskField(position: 1),
        ),
        // 今日のタスク3
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
          child: _TaskField(position: 2),
        ),
      ],
    );
  }
}

/// 各タスク入力フィールド
class _TaskField extends HookConsumerWidget {
  const _TaskField({
    super.key,
    required this.position,
    // required this.initialValue,
  });

  /// タスクのリスト番号
  final int position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 当日のタスク（TodaysViewModel.state）を監視
    // VDayTask.task と VDayTask.isChecked は non-nullable
    final VDayTask dayTask = ref.watch(
      todaysViewModelProvider.select((state) => state[position]),
    );

    // タスクのコントローラ
    // この text の変更はリビルドのフラグにしない（フラグはフォーカスが外れたこと）
    final TextEditingController taskController =
        useNonReactiveTextController(text: dayTask.task);

    // チェックボックス
    final isChecked = useState<bool>(dayTask.isChecked);

    // この TextField のフォーカス
    final focusNode = useFocusNode();

    // フォーカスが外れたことをフラグに、その段階での入力値を保存する処理を起動するハンドラ
    void handleSave(String value) {
      // 文字列の長さが 0 なら早期リターン
      if (value.trim().isEmpty) return;
      ref
          .read(todaysViewModelProvider.notifier)
          .saveTask(targetTask: dayTask, newTitle: value);
    }

    // focusNode の状態を監視
    useEffect(() {
      // フォーカスが解除された際に、そのときの入力値を保存
      void listenUnfocused() {
        if (!focusNode.hasFocus) {
          _print(
            "フォーカスが解除された際に、そのときの入力値を保存",
            "保存される入力値: ${taskController.text}",
          );
          // build 内で定義された保存処理のハンドラ（クロージャ）
          handleSave(taskController.text);
        }
      }

      // リスナーを登録
      focusNode.addListener(listenUnfocused);
      // リスナーを破棄（クリーンアップ）
      return () => focusNode.removeListener(listenUnfocused);
    }, [focusNode]);

    // TextField への入力以外で入力欄に入れる値（第1引数）が変化した場合
    // （遅延初期化、データ元の変更、など）に対応
    ref.listen<String>(
      todaysViewModelProvider.select((selector) => selector[position].task),
      (previous, next) {
        if (taskController.text != next) {
          // 入力欄の値を更新
          taskController.text = next;
        }
      },
    );

    return CheckboxListTile(
      title: TextFieldTapRegion(
        // この領域の「外」がタップされたらフォーカスを外す
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        child: TextField(
          maxLines: null,
          decoration: InputDecoration(
            labelText: "タスク${position + 1}",
            // contentPadding: EdgeInsets.all(0),
          ),
          controller: taskController,
          style: TextStyle(fontSize: 17.0.sp),
          textInputAction: TextInputAction.done,
        ),
      ),
      value: isChecked.value,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        if (isChecked.value != value!) {
          isChecked.value = value;
          // チェックボックスの変更をDBに保存
          ref.read(todaysViewModelProvider.notifier).saveCheck(
                targetTask: dayTask,
                newValue: value,
              );
        }
      },
    );
  }
}

/// todo printメソッド [home_screen.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[home_screen.dart]　" + s1);
    if (s2 != null) print("[home_screen.dart]　" + s2);
    if (s3 != null) print("[home_screen.dart]　" + s3);
    if (s4 != null) print("[home_screen.dart]　" + s4);
    if (s5 != null) print("[home_screen.dart]　" + s5);
    print("");
  }
}
