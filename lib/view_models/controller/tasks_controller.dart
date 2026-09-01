import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/keep_as_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';

class TasksController {
  TasksController({
    required SaveTaskChangesUseCase saveTaskChangesUseCase,
    required KeepAsDraftUseCase keepAsDraftUseCase, required DiscardDraftUseCase discardDraftUseCase,
  })
      : _discardDraftUseCase = discardDraftUseCase,
        _keepAsDraftUseCase = keepAsDraftUseCase,
        _saveTaskChangesUseCase = saveTaskChangesUseCase;

  /// タスク変更保存フローへのアクセス
  final SaveTaskChangesUseCase _saveTaskChangesUseCase;

  /// タスク下書きフローへのアクセス
  final KeepAsDraftUseCase _keepAsDraftUseCase;

  /// 下書き破棄フローへのアクセス
  final DiscardDraftUseCase _discardDraftUseCase;

  /// タスク変更保存フローを開始する
  Future<void> saveTaskChanges({
    required List<TaskUpdateParameter> taskInfo,
  }) async {
    await _saveTaskChangesUseCase.execute(taskInfo: taskInfo);
  }

  /// タスクを下書きとして保有する
  Future<void> keepAsDraft({
    required List<TaskUpdateParameter> taskInfo,
  }) async {
    await _keepAsDraftUseCase.execute(taskInfo: taskInfo);
  }

  /// 下書きを破棄する
  Future<void> discardDraft({required VTask task}) async {
    await _discardDraftUseCase.execute(task: task);
  }
}
