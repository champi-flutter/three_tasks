import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_publisher.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/todays_tasks_view_model.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/tomorrows_tasks_view_model.dart';

class DailyTasksPresenter implements DailyTasksPublisher {
  final Date tomorrow = today.nDaysLater(1);

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
    // 当日のデータを含んでいるときのみ起動
    if (newDataMap.containsKey(today)) {
      // 当日のタスクを抽出
      final List<VDailyTask> newDataListInToday = newDataMap[today]!;

      _todaysTasksVM.update(newDataListInToday);
    } else
    // 翌日のデータを含んでいるときのみ起動
    if (newDataMap.containsKey(tomorrow)) {
      // 翌日タスクを抽出
      final List<VDailyTask> newDataListInTomorrow = newDataMap[tomorrow]!;
      _tomorrowsTasksVM.update(newDataListInTomorrow);
    }
    // 当日タスクがない場合
    else {
      // todo データ未受信時のリスト要素数 0 の対策（2026/06/03）＞＞
    }
  }
}
