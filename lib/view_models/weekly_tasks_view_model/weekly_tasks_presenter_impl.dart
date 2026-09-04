import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/view_models/weekly_tasks_view_model/weekly_tasks_view_model.dart';

/// データ更新反映ポートの具象クラス
class WeeklyTasksPresenterImpl implements WeeklyTasksPresenter {
  // todo コンストラクタ
  WeeklyTasksPresenterImpl({
    required WeeklyTasksViewModel weeklyTasksViewModel,
  }) : _weeklyTasksVM = weeklyTasksViewModel;

  /// 「週のタスク」VM のインスタンス
  final WeeklyTasksViewModel _weeklyTasksVM;

  /// 更新反映フローを実装
  @override
  void handleWeeklyTasksUpdating(Map<UniqueWeek, VWeeklyTask> newDataMap) {
    try {
      // 当日のエントリを抽出する
      final todaysEntries = newDataMap.entries
          .where((e) => e.key.todays)
          .toList();

      // 4つ以上受け取った場合に例外を投げる
      if (todaysEntries.length > 3) {
        throw Exception("週のタスクを4つ以上受け取りました。");
      }

      // 古い順 => 空欄 の順番を固定することで、更新時の順番の乱れを防ぐ
      todaysEntries.sort((a, b) => a.key.compareTo(b.key));

      // ソート済みの値を取り出して結果リストを作成する
      final List<VWeeklyTask> result = todaysEntries
          .map((e) => e.value)
          .toList();

      // データが 3 つ以下のとき、足りない分を、`VWeeklyTask.placeholder2` で埋める
      final int numOfEmpty = 3 - result.length;
      for (int i = 1; i <= numOfEmpty; i++) {
        result.add(VWeeklyTask.placeholder2(today));
      }

      // VM を更新する
      _weeklyTasksVM.update(result);
    } catch (e) {
      // todo エラーハンドリング（2026/08/17）＞＞
    }
  }
}
