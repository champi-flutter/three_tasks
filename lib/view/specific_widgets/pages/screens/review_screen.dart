import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/presentation_providers/controller_providers.dart';
import 'package:three_tasks/presentation/controller/dto/review_control_parameter/review_control_parameter.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/buttons/auto_save_switch.dart';
import 'package:three_tasks/view/specific_widgets/common_design/common_scaffold.dart';
import 'package:three_tasks/view/specific_widgets/draft_saving_button.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/page_list.dart';

// enum ReviewStatus { date, week, month, year }
//
// enum TimeStatus { now, previous }
//
// bool _isEditedReview = false;
//
// get isEditedReview => _isEditedReview;

/// レビュー画面
class ReviewScreen extends ConsumerWidget {

  const ReviewScreen({
    required this.controlledPageIndex,
  });

  /// レビューする対象のタスクのページのインデックス
  final int controlledPageIndex;

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // この画面のスコープの Token
    final Token reviewScreenToken = ref.generateToken();

    // この画面に未保存の編集があるかどうか
    final isEdited = ref.watch(editViewModelProvider(reviewScreenToken));

    // PageSettingsViewModel を監視する
    final settingsVMState = ref.watch(pageSettingsViewModelProvider);

    return settingsVMState.when(
      onReceived: (setting) {
        final bool willAutoSave = setting[controlledPageIndex].reviewAutoSaves;
        final lazyTaskState = watchTaskStateOnCurrentPage(
          ref,
          pageIndex: controlledPageIndex,
        );
        return lazyTaskState.when(
          onReceived: (taskState) {
            return UnfocusTapScrimScope(
              child: SafeArea(
                child: AlertUnsavedScope(
                  scopeToken: reviewScreenToken,
                  // 自動保存オフのとき、アラートを有効にする
                  isAlertValid: !willAutoSave && isEdited,
                  child: CommonScaffold(
                    title: "レビュー",
                    appBarActions: [
                      // 「保存」ボタン
                      DraftSavingButton.review(
                        // 自動保存オフかつ未保存編集存在時のみ有効
                        isValid: !willAutoSave && isEdited,
                        taskState: taskState,
                        scopeToken: reviewScreenToken,
                      ),
                      // 自動保存オンオフスイッチ
                      AutoSaveSwitch.review(
                        pageIndex: controlledPageIndex,
                        // スイッチ切り替え時の保存処理
                        onSwitched: (bool value) async {
                          // 自動保存オフ => オン の場合
                          if (value) {
                            // // 現在のページが参照しているタスク VM の state を ref.read で
                            // // 一度だけ取得する
                            // final taskState = getTaskStateOnCurrentPage(
                            //   ref,
                            //   pageIndex: controlledPageIndex,
                            // );
                            // レビューの下書きを保存する
                            await ref.read(
                                reviewControllerProvider(reviewScreenToken))
                                .saveCurrent(taskState: taskState,
                            );
                          }
                          // 自動保存オン => オフ の場合
                          else {
                            // 追加の処理はなし
                          }
                        },
                      ),
                    ],

                    // todo レビュー画面の body（2026/10/26）＞＞
                    body: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            // 余白
                            SizedBox(height: 20.0.h),

                            // レビュー入力欄
                            _ReviewBody(
                              controlledPageIndex: controlledPageIndex,
                              scopeToken: reviewScreenToken,
                              willAutoSave: willAutoSave,
                              taskState: taskState,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
    );
  }

  // // todo 「履歴を参照」ボタン
  // Widget _referButton() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         minimumSize: Size(double.infinity, 90.h),
  //       ),
  //       onPressed: () async {
  //         // _focusNode
  //         //   ..[0].unfocus()
  //         //   ..[1].unfocus()
  //         //   ..[2].unfocus();
  //         _focusNode.unfocus();
  //         await Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>
  //                 HistoryScreen(formatAtNavigation: TaskFormat.date),
  //           ),
  //         );
  //       },
  //       child: Text(
  //         "履歴を参照",
  //         style: TextStyle(
  //           fontSize: 25.0.sp,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

/// レビュー入力欄
class _ReviewBody extends ConsumerWidget {
  const _ReviewBody({
    super.key,
    required this.controlledPageIndex,
    required this.scopeToken,
    required this.willAutoSave,
    required this.taskState,
  });

  /// レビューする対象のタスクのページのインデックス
  final int controlledPageIndex;

  /// このスコープの [Token]
  final Token scopeToken;

  /// 自動保存オンオフ
  final bool willAutoSave;

  final TaskList<VTask> taskState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, position) {
        final String taskTitle = taskState[position].value.title;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: ListTile(
            title: UtilizedText(
              "・$taskTitle",
              fontSize: 15.0,
            ),
            subtitle: Column(
              children: [
                // 結果
                _ResultForm(
                  scopeToken: scopeToken,
                  vTask: taskState[position].value,
                  onTextEdited: ({String? newValue}) async {
                    await ref.read(reviewControllerProvider(scopeToken))
                        .controlReview(
                      willAutoSave: willAutoSave,
                      taskState: taskState,
                      position: position,
                      parameter: ReviewControlParameter(result: newValue,),
                    );
                  },
                ),
                // 次回の方針
                _NextForm(
                  scopeToken: scopeToken,
                  vTask: taskState[position].value,
                  onTextEdited: ({String? newValue}) async {
                    await ref.read(reviewControllerProvider(scopeToken))
                        .controlReview(
                      willAutoSave: willAutoSave,
                      taskState: taskState,
                      position: position,
                      parameter: ReviewControlParameter(result: newValue,),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ReviewFormBase extends ConsumerWidget {
  const _ReviewFormBase({
    super.key,
    required this.scopeToken,
    required this.onTextEdited,
    required this.oldValue,
    required this.formName,
  });

  /// このスコープの [Token]
  final Token scopeToken;

  /// 自動保存オン時の、各タスクの入力値の自動保存ロジック
  final Future<void> Function({
  String? newValue,
  }) onTextEdited;

  /// ビルド時点での対象の値
  final String oldValue;

  /// このフォームの名前
  final String formName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 入力欄からフォーカスが外れた際のコールバック
    Future<void> _onUnfocused(String textSnapshot) async {
      // _print(
      //   "フォーカスが解除された際に、そのときの入力値を保存",
      //   "保存される入力値: ${textSnapshot}",
      // );
      // 最後に保存した値から変化しているかどうか
      final bool isChanged = textSnapshot != oldValue;
      // 自動保存オンのときの保存処理
      if (isChanged) {
        await onTextEdited(newValue: textSnapshot);
      }
    }

    // TextEditingController と FocusNode の管理元
    final TextFocusController textFocusController =
    useTextFocusController(onUnfocused: _onUnfocused);
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.r),
        title: UtilizedText(
          formName,
          fontSize: 18.0.sp,
          fontWeight: FontWeight.bold,
        ),
        subtitle: TextField(
          style: TextStyle(fontSize: 14.5.sp),
          // 複数行入力を可能にする
          keyboardType: TextInputType.multiline,
          // 行数制限をなくし、自動で縦に伸びるようにする
          maxLines: null,
          // エンターキーで改行
          textInputAction: TextInputAction.newline,
          controller: textFocusController.controller,
          // // エンターキー等で、入力完了によってフォーカスが外れるようにする
          // onSubmitted: (_) {
          //   textFocusController.focusNode.unfocus();
          // },
          // 入力欄に文字を入力したときに、編集未保存フラグを立てる。
          onChanged: (String value) {
            ref.read(editControllerProvider(scopeToken)).notifyEdited();
          },
          // 確定ボタン
          decoration: InputDecoration(
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 4.w, bottom: 4.h),
                  child: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      // 次のTextFieldに移るロジックなど
                      textFocusController.focusNode.unfocus();
                    },
                    // 矩形（角丸）
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      backgroundColor: Theme
                          .of(context)
                          .primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      color: Colors.white54,
    );
  }
}

/// 「結果」フォーム
class _ResultForm extends ConsumerWidget {
  const _ResultForm({
    super.key,
    required this.scopeToken,
    required this.vTask,
    required this.onTextEdited,
  });

  final VTask vTask;

  /// このスコープの [Token]
  final Token scopeToken;

  /// 自動保存オン時の、各タスクの入力値の自動保存ロジック
  final Future<void> Function({
  String? newValue,
  }) onTextEdited;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ReviewFormBase(
      scopeToken: scopeToken,
      onTextEdited: onTextEdited,
      oldValue: vTask.review.result ?? "",
      formName: "結果",
    );
  }
}

/// 「次回の方針」フォーム
class _NextForm extends ConsumerWidget {
  const _NextForm({
    super.key,
    required this.scopeToken,
    required this.vTask,
    required this.onTextEdited,
  });

  final VTask vTask;

  /// このスコープの [Token]
  final Token scopeToken;

  /// 自動保存オン時の、各タスクの入力値の自動保存ロジック
  final Future<void> Function({
  String? newValue,
  }) onTextEdited;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ReviewFormBase(
      scopeToken: scopeToken,
      onTextEdited: onTextEdited,
      oldValue: vTask.review.next ?? "",
      formName: "次回の方針",
    );
  }
}
