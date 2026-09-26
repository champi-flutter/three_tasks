import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/v_to_e_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/draft_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';

class TasksController {
  TasksController({
    required SaveTaskChangesUseCase saveTaskChangesUseCase,
    required SaveWeeklyTaskChangesUseCase saveWeeklyTaskChangesUseCase,
    required DraftTaskChangesUseCase draftTaskChangesUseCase,
    required DiscardDraftUseCase discardDraftUseCase,
    required EditController editController,
  })  : _discardDraftUseCase = discardDraftUseCase,
        _draftTaskChangesUseCase = draftTaskChangesUseCase,
        _saveTaskChangesUseCase = saveTaskChangesUseCase,
        _saveWeeklyTaskChangesUseCase = saveWeeklyTaskChangesUseCase,
        _editController = editController;

  /// タスク変更保存フローへのアクセス
  final SaveTaskChangesUseCase _saveTaskChangesUseCase;

  /// タスク変更保存フローへのアクセス
  final SaveWeeklyTaskChangesUseCase _saveWeeklyTaskChangesUseCase;

  /// タスク下書きフローへのアクセス
  final DraftTaskChangesUseCase _draftTaskChangesUseCase;

  /// 下書き破棄フローへのアクセス
  final DiscardDraftUseCase _discardDraftUseCase;

  /// 編集状態変更の呼び出し口
  final EditController _editController;

  /// タスク操作時のコールバック
  Future<void> controlTask({
    required bool isAutoSave,
    required TaskList<VTask> taskState,
    required int position,
    required TaskControlParameter parameter,
  })
      // 折りたたみ用
      =>
      isAutoSave
          ? _saveAt(
              position,
              state: taskState,
              parameter: parameter,
            )
          : _draftAt(
              position,
              state: taskState,
              parameter: parameter,
            );

  /// [TaskList] 中の指定 [position] のタスクの変更を保存する
  Future<void> _saveAt(
    int position, {
    required TaskList<VTask> state,
    required TaskControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // 編集未保存フラグをおろす
    _editController.notifySaved();
    // あとで TaskList<ETask> に当てはめるリスト
    final List<ETask> tempTaskList = [];
    // あとで WeeklyTaskList<EWeeklyTask> に当てはめるリスト
    final List<EWeeklyTask> tempWeeklyTaskList = [];
    // 渡された情報を tempTaskList （または tempWeeklyTaskList ）に当てはめるプロセス
    for (final ListEntry<VTask> vTaskEntry in state) {
      ETask eTask = VToETask.toETask(vTaskEntry.value);
      if (vTaskEntry.index == position) {
        eTask.update(
          newTitle: parameter.newTitle,
          newChecked: parameter.newChecked,
          newLabelId: parameter.newLabelId,
        );
      }
      // 週タスクの場合
      if (eTask is EWeeklyTask) {
        tempWeeklyTaskList.add(eTask);
      }
      // 週タスク以外の場合
      else {
        tempTaskList.add(eTask);
      }
    }

    // tempTaskList （または tempWeeklyTaskList ）を UseCase に渡す形に変換する
    // 週タスク以外の場合
    if (tempTaskList.length == 3) {
      final TaskList<ETask> updatingETaskList =
          TaskList.fromIterable(tempTaskList);
      // SaveTaskChangesUseCase を起動する
      await _saveTaskChangesUseCase.execute(
          updatingETaskList: updatingETaskList);
    }
    // 週タスクの場合
    else if (tempWeeklyTaskList.isNotEmpty) {
      // tempWeeklyList を WeeklyTaskList<EWeeklyTask> に適用する
      final WeeklyTaskList<EWeeklyTask> updatingETaskList =
          WeeklyTaskList.fromIterable(tempWeeklyTaskList);

      // SaveTaskChangesUseCase を起動する
      await _saveWeeklyTaskChangesUseCase.execute(
        updatingETaskList: updatingETaskList,
      );
    }
    // 必ず上の2つのどちらかになる
    else {
      // todo エラーハンドリング（2026/09/23）＞＞
    }
  }

  /// [TaskList] 中の指定 [position] のタスクの変更を下書きとして保留する
  Future<void> _draftAt(
    int position, {
    required TaskList<VTask> state,
    required TaskControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // 編集未保存フラグを立てる
    _editController.notifyEdited();
    // state をエンティティのリストに変換する（下書きは週タスクも TaskList で渡す）
    final TaskList<ETask> newDraft = state.map<ETask>((vTaskEntry) {
      // 一旦、state の各タスクをそのままエンティティに当てはめる
      ETask eTask = VToETask.toETask(vTaskEntry.value);
      // 指定 position なら、エンティティの値を更新する
      if (vTaskEntry.index == position) {
        eTask.update(
          newTitle: parameter.newTitle,
          newChecked: parameter.newChecked,
          newLabelId: parameter.newLabelId,
        );
      }
      return eTask;
    }).toListAs(TaskList<ETask>.fromIterable);

    // DraftTaskChangesUseCase を起動する
    await _draftTaskChangesUseCase.execute(draft: newDraft);
  }

  /// 現時点でのタスクの View State でタスク変更保存フローを呼び出す
  Future<void> saveCurrentState<VTaskType extends VTask>(
      {required TaskList<VTaskType> taskState}) async {
    // 週タスクの場合
    if (VTaskType is VWeeklyTask) {
      final WeeklyTaskList<EWeeklyTask> eTaskList = taskState
          .mapValues<EWeeklyTask>(
              (vTask) => VToETask.toEWeeklyTask(vTask as VWeeklyTask))
          .toListAs(WeeklyTaskList<EWeeklyTask>.fromIterable);

      eTaskList.removeWhere((eTaskEntry) => eTaskEntry.value.cannotReplace);
      await _saveWeeklyTaskChangesUseCase.execute(updatingETaskList: eTaskList);
    }
    // 週タスク以外の場合
    else {
      final TaskList<ETask> eTaskList = taskState
          .mapValues(VToETask.toETask)
          .toListAs(TaskList<ETask>.fromIterable);
      await _saveTaskChangesUseCase.execute(updatingETaskList: eTaskList);
    }
  }

  // /// タスク変更パラメータを指定してタスク変更保存フロー（[SaveTaskChangesUseCase]）
  // /// を呼び出す
  // Future<void> saveTaskChanges({
  //   required List<TaskControlParameter> controlInfo,
  // })
  // // 折りたたみ用
  // async {
  //   // [TaskControlParameter] から ETask 型の新しいデータに変換する
  //   final TaskList<ETask> updateInfo = controlInfo
  //       .map<ETask>(SetNewETask.toETask)
  //       .toListAs(TaskList<ETask>.fromIterable);
  //   // SaveTaskChangesUseCase を起動する
  //   await _saveTaskChangesUseCase.execute(updatingETaskList: updateInfo);
  // }

  /// 下書きを破棄する
  Future<void> discardDraft({required TaskRec taskRec}) =>
      _discardDraftUseCase.execute(taskRec: taskRec);
}
