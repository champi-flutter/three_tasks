import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_publisher.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/todays_tasks_view_model.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/tomorrows_tasks_view_model.dart';

class DailyTasksPresenter implements DailyTasksPublisher {

  // todo コンストラクタ
  DailyTasksPresenter({
    required TodaysTasksViewModel todaysTasksViewModel,
    required TomorrowsTasksViewModel tomorrowsTasksViewModel,
  })  : _todaysTasksVM = todaysTasksViewModel,
        _tomorrowsTasksVM = tomorrowsTasksViewModel;

  /// 「当日のタスク」VM のインスタンス
  final TodaysTasksViewModel _todaysTasksVM;

  /// 「当日のタスク」VM のインスタンス
  final TomorrowsTasksViewModel _tomorrowsTasksVM;

  /// 新しいキャッシュを受信した際のハンドラ
  @override
  void handleDailyTasksUpdating(Map<Date, List<VDailyTask>> newDataMap) {
    // 当日のタスクを抽出する
    final List<VDailyTask>? newDataOnToday = newDataMap[today];
    // 翌日タスクを抽出する
    final List<VDailyTask>? newDataOnTomorrow = newDataMap[tomorrow];
    // 当日のデータを含んでいる場合
    if (newDataOnToday != null) {
      // 当日のタスクの表示を更新する
      _todaysTasksVM.update(newDataOnToday);
    }
    // 翌日のデータを含んでいる場合
    else if (newDataOnTomorrow != null) {
      // 翌日タスクの表示を更新する
      _tomorrowsTasksVM.update(newDataOnTomorrow);
    }
  }
}
