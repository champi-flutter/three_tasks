import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_weekly_tasks_use_case.dart';
import 'package:three_tasks/view_models/extended_foundation/weekly_lazy_map.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';

part 'weekly_tasks_view_model.g.dart';

@riverpod
class WeeklyTasksViewModel extends _$WeeklyTasksViewModel{
  // todo 初期化
  @override
  WeeklyLazyMap build() {
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return WeeklyLazyMap(
      onAnyAccess: _startWatching,//fixme
      onNewAccess: _startWatching,
      placeholder: _placeholder,
    );
  }

  /// リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
  TaskList<VWeeklyTask> _placeholder(Date targetDate) => TaskList<VWeeklyTask>(
        VWeeklyTask.placeholder(targetDate),
        VWeeklyTask.placeholder(targetDate),
        VWeeklyTask.placeholder(targetDate),
      );

  // todo 依存先
  /// タスク監視フローへのアクセス
  WatchWeeklyTasksUseCase get _watchWeeklyTasksUseCase =>
      ref.read(watchWeeklyTasksUseCaseProvider);

  /// 監視フローを開始する
  void _startWatching(Date targetDate) =>
      _watchWeeklyTasksUseCase.initAt(targetDate);

  /// [state] （`List<VWeeklyTask>`）更新メソッド
  void update(Map<UniqueWeek, WeeklyTaskList<VWeeklyTask>> newData) {
    final WeeklyLazyMap newStateMap = state;
    bool isChanged = false;
    for(final newEntry in newData.entries){
      final UniqueWeek updatedWeek = newEntry.key;
      final WeeklyTaskList<VWeeklyTask> newTaskList = newEntry.value;
      // 中身が同じなら早期リターン
      if (newTaskList.isUnorderedEqualTo(state[updatedWeek])) {
        break;
      }
      // 変化がある場合は、newStateMap に記録する
      else {
        isChanged = true;
        newStateMap.setAt(updatedWeek, newTaskList);
      }
    }
    if(isChanged) {
      // state を更新して、リビルドを促す
      state = newStateMap;
    }
  }
}



/// todo printメソッド [週タスクVM]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[週タスクVM]　" + s1);
    if (s2 != null) print("[週タスクVM]　" + s2);
    if (s3 != null) print("[週タスクVM]　" + s3);
    if (s4 != null) print("[週タスクVM]　" + s4);
    if (s5 != null) print("[週タスクVM]　" + s5);
    print("");
  }
}
