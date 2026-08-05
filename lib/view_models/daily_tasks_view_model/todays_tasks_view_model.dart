import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_publisher.dart';
import 'package:three_tasks/use_case/services/day_tasks_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todays_tasks_view_model.g.dart';

@riverpod
class TodaysTasksViewModel extends _$TodaysTasksViewModel{
  // todo 初期化
  @override
  List<VDailyTask> build() {
    // 古い購読を破棄
    _disposeSubscription();
    // 購読を開始
    _initSubscription();
    // リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return List<VDailyTask>.generate(3, (_) => VDailyTask.placeholder(date: today));
  }

  // todo 依存先
  // /// [DayTasksService] のインスタンス
  // final DayTasksService _dayTasksService;

  /// 通知送信先（[EventNotifier]）のインスタンス
  NotificationUseCase get _notificationUseCase => ref.read(notificationUseCaseProvider);

  // todo 通知関連
  /// エラー通知メソッド
  void _notifyError({
    required String content,
    bool specifiesLayer = false,
  })
  // 折りたたみ用
  {
    _notificationUseCase.notifyInfo(
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
    _notificationUseCase.notifyInfo(
      layer: specifiesLayer ? NotificationFrom.viewModel : null,
      type: NotificationType.success,
      notification: content,
    );
  }

  /// [state] （`List<VDailyTask>`）更新メソッド
  void update(List<VDailyTask> newState){
    // 中身が同じなら早期リターン
    if(newState.isUnorderedEqualTo(state)){
      return;
    }
    state = newState;
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
