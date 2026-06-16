import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/services/day_tasks_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todays_view_model.g.dart';

@riverpod
class TodaysViewModel extends _$TodaysViewModel {
  // todo 初期化
  @override
  List<VDayTask> build() {
    // 古い購読を破棄
    _disposeSubscription();
    // 購読を開始
    _initSubscription();
    // リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return List<VDayTask>.generate(3, (_) => VDayTask.placeholder(date: today));
  }

  // todo 依存先
  /// [DayTasksService] のインスタンス
  DayTasksService get _readDayTasksService => ref.read(dayTasksServiceProvider);

  /// 通知送信先（[EventNotifier]）のインスタンス
  EventNotifier get _readEventNotifier => ref.read(eventProvider);

  // todo 通知関連
  /// エラー通知メソッド
  void _notifyError({
    required String content,
    bool specifiesLayer = false,
  })
  // 折りたたみ用
  {
    _readEventNotifier.notifyInfo(
      layer: specifiesLayer ? NotificationFrom.viewModel : null,
      type: NotificationType.error,
      notification: content,
    );
  }

  /// 書き換え完了通知メソッド
  void _notifySuccess({
    required String content,
    bool specifiesLayer = false,
  })
  // 折りたたみ用
  {
    _readEventNotifier.notifyInfo(
      layer: specifiesLayer ? NotificationFrom.viewModel : null,
      type: NotificationType.success,
      notification: content,
    );
  }

  // todo キャッシュ関連
  /// キャッシュの変更の通知の購読
  StreamSubscription<Map<Date, List<VDayTask>>>? _dayTaskSubscription;

  /// 購読を開始
  void _initSubscription() {
    _dayTaskSubscription =
        _readDayTasksService.dayTaskStream.listen(_handleDayTasksUpdating);
  }

  /// 新しいキャッシュを受信した際のハンドラ
  void _handleDayTasksUpdating(Map<Date, List<VDayTask>> newDataMap) {
    // 当日のデータを含んでいるときのみ起動
    if (newDataMap.containsKey(today)) {
      // 当日のタスクを抽出
      final List<VDayTask> newDataListInToday = newDataMap[today]!;

      // 中身が全く同じ（順番が違っても可）なら、stateの更新を行わず早期リターン
      if (newDataListInToday.isUnorderedEqualTo(state)) {
        return;
      }

      state = [...newDataListInToday];
    }
    // 当日タスクがない場合
    else {
      // todo データ未受信時のリスト要素数 0 の対策（2026/06/03）＞＞
    }
  }

  /// 購読を破棄
  void _disposeSubscription() {
    _dayTaskSubscription?.cancel();
  }

  // List<VDayTask> get taskList => state;

  // todo 書き換え
  /// 今日のタスクの変更保存メソッド
  ///
  /// `HomeScreen._editTaskForToday` に相当
  Future<void> saveTask({
    required VDayTask targetTask,
    required String newTitle,
  })
  // 折りたたみ用
  async {
    // 仮データの場合は、通知と早期リターン
    if (targetTask.id == -1) {
      _notifyError(
        content: "データが未受信です。\nしばらくしてから再度お試しください。",
      );
      return;
    }

    final Result<void, Exception> result = await _readDayTasksService.saveTasks(
      newTaskMap: {targetTask: newTitle},
    );
    switch (result) {
      case Success():
        // TextField の書き換えなどで頻繁に起こるので通知はなし
        break;
      case Failure():
        // エラーが発生した場合は、発生した箇所で通知
        break;
    }
  }

  /// タスクのチェック変更保存メソッド
  Future<void> saveCheck({
    required VDayTask targetTask,
    required bool newValue,
  })
  // 折りたたみ用
  async {
    final Result<void, Exception> result = await _readDayTasksService.saveCheck(
      targetTask: targetTask,
      newValue: newValue,
    );
    switch (result) {
      case Success():
        // TextField の書き換えなどで頻繁に起こるので通知はなし
        break;
      case Failure():
        // エラーが発生した場合は、発生した箇所で通知
        break;
    }
  }

  // todo dispose
  void dispose() {
    // 購読を破棄
    _disposeSubscription();
  }
}

/// todo printメソッド [当日のタスクVM]
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
