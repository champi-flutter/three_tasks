
import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_monthly_tasks_use_case.dart';

part 'monthly_tasks_view_model.g.dart';

/// 月単位タスク View Model
@riverpod
class MonthlyTasksViewModel extends _$MonthlyTasksViewModel
    with NotificationFromViewModel {
  // todo 初期化
  @override
  LazyMapViewState<Month, TaskList<VMonthlyTask>> build() {
    // リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return LazyMapViewState(
      onAnyAccess: _startWatching, //fixme
      onNewAccess: _startWatching,
      placeholder: _placeholder,
    );
  }

  /// リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
  TaskList<VMonthlyTask> _placeholder(Month targetMonth) => TaskList<VMonthlyTask>(
    VMonthlyTask.placeholder(),
    VMonthlyTask.placeholder(),
    VMonthlyTask.placeholder(),
  );

  // todo 依存先
  /// タスク監視フローへのアクセス
  WatchMonthlyTasksUseCase get _watchMonthlyTasksUseCase =>
      ref.read(watchMonthlyTasksUseCaseProvider);

  /// 通知機能の呼び出し口
  @override
  NotificationService get notificationService =>
      ref.read(notificationServiceProvider);

  /// 監視フローを開始する
  void _startWatching(Month targetMonth)
  => _watchMonthlyTasksUseCase.initAt(targetMonth);


  /// [state] 更新メソッド
  ///
  /// キャッシュは追加されるたびに、LFU 方式で evict される。
  void update(Map<Month, TaskList<VMonthlyTask>> newData) {
    final Map<Month, LazyViewState<TaskList<VMonthlyTask>>> newStateMap = {};
    // リビルドを行うトリガー
    bool isChanged = false;
    // 各エントリ（月とタスクリスト）
    for(final newEntry in newData.entries){
      final Month targetMonth = newEntry.key;
      final TaskList<VMonthlyTask> newTaskList = newEntry.value;
      // 中身が違うのを確認したら、リビルドトリガーをオンにする
      if (!newTaskList.isUnorderedEqualTo(state[targetMonth])) {
        isChanged = true;
      }
      newStateMap[targetMonth] = LazyViewState.data(newTaskList);
    }
    if(isChanged) {
      // state を更新してリビルドを促す
      state = state.copyAs(newStateMap);
    }
  }

  TaskList<VMonthlyTask> getCurrentStateAt(Month month)=>state[month].data;
}

/// printメソッド [月タスクVM]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[月タスクVM]　" + s1);
    if (s2 != null) print("[月タスクVM]　" + s2);
    if (s3 != null) print("[月タスクVM]　" + s3);
    if (s4 != null) print("[月タスクVM]　" + s4);
    if (s5 != null) print("[月タスクVM]　" + s5);
    print("");
  }
}
