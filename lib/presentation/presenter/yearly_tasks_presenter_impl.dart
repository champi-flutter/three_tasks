import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/presentation/notifier/tasks_state_notifier/tasks_state_notifier.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/to_v_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/yearly_tasks_presenter.dart';

/// データ更新反映ポートの具象クラス
class YearlyTasksPresenterImpl
    with NotificationFromViewModel
    implements YearlyTasksPresenter {
  // todo コンストラクタ
  YearlyTasksPresenterImpl({
    required YearlyTasksStateNotifier yearlyTasksStateNotifier,
    required NotificationService notificationService,
  })  : _state = yearlyTasksStateNotifier,
        notificationService = notificationService;

  /// 年単位タスク ViewState の更新呼び出し口
  final YearlyTasksStateNotifier _state;

  /// 通知機能の呼び出し口
  @override
  final NotificationService notificationService;

  /// 更新反映フローを実装
  @override
  Future<void> handleYearlyTasksUpdating(
      Map<int, TaskList<EYearlyTask>> newDataMap,
      )
  // 折りたたみ用
  async {
    try {
      // VTask に変換する
      final Map<int, TaskList<VYearlyTask>> resultMap = newDataMap.map(
            (key, taskList) => MapEntry(key, _convertToVList(taskList)),
      );
      // ViewModel の update を呼び出す
      _state.update(resultMap);
    } catch (e, st) {
      notifyError(content: "[YearlyTasksPresenter] $e\n$st");
    }
  }

  /// データの型をエンティティから View State へ変換するプライベートメソッド
  TaskList<VYearlyTask> _convertToVList(TaskList<EYearlyTask> eTaskList) =>
      eTaskList
          .mapValues<VYearlyTask>(EToVTask.toVYearlyTask)
          .toListAs<TaskList<VYearlyTask>>(TaskList<VYearlyTask>.fromIterable);
}
