import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/view_models/view_state/v_task/converter/to_v_task.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';
import 'package:three_tasks/presentation/weekly_tasks_view_model/weekly_tasks_view_model.dart';

/// データ更新反映ポートの具象クラス
class WeeklyTasksPresenterImpl
    with NotificationFromViewModel
    implements WeeklyTasksPresenter {
  // todo コンストラクタ
  WeeklyTasksPresenterImpl({
    required WeeklyTasksViewModel weeklyTasksViewModel,
    required NotificationService notificationService,
  })  : _weeklyTasksVM = weeklyTasksViewModel,
        notificationService = notificationService;

  /// 「週のタスク」VM のインスタンス
  final WeeklyTasksViewModel _weeklyTasksVM;

  /// 通知機能の呼び出し口
  @override
  final NotificationService notificationService;

  /// 更新反映フローを実装
  @override
  Future<void> handleWeeklyTasksUpdating(
    Map<UniqueWeek, WeeklyTaskList<EWeeklyTask>> newDataMap,
  )
  // 折りたたみ用
  async {
    try {
      // エンティティ を VTask に変換する
      final Map<UniqueWeek, WeeklyTaskList<VWeeklyTask>> result =
          newDataMap.map(
        (key, value) => MapEntry(
          key,
          value
              .mapValues(ToVTask.toVWeeklyTask<EWeeklyTask>)
              .toListAs(WeeklyTaskList.fromIterable),
        ),
      );
      // VM を更新する
      _weeklyTasksVM.update(result);
    } catch (e, st) {
      notifyError(content: "[WeeklyTasksPresenter] $e\n$st");
    }
  }

  /// データの型をエンティティから View State へ変換するプライベートメソッド
  List<VWeeklyTask> _convertToVList(List<EWeeklyTask> eTaskList) =>
      eTaskList.map<VWeeklyTask>(ToVTask.toVWeeklyTask<EWeeklyTask>).toList();
}
