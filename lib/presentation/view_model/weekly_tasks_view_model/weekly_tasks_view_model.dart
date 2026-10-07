import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/presentation/extended_foundation/weekly_lazy_map.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_weekly_tasks_use_case.dart';

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
    final Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>> newStateMap = {};
    // リビルドを行うトリガー
    bool isChanged = false;
    // 各エントリ（週とタスクリスト）
    for(final newEntry in newData.entries){
      final UniqueWeek updatedWeek = newEntry.key;
      final WeeklyTaskList<VWeeklyTask> newTaskList = newEntry.value;
      // 中身が違うのを確認したら、リビルドトリガーをオンにする
      if (!newTaskList.isUnorderedEqualTo(state[updatedWeek])) {
        isChanged = true;
      }
      newStateMap[updatedWeek]= LazyViewState.data(newTaskList);
    }
    if(isChanged) {
      // state を更新して、リビルドを促す
      state = state.copyAs(newStateMap);
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
