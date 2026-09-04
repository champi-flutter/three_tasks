import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/todays_tasks_view_model.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/tomorrows_tasks_view_model.dart';
import 'package:three_tasks/view_models/view_state/v_task/converter/to_v_task.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';

/// データ更新反映ポートの具象クラス
class DailyTasksPresenterImpl implements DailyTasksPresenter {
  // todo コンストラクタ
  DailyTasksPresenterImpl({
    required TodaysTasksViewModel todaysTasksViewModel,
    required TomorrowsTasksViewModel tomorrowsTasksViewModel,
  })  : _todaysTasksVM = todaysTasksViewModel,
        _tomorrowsTasksVM = tomorrowsTasksViewModel;

  /// 「当日のタスク」VM のインスタンス
  final TodaysTasksViewModel _todaysTasksVM;

  /// 「当日のタスク」VM のインスタンス
  final TomorrowsTasksViewModel _tomorrowsTasksVM;

  /// 更新反映フローを実装
  @override
  Future<void> handleDailyTasksUpdating(
    Map<Date, List<EDailyTask>> newDataMap,
  )
  // 折りたたみ用
  async {
    // 当日のタスクを抽出する
    final List<EDailyTask>? newDataOnToday = newDataMap[today];
    // 翌日タスクを抽出する
    final List<EDailyTask>? newDataOnTomorrow = newDataMap[tomorrow];
    // 当日のデータを含んでいる場合
    if (newDataOnToday != null) {
      // 当日のタスクの表示を更新する
      _todaysTasksVM.update(newDataOnToday.toVTaskList());
    }
    // 翌日のデータを含んでいる場合
    else if (newDataOnTomorrow != null) {
      // 翌日タスクの表示を更新する
      _tomorrowsTasksVM.update(newDataOnTomorrow.toVTaskList());
    }
  }

  /// データの型をエンティティから View State へ変換するプライベートメソッド
  Map<Date, List<VDailyTask>> _convertToV(Map<Date, List<EDailyTask>> dMap) {
    // 表示するデータの枠
    final Map<Date, List<VDailyTask>> result = {};
    // データを日付ごとに変換していく
    for (final entry in dMap.entries) {
      // データの型を変換する
      final List<VDailyTask> convertedDataList =
      entry.value.map((EDailyTask eDailyTask) {
        return VDailyTask(
          title: eDailyTask.title,
          date: eDailyTask.date,
          id: eDailyTask.id,
          isChecked: eDailyTask.isChecked,
          labelId: eDailyTask.labelId,
        );
      }).toList();
      result[entry.key] = convertedDataList;
    }
    return result;
  }
}
