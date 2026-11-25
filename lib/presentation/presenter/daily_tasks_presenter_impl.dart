import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/to_v_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/output_data/o_task/o_task.dart';
import 'package:three_tasks/use_case/output_data/tasks_output_data/daily_task_output_data.dart';

/// データ更新反映ポートの具象クラス
abstract mixin class DailyTasksPresenterImpl implements DailyTasksPresenter {

  /// 更新反映フローを実装
  @override
  Future<void> present(
    DailyTaskOutputData newDataMap,
  )
  // 折りたたみ用
  async {
    // VTask に変換する
    final Map<Date, TaskList<VDailyTask>> resultMap = newDataMap.read().map(
          (key, taskList) => MapEntry(key, _convertToVList(taskList)),
    );
    update(resultMap);
  }

  /// データの型をエンティティから View State へ変換するプライベートメソッド
  TaskList<VDailyTask> _convertToVList(TaskList<ODailyTask> oTaskList) =>
      oTaskList
          .mapValues<VDailyTask>(OToVTask.toVDailyTask)
          .toListAs<TaskList<VDailyTask>>(TaskList<VDailyTask>.fromIterable);


  /// View State 更新メソッド
  ///
  /// キャッシュは追加されるたびに、LFU 方式で evict される。
  void update(Map<Date, TaskList<VDailyTask>> newData);
}
