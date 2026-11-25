import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/to_v_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/use_case/output_data/o_task/o_task.dart';
import 'package:three_tasks/use_case/output_data/tasks_output_data/weekly_task_output_data.dart';

/// データ更新反映ポートの具象クラス
abstract mixin class WeeklyTasksPresenterImpl implements WeeklyTasksPresenter {

  /// 更新反映フローを実装
  @override
  Future<void> present(
    WeeklyTaskOutputData newDataMap,
  )
  // 折りたたみ用
  async {
    // エンティティ を VTask に変換する
    final Map<UniqueWeek, WeeklyTaskList<VWeeklyTask>> result =
    newDataMap.read().map(
          (key, taskList) => MapEntry(
        key,
        _convertToVList(taskList),
      ),
    );
    update(result);
  }

  /// データの型をエンティティから View State へ変換するプライベートメソッド
  WeeklyTaskList<VWeeklyTask> _convertToVList(WeeklyTaskList<OWeeklyTask> oTaskList) =>
      oTaskList
          .mapValues<VWeeklyTask>(OToVTask.toVWeeklyTask)
          .toListAs<WeeklyTaskList<VWeeklyTask>>(WeeklyTaskList<VWeeklyTask>.fromIterable);

  /// View State 更新メソッド
  void update(Map<UniqueWeek, WeeklyTaskList<VWeeklyTask>> newData);
}
