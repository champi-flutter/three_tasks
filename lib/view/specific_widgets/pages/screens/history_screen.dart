import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/presentation_providers/controller_providers.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/main.dart';
import 'package:io/io.dart';
import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/presentation/view_model/daily_tasks_view_model/daily_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/monthly_tasks_view_model/monthly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/weekly_tasks_view_model/weekly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/yearly_tasks_view_model/yearly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/common_design/common_scaffold.dart';

int _interstitialStackForHistoryScreen = 0;

int get interstitialStackForHistoryScreen => _interstitialStackForHistoryScreen;

class HistoryScreen extends HookConsumerWidget {

  HistoryScreen({required this.initialFormat});

  final DateFormat _dateFormat = DateFormat("yyyy年MM月dd日");
  final DateFormat _monthFormat = DateFormat("yyyy年MM月");
  final DateFormat _yearFormat = DateFormat("yyyy年");

  final TaskRec initialFormat;

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // カレンダーが現在参照している日付（DateTime）
    final targetDay = useState<DateTime>(DateTime.now());

    // 未来の日付かどうか
    final bool isFuture = targetDay.value.isDateAfter(DateTime.now());

    // カレンダー下の Widget タップ時に変更されるフォーマット
    final taskFormat = useState<TaskRec>(initialFormat);

    // taskFormat に応じた VM を監視する
    final LazyViewState<TaskList<VTask>> lazyTaskState =
        switch (taskFormat.value) {
      TaskRec.day => ref.watch(dailyTasksViewModelProvider
          .select((state) => state[isFuture?targetDay.value.toDate():today])),
      TaskRec.week => ref.watch(weeklyTasksViewModelProvider
          .select((state) => state[isFuture?targetDay.value.toDate():today])),
      TaskRec.month => ref.watch(monthlyTasksViewModelProvider
          .select((state) => state[isFuture?Month.fromDateTime(targetDay.value):thisMonth])),
      TaskRec.year => ref.watch(yearlyTasksViewModelProvider
          .select((state) => state[isFuture?targetDay.value.year:thisYear])),
    };

    // todo フォーマット変更メソッド
    Future<void> _changeFormat() async {
      await showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              children: [
                SizedBox(
                  height: 240.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: TaskRec.values.map<Widget>((rec) {
                      // 各 enum に応じたラベルテキストを設定
                      final String label = switch (rec) {
                        TaskRec.day => "1日のタスク",
                        TaskRec.week => "1週間のタスク",
                        TaskRec.month => "1ヶ月のタスク",
                        TaskRec.year => "1年間のタスク",
                      };
                      return SizedBox(
                        width: double.infinity,
                        height: 45.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ElevatedButton(
                            onPressed: taskFormat.value != rec
                                ? () {
                                    // _canChangeCheck = false;
                                    taskFormat.value = rec;
                                    // このダイアログをとじる
                                    Navigator.pop(context);
                                  }
                                : null,
                            child: UtilizedText(
                              label,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          });
    }

    return SafeArea(
      child: CommonScaffold(
        title: "履歴",
        // todo body
        body: lazyTaskState.when(
          // todo 未来をどう管理するか（2026/10/31）＞＞
          onReceived: (taskState) {
            final headTask = taskState[0].value;
            final String formattedDate = (headTask.id < 0)
                ? "non-value"
                : switch (headTask) {
                    // region switch
                    VDailyTask() =>
                      "${_dateFormat.format(targetDay.value)} のタスク",
                    VWeeklyTask() =>
                      "${_dateFormat.format(targetDay.value)} の週タスク",
                    VMonthlyTask() =>
                      "${_monthFormat.format(targetDay.value)} のタスク",
                    VYearlyTask() =>
                      "${_yearFormat.format(targetDay.value)} のタスク",
                    // endregion
                  };
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // カレンダー
                        SizedBox(
                          height: 450.h.h,
                          child: _TaskHistoryCalendar(
                            targetDay: targetDay.value,
                            onChangedTo: (DateTime focusedDay) {
                              targetDay.value = focusedDay;
                            },
                          ),
                        ),
                        // 年月日の表示
                        Padding(
                          padding: EdgeInsets.all(10.0.r),
                          child: TemplateButton(
                            text: formattedDate,
                            fontSize: 17,
                            buttonHeight: 50.h,
                            buttonWidth: 290.w,
                            onPressed: () async => await _changeFormat(),
                            borderRadius: BorderRadius.circular(8),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            textColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        // targetDay のタスクの情報
                        _TaskInfoSection(taskState: taskState),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          onLoading: (placeholder) {
            return Container();
          },
          // エラーや例外が発生した場合は、NotificationView（riverpod_wrapper）
          // で表示される
          onError: (placeholder, _) {
            return Container();
          },
        ),
      ),
    );
  }
}

/// 「履歴」画面のカレンダー部分
class _TaskHistoryCalendar extends HookConsumerWidget {
  const _TaskHistoryCalendar({
    super.key,
    required this.targetDay,
    required this.onChangedTo,
  });

  /// 現在参照している日付
  final DateTime targetDay;

  /// `focusedDay` に変更した際の処理
  final void Function(DateTime focusedDay) onChangedTo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final targetDay = useState(DateTime.now());

    return TableCalendar(
      shouldFillViewport: true,
      // デフォルトのフォーマットボタンは無効
      headerStyle: HeaderStyle(formatButtonVisible: false),
      focusedDay: targetDay,
      // currentDay: targetDay.value,
      // custom_core_types.dart と table_calendar に同名の関数が存在
      selectedDayPredicate: (day) => day.isSameDateAs(targetDay),
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      onDaySelected: (
        selectedDay,
        focusedDay,
      ) {
        onChangedTo(focusedDay);
      },
      // 手動で左右にスワイプして月を切り替えた時にも targetDay を同期させる
      onPageChanged: (focusedDay) {
        onChangedTo(focusedDay);
      },
    );
  }
}

/// 「履歴」画面のタスク情報欄
class _TaskInfoSection extends HookConsumerWidget {
  const _TaskInfoSection({super.key, required this.taskState});

  final TaskList<VTask> taskState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Token historyScreenToken = ref.generateToken();

    final canChangeCheck = useState<bool>(false);

    return Column(
      children: taskState.map<Widget>((taskEntry) {
        final position = taskEntry.index;
        final vTask = taskEntry.value;

        // 3点リーダの Popupボタン
        final Widget ellipsis = PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: UtilizedText(
                  "クリップボードにコピー",
                  fontSize: 16,
                ),
                onTap: () async {
                  // ClipboardService を呼び出す
                  await ref.read(clipboardServiceProvider).copyToClipboard(
                        vTask.title,
                      );
                  // 通知機能を呼び出す
                  ref.read(notificationServiceProvider).notifyInfo(
                        type: NotificationType.confirm,
                        notification: "クリップボードにコピーしました",
                      );
                },
              ),
              PopupMenuItem(
                child: UtilizedText(
                  "タスクのレビュー",
                  fontSize: 16,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        children: [
                          Card(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              title: UtilizedText(
                                "結果",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              // 内容
                              subtitle: UtilizedText(
                                vTask.review.result ?? "non-value",
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              title: UtilizedText(
                                "次回の方針",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              // 内容
                              subtitle: UtilizedText(
                                vTask.review.next ?? "non-value",
                                fontSize: 14,
                              ),
                            ),
                          ),
                          // ×（戻る）ボタン
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: FloatingActionButton(
                                mini: true,
                                onPressed: () => Navigator.pop(context),
                                child: const Icon(Icons.clear),
                                elevation: 2,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ];
          },
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: UtilizedText(
              vTask.title,
              fontSize: 14,
            ),
            value: vTask.isChecked,

            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialogTemplate(
                    title: "確認",
                    content: "過去のタスクを達成を変更してもいいですか？",
                    actionStyle: ActionStyle.yesNo,
                    yesAction: (){
                      canChangeCheck.value = true;
                    },
                  ),
                );
              }

              if (canChangeCheck.value) {
                // この画面のトークンでコントローラを呼び出し、変更を伝える
                await ref
                    .read(tasksControllerProvider(historyScreenToken))
                    .controlTask(
                      willAutoSave: true,
                      taskState: taskState,
                      position: position,
                      parameter: TaskControlParameter(
                        newChecked: newValue,
                      ),
                    );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            // 3点リーダ
            secondary: ellipsis,
          ),
        );
      }).toList(),
    );
    ;
  }
}
