import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/keep_as_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/view_models/controller/dto/task_control_parameter/converter/set_new_e_task.dart';
import 'package:three_tasks/view_models/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';
class TasksController {
  TasksController({
    required SaveTaskChangesUseCase saveTaskChangesUseCase,
    required KeepAsDraftUseCase keepAsDraftUseCase,
    required DiscardDraftUseCase discardDraftUseCase,
  })  : _discardDraftUseCase = discardDraftUseCase,
        _keepAsDraftUseCase = keepAsDraftUseCase,
        _saveTaskChangesUseCase = saveTaskChangesUseCase;

  /// タスク変更保存フローへのアクセス
  final SaveTaskChangesUseCase _saveTaskChangesUseCase;

  /// タスク下書きフローへのアクセス
  final KeepAsDraftUseCase _keepAsDraftUseCase;

  /// 下書き破棄フローへのアクセス
  final DiscardDraftUseCase _discardDraftUseCase;

  /// タスク変更パラメータを指定してタスク変更保存フロー（[SaveTaskChangesUseCase]）
  /// を呼び出す
  Future<void> saveTaskChanges({
    required List<TaskControlParameter> controlInfo,
  })
  // 折りたたみ用
  async {
    // [TaskControlParameter] から ETask 型の新しいデータに変換する
    final TaskList<ETask> updateInfo = controlInfo
        .map<ETask>(SetNewETask.toETask)
        .toListAs(TaskList<ETask>.fromIterable);
    // SaveTaskChangesUseCase を起動する
    await _saveTaskChangesUseCase.execute(updatedETaskList: updateInfo);
  }

  /// 現時点でのタスクの View State でタスク変更保存フローを呼び出す
  Future<void> saveTaskInfo({required TaskList<VTask> taskInfo}) async {
    final TaskList<ETask> eTaskList = taskInfo
        .mapValues(ToETask.toETask<VTask>)
        .toListAs(TaskList<ETask>.fromIterable);
    await _saveTaskChangesUseCase.execute(updatedETaskList: eTaskList);
  }

  /// タスクを下書きとして保有する
  Future<void> keepAsDraft({
    required List<TaskControlParameter> controlInfo,
  })
  // 折りたたみ用
  async {
    // [TaskControlParameter] から ETask 型の新しいデータに変換する
    final List<ETask> updateInfo = controlInfo
        .map<ETask>(SetNewETask.toETask)
        .toList();
    await _keepAsDraftUseCase.execute(taskInfo: updateInfo);
  }

  /// 下書きを破棄する
  Future<void> discardDraft({required TaskRec taskRec}) =>
      _discardDraftUseCase.execute(taskRec: taskRec);
}
