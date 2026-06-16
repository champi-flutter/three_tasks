import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/services/day_tasks_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tomorrows_view_model.g.dart';

@riverpod
class TomorrowsViewModel extends _$TomorrowsViewModel {
  final Date tomorrow = today.nDaysLater(1);

  // todo 初期化
  @override
  List<VDayTask> build() {
    // 古い購読を破棄
    _disposeSubscription();
    // 購読を開始
    _initSubscription();
    // リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return List<VDayTask>.generate(
        3, (_) => VDayTask.placeholder(date: tomorrow));
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
    // 翌日のデータを含んでいるときのみ起動
    if (newDataMap.containsKey(tomorrow)) {
      // 翌日タスクを抽出
      final List<VDayTask> newDataListInTomorrow = newDataMap[tomorrow]!;

      // 中身が全く同じ（順番が違っても可）なら、stateの更新を行わず早期リターン
      if (newDataListInTomorrow.isUnorderedEqualTo(state)) {
        return;
      }

      state = [...newDataListInTomorrow];
    }
  }

  /// 購読を破棄
  void _disposeSubscription() {
    _dayTaskSubscription?.cancel();
  }

  // todo dispose
  void dispose() {
    // 購読を破棄
    _disposeSubscription();
  }

  // todo 書き換え
  /// 翌日のタスクの変更保存メソッド
  ///
  /// 引数 [newTaskMap] は、key が ID, value がタスクタイトルの Map 。
  Future<void> saveTasks({
    required Map<VDayTask, String> newTaskMap,
  })
  // 折りたたみ用
  async {
    // 仮データの場合は、通知と早期リターン
    if (newTaskMap.containsKey(-1)) {
      _notifyError(
        content: "データが未受信です。\nしばらくしてから再度お試しください。",
      );
      return;
    }

    final Result<void, Exception> result = await _readDayTasksService.saveTasks(
      newTaskMap: newTaskMap,
    );
    switch (result) {
      case Success():
        // 当日タスクと異なり、ボタンでの保存なので、通知した方が UX 的にいい感じ
        _notifySuccess(content: "明日のタスクを保存しました。");
        break;
      case Failure():
        // エラーが発生した場合は、発生した箇所で通知
        break;
    }
  }
}

/// todo printメソッド [翌日タスクVM]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[翌日タスクVM]　" + s1);
    if (s2 != null) print("[翌日タスクVM]　" + s2);
    if (s3 != null) print("[翌日タスクVM]　" + s3);
    if (s4 != null) print("[翌日タスクVM]　" + s4);
    if (s5 != null) print("[翌日タスクVM]　" + s5);
    print("");
  }
}
