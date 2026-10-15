import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/presentation/view_model/monthly_tasks_view_model/monthly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/to_v_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/monthly_tasks_presenter.dart';

/// データ更新反映ポートの具象クラス
class MonthlyTasksPresenterImpl
    with NotificationFromViewModel
    implements MonthlyTasksPresenter {
  // todo コンストラクタ
  MonthlyTasksPresenterImpl({
    required MonthlyTasksViewModel monthlyTasksViewModel,
    required NotificationService notificationService,
  })  : _viewModel = monthlyTasksViewModel,
        notificationService = notificationService;

  /// 日単位タスク ViewModel の呼び出し口
  final MonthlyTasksViewModel _viewModel;

  /// 通知機能の呼び出し口
  @override
  final NotificationService notificationService;

  /// 更新反映フローを実装
  @override
  Future<void> handleMonthlyTasksUpdating(
      Map<Month, TaskList<EMonthlyTask>> newDataMap,
      )
  // 折りたたみ用
  async {
    try {
      // VTask に変換する
      final Map<Month, TaskList<VMonthlyTask>> resultMap = newDataMap.map(
            (key, taskList) => MapEntry(key, _convertToVList(taskList)),
      );
      // ViewModel の update を呼び出す
      _viewModel.update(resultMap);
    } catch (e, st) {
      notifyError(content: "[MonthlyTasksPresenter] $e\n$st");
    }
  }

  /// データの型をエンティティから View State へ変換するプライベートメソッド
  TaskList<VMonthlyTask> _convertToVList(TaskList<EMonthlyTask> eTaskList) =>
      eTaskList
          .mapValues<VMonthlyTask>(EToVTask.toVMonthlyTask)
          .toListAs<TaskList<VMonthlyTask>>(TaskList<VMonthlyTask>.fromIterable);
}
