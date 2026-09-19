
import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'daily_tasks_view_model.g.dart';

// todo 週タスクも（2026/09/12）＞＞
@riverpod
class DailyTasksViewModel extends _$DailyTasksViewModel
    with NotificationFromViewModel {
  // todo 初期化
  @override
  LazyMap<Date, TaskList<VDailyTask>> build() {
    // 監視フローを開始する
    _startWatching(today);
    // リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return LazyMap(
      onAnyAccess: _startWatching,//fixme
      onNewAccess: _startWatching,
      placeholder: _placeholder,
    );
  }

  /// リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
  TaskList<VDailyTask> _placeholder(Date targetDate) => TaskList<VDailyTask>(
    VDailyTask.placeholder(date: targetDate),
    VDailyTask.placeholder(date: targetDate),
    VDailyTask.placeholder(date: targetDate),
  );

  // todo 依存先
  /// タスク監視フローへのアクセス
  WatchDailyTasksUseCase get _watchDailyTasksUseCase =>
      ref.read(watchDailyTasksUseCaseProvider);

  /// アクセス通知フローへのアクセス
  // NotifyDailyTasksAccessUseCase get _notifyDailyTasksAccessUseCase => ref.read();

  /// 通知機能の呼び出し口
  @override
  NotificationService get notificationService =>
      ref.read(notificationServiceProvider);

  /// 監視フローを開始する
  void _startWatching(Date targetDate) => _watchDailyTasksUseCase.initAt(targetDate);

  // void _notifyAccess(Date date)=>;

  /// [state] 更新メソッド
  ///
  /// キャッシュは追加されるたびに、LFU 方式で evict される。
  void update(Map<Date, TaskList<VDailyTask>> newData) {
    final Map<Date, TaskList<VDailyTask>> newStateMap = {};
    for(final newEntry in newData.entries){
      final Date targetDate = newEntry.key;
      final TaskList<VDailyTask> newTaskList = newEntry.value;
      // 中身が同じなら早期リターン
      if (newTaskList.isUnorderedEqualTo(state[targetDate])) {
        break;
      }
      newStateMap[targetDate] = newTaskList;
    }
    // state を更新してリビルドを促す
    state = state.copyAs(newStateMap);
  }
}

/// printメソッド [当日のタスクVM]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[当日のタスクVM]　" + s1);
    if (s2 != null) print("[当日のタスクVM]　" + s2);
    if (s3 != null) print("[当日のタスクVM]　" + s3);
    if (s4 != null) print("[当日のタスクVM]　" + s4);
    if (s5 != null) print("[当日のタスクVM]　" + s5);
    print("");
  }
}
