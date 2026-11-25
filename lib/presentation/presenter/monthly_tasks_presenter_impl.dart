import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/presentation/notifier/tasks_state_notifier/tasks_state_notifier.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/to_v_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/monthly_tasks_presenter.dart';

/// データ更新反映ポートの具象クラス
abstract mixin class MonthlyTasksPresenterImpl
    implements MonthlyTasksPresenter {

  /// 更新反映フローを実装
  @override
  Future<void> handleMonthlyTasksUpdating(
      Map<Month, TaskList<EMonthlyTask>> newDataMap,
      )
  // 折りたたみ用
  async {
    // VTask に変換する
    final Map<Month, TaskList<VMonthlyTask>> resultMap = newDataMap.map(
          (key, taskList) => MapEntry(key, _convertToVList(taskList)),
    );
    update(resultMap);
  }

  /// データの型をエンティティから View State へ変換するプライベートメソッド
  TaskList<VMonthlyTask> _convertToVList(TaskList<EMonthlyTask> eTaskList) =>
      eTaskList
          .mapValues<VMonthlyTask>(EToVTask.toVMonthlyTask)
          .toListAs<TaskList<VMonthlyTask>>(TaskList<VMonthlyTask>.fromIterable);


  /// View State 更新メソッド
  ///
  /// キャッシュは追加されるたびに、LFU 方式で evict される。
  void update(Map<Month, TaskList<VMonthlyTask>> newData);
}
