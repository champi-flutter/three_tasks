import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/bottom_button.dart';
import 'package:three_tasks/view/specific_widgets/tasks_view.dart';
import 'package:three_tasks/view_controller/task_check_editing_controller.dart';
import 'package:three_tasks/view_controller/task_label_editing_controller.dart';
import 'package:three_tasks/view_controller/task_title_editing_controller.dart';

class DraftSavingButton extends ConsumerWidget {
  const DraftSavingButton({
    super.key,
    required this.isValid,
    required this.taskState,
    required this.tasksViewStyle,
    required this.saveTitle,
    required this.saveCheck,
  }) : assert(
          tasksViewStyle == TasksViewStyle.icon || saveCheck != null,
          "チェックボックス変更の更新処理の記述がありません。（DraftSavingButton）",
        );

  final bool isValid;

  /// 対象の [VTask] のリスト
  final TaskList<VTask> taskState;

  final TasksViewStyle tasksViewStyle;

  final Future<void> Function({
    required int position,
    required String newValue,
  }) saveTitle;

  final Future<void> Function({
    required int position,
    required bool newValue,
  })? saveCheck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomButton.async(
      text: "下書き保存",
      isValid: isValid,
      onPressedAsync: () async {
        // todo 下書き保存ロジック（2026/09/25）＞＞
      },
    );
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
