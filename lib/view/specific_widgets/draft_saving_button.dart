import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/presentation_providers/controller_providers.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';

enum _ButtonType { primary, review }

/// 「上書き保存」ボタン
class DraftSavingButton extends ConsumerWidget {
  /// タスクを保存するコンストラクタ
  const DraftSavingButton.primary({
    super.key,
    required this.isValid,
    required this.taskState,
    // required this.tasksViewStyle,
    required this.scopeToken,
  }) : _type = _ButtonType.primary;

  /// レビューを保存するコンストラクタ
  const DraftSavingButton.review({
    super.key,
    required this.isValid,
    required this.taskState,
    // required this.tasksViewStyle,
    required this.scopeToken,
  }) : _type = _ButtonType.review;

  /// このボタンが有効かどうか
  final bool isValid;

  /// 対象の [VTask] のリスト
  final TaskList<VTask> taskState;

  // /// このボタンがあるページの [TasksView] の表示形式
  // final TasksViewStyle tasksViewStyle;

  /// このボタンがあるページの管理元のスコープの [Token]
  final Token scopeToken;

  final _ButtonType _type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch(_type){
      _ButtonType.primary =>
          BottomButton.async(
            text: "上書き保存",
            isValid: isValid,
            onPressedAsync: () async {
              // タスクの下書きを保存する
              await ref.read(tasksControllerProvider(scopeToken)).saveCurrent(
                taskState: taskState,
              );
              // ラベルの変更の下書きを保存する
              await ref.read(labelsControllerProvider(scopeToken)).saveDraft();
            },
          ),
      _ButtonType.review =>
          TextButton(
            child: UtilizedText("保存", fontSize: 18,),
            onPressed: () async {
              // レビューの下書きを保存する
              await ref.read(reviewControllerProvider(scopeToken)).saveCurrent(
                taskState: taskState,
              );
            },
          ),
    };
  }
}

/// printメソッド [draft_saving_button.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[draft_saving_button.dart]　" + s1);
    if (s2 != null) print("[draft_saving_button.dart]　" + s2);
    if (s3 != null) print("[draft_saving_button.dart]　" + s3);
    if (s4 != null) print("[draft_saving_button.dart]　" + s4);
    if (s5 != null) print("[draft_saving_button.dart]　" + s5);
    print("");
  }
}
