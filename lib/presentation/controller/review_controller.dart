import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/data_foundation/value_object/task_recurrence.dart';
import 'package:three_tasks/presentation/controller/dto/converter/task_input_converter.dart';
import 'package:three_tasks/presentation/controller/dto/review_control_parameter/review_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/draft_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';
import 'package:three_tasks/use_case/input_data/task_input_data/task_input_data.dart';

/// レビュー操作クラス
class ReviewController {
  // todo コンストラクタ
  ReviewController({
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

  /// レビュー操作時のコールバック
  Future<void> controlReview({
    required bool willAutoSave,
    required TaskList<VTask> taskState,
    required int position,
    required ReviewControlParameter parameter,
  })
      // 折りたたみ用
      =>
      willAutoSave
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

  /// [TaskList] 中の指定 [position] のレビューの変更を保存する
  Future<void> _saveAt(
    int position, {
    required TaskList<VTask> state,
    required ReviewControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // 編集未保存フラグをおろす
    _editController.notifySaved();

    // あとで TaskList<ITask> に当てはめるリスト
    final List<ITask> tempTaskList = [];
    // あとで WeeklyTaskList<IWeeklyTask> に当てはめるリスト
    final Map<UniqueWeek, List<IWeeklyTask>> tempWeeklyTaskListMap = {};
    // 渡された情報を tempTaskList （または tempWeeklyTaskList ）に当てはめるプロセス
    for (final ListEntry<VTask> vTaskEntry in state) {
      final ITask iTask = TaskInputConverter.toTaskReviewInputData(
        vTask: vTaskEntry.value,
        // 対象インデックスのタスクなら引数のパラメータを、
        // そうでない場合は空のパラメータをあたはめる
        parameter: (vTaskEntry.index == position)
            ? parameter
            : ReviewControlParameter(),
      );

      // 週タスクの場合
      if (iTask is IWeeklyTask) {
        tempWeeklyTaskListMap.addNullable(key: iTask.week, value: iTask);
      }
      // 週タスク以外の場合
      else {
        tempTaskList.add(iTask);
      }
    }

    // tempTaskList （または tempWeeklyTaskList ）を UseCase に渡す形に変換する
    // 週タスク以外の場合
    if (tempTaskList.length == 3) {
      final TaskList<ITask> updatingITaskList =
          TaskList<ITask>.fromIterable(tempTaskList);
      // SaveTaskChangesUseCase を起動する
      await _saveTaskChangesUseCase.execute(
        taskListInputData: TaskInputData(updatingITaskList),
      );
    }
    // 週タスクの場合
    else if (tempWeeklyTaskListMap.isNotEmpty) {
      // UniqueWeek が Comparable を実装しているため、`..sort()` で古い順にする
      final sortedKeys = tempWeeklyTaskListMap.keys.toList()..sort();

      // 1つのリストにまとめる
      final List<IWeeklyTask> combinedList = [];

      // 古い順のキーに対応するリストを順番に追加していく
      for (final key in sortedKeys) {
        final list = tempWeeklyTaskListMap[key];
        // 一応
        if (list != null) {
          combinedList.addAll(list);
        }
      }

      // tempWeeklyList を WeeklyTaskList<IWeeklyTask> に適用する
      final TaskList<IWeeklyTask> updatingITaskList =
          TaskList<IWeeklyTask>.fromIterable(combinedList);

      // SaveTaskChangesUseCase を起動する
      await _saveWeeklyTaskChangesUseCase.execute(
        taskListInputData: WeeklyTaskInputData(updatingITaskList),
      );
    }
  }

  /// [TaskList] 中の指定 [position] のレビューの変更を下書きとして保留する
  Future<void> _draftAt(
    int position, {
    required TaskList<VTask> state,
    required ReviewControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // 編集未保存フラグを立てる
    _editController.notifyEdited();
    // state をInputData に変換する（下書きは週タスクも TaskList で渡す）
    final TaskList<ITask> newDraft = state
        .map<ITask>((vTaskEntry) => TaskInputConverter.toTaskReviewInputData(
              vTask: vTaskEntry.value,
              // 対象インデックスのタスクなら引数のパラメータを、
              // そうでない場合は空のパラメータをあたはめる
              parameter: (vTaskEntry.index == position)
                  ? parameter
                  : ReviewControlParameter(),
            ))
        .toListAs(TaskList<ITask>.fromIterable);

    // DraftTaskChangesUseCase を起動する
    await _draftTaskChangesUseCase.execute(draftInputData: newDraft);
  }

  /// 現時点でのレビューの View State でタスク変更保存フローを呼び出す
  Future<void> saveCurrent({
    required TaskList<VTask> taskState,
  })
  // 折りたたみ用
  async {
    // 編集未保存フラグをおろす
    _editController.notifySaved();

    // 週タスクの場合
    if (taskState.rec == TaskRec.week) {
      // 空のパラメータを当てはめて、そのまま InputData の固定長リストに変換する
      final TaskList<IWeeklyTask> updatingITaskList = taskState
          .mapValues<IWeeklyTask>(
            (vTask) => TaskInputConverter.toIWeeklyTaskWithoutChange(
          vTask: vTask as VWeeklyTask,
        ),
      )
          .toListAs(TaskList<IWeeklyTask>.fromIterable);

      await _saveWeeklyTaskChangesUseCase.execute(
        taskListInputData: WeeklyTaskInputData(updatingITaskList),
      );
    }
    // 週タスク以外の場合
    else {
      // 空のパラメータを当てはめて、そのまま InputData の固定長リストに変換する
      final TaskList<ITask> updatingITaskList = taskState
          .mapValues<ITask>(
            (vTask) => TaskInputConverter.toITaskWithoutChange(
          vTask: vTask,
        ),
      )
          .toListAs(TaskList<ITask>.fromIterable);

      await _saveTaskChangesUseCase.execute(
        taskListInputData: TaskInputData(updatingITaskList),
      );
    }
  }

  /// 下書きを破棄する
  Future<void> discardDraft({required TaskRec taskRec}) async {
    // 編集未保存フラグをおろす
    _editController.notifyDiscarded();
    await _discardDraftUseCase.execute(taskRec: taskRec);
  }
}
