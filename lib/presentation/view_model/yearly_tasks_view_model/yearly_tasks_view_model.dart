
import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_yearly_tasks_use_case.dart';

part 'yearly_tasks_view_model.g.dart';

/// 月単位タスク View Model
@riverpod
class YearlyTasksViewModel extends _$YearlyTasksViewModel
    with NotificationFromViewModel {
  // todo 初期化
  @override
  LazyMapViewState<int, TaskList<VYearlyTask>> build() {
    // リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return LazyMapViewState(
      onAnyAccess: _startWatching, //fixme
      onNewAccess: _startWatching,
      placeholder: _placeholder,
    );
  }

  /// リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
  TaskList<VYearlyTask> _placeholder(int targetYear) => TaskList<VYearlyTask>(
    VYearlyTask.placeholder(),
    VYearlyTask.placeholder(),
    VYearlyTask.placeholder(),
  );

  // todo 依存先
  /// タスク監視フローへのアクセス
  WatchYearlyTasksUseCase get _watchYearlyTasksUseCase =>
      ref.read(watchYearlyTasksUseCaseProvider);

  /// 通知機能の呼び出し口
  @override
  NotificationService get notificationService =>
      ref.read(notificationServiceProvider);

  /// 監視フローを開始する
  void _startWatching(int targetYear)
  => _watchYearlyTasksUseCase.initAt(targetYear);


  /// [state] 更新メソッド
  ///
  /// キャッシュは追加されるたびに、LFU 方式で evict される。
  void update(Map<int, TaskList<VYearlyTask>> newData) {
    final Map<int, LazyViewState<TaskList<VYearlyTask>>> newStateMap = {};
    // リビルドを行うトリガー
    bool isChanged = false;
    // 各エントリ（月とタスクリスト）
    for(final newEntry in newData.entries){
      final int targetYear = newEntry.key;
      final TaskList<VYearlyTask> newTaskList = newEntry.value;
      // 中身が違うのを確認したら、リビルドトリガーをオンにする
      if (!newTaskList.isUnorderedEqualTo(state[targetYear])) {
        isChanged = true;
      }
      newStateMap[targetYear] = LazyViewState.data(newTaskList);
    }
    if(isChanged) {
      // state を更新してリビルドを促す
      state = state.copyAs(newStateMap);
    }
  }

  TaskList<VYearlyTask> getCurrentStateAt(int year)=>state[year].data;
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
