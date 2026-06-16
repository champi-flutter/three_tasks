import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/use_case/services/weekly_tasks_service.dart';

part 'weekly_tasks_view_model.g.dart';

@riverpod
class WeeklyTasksViewModel extends _$WeeklyTasksViewModel with LoadingHandler {
  // todo 初期化
  @override
  List<VWeeklyTask> build() {
    // 古い購読を破棄
    _disposeSubscription();
    // 購読を開始
    _initSubscription();
    // リスト要素数 0 （データ未受信）時の仮データ（ID: -1 ）
    // ハンドラ（`_handleDayTasksUpdating`）が1回起動して初めて実際のデータが表示される
    return List<VWeeklyTask>.generate(3, (_) => VWeeklyTask.placeholder());
  }

  /// 最初のデータのフェッチを依頼
  ///
  /// これをローディングすることで、データ未受信時に書き換え不可にする。
  Future<void> initData() => loadAsync(() async {
        // 最初の受信を待つフラグ
        final Completer<void> closedCompleter = Completer<void>();
        // 最初のデータを受信したタイミングでフラグを立てるハンドラを設置
        _readWeeklyTasksService.weeklyTaskStream.take(1).listen((_){
          // 最初のデータを受信したフラグを立てる
          closedCompleter.complete();
        });
        // 初期化を依頼
        await _readWeeklyTasksService.initData();
        // フラグが立つまで await （ローディングを維持）
        await closedCompleter.future;
      });

  // todo 依存先
  /// [WeeklyTasksService] のインスタンス
  WeeklyTasksService get _readWeeklyTasksService =>
      ref.read(weeklyTasksServiceProvider);

  /// 通知送信先（[EventNotifier]）のインスタンス
  EventNotifier get _readEventNotifier => ref.read(eventProvider);

  /// ローディング管理クラス
  @override
  LoadingViewModel get loadingVM => ref.read(loadingViewModelProvider.notifier);

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
  StreamSubscription<List<VWeeklyTask>>? _weeklyTaskSubscription;

  /// 購読を開始
  void _initSubscription() {
    _weeklyTaskSubscription = _readWeeklyTasksService.weeklyTaskStream
        .listen(_handleWeeklyTasksUpdating);
  }

  /// 新しいキャッシュを受信した際のハンドラ
  void _handleWeeklyTasksUpdating(List<VWeeklyTask> newDataList) {
    _print("${newDataList.length} 個のデータを受信しました。");
    // 当日を含む週のタスクを抽出
    final List<VWeeklyTask> newDataListInToday =
        [...newDataList].where((VWeeklyTask task) {
      return task.week.includesDate(today);
    }).toList();

    // 当日を含む週のタスクを含んでいるかどうか（無駄なリビルドを減らす）
    final bool hasNonDataInToday = newDataListInToday.isEmpty;

    // 当日のデータを含んでいて、かつ前回データと異なるときのみ起動
    if (hasNonDataInToday || newDataListInToday.isUnorderedEqualTo(state)) {
      // 中身が全く同じ（順番が違っても可）なら、stateの更新を行わず早期リターン
      return;
    } else {
      // リストの要素数を 3 に固定（日単位タスクとは異なり、空を許容する）
      final int shortage = 3 - newDataListInToday.length;
      // リストの要素数が 4 以上になるのは例外
      if(shortage < 0){
        // エラーを通知
        _notifyError(
          content: "該当週タスクを正しく検知できませんでした。\nlength = ${newDataListInToday.length}",
        );
        // とりあえず上3つを表示
        state = [...newDataListInToday.take(3)];
      } else {
        final List<VWeeklyTask> placeHolder = List<VWeeklyTask>.generate(
          shortage,
              (_) => VWeeklyTask.placeholder(),
        );
        state = [...newDataListInToday, ...placeHolder];
      }
    }
  }

  /// 購読を破棄
  void _disposeSubscription() {
    _weeklyTaskSubscription?.cancel();
  }

  // List<VDayTask> get taskList => state;

  // todo 書き換え
  /// 今日のタスクの変更保存メソッド
  ///
  /// `HomeScreen._editTaskForToday` に相当
  Future<void> saveTask({
    required VWeeklyTask targetTask,
    required String newTitle,
  }) =>
      loadAsync(() async {
        // 仮データに入力した場合
        if (targetTask.id == -1) {
          await _createNewTask(newTitle: newTitle);
        }
        // 既存のデータを書き換えた場合
        else {
          final Result<void, Exception> result = await _readWeeklyTasksService
              .saveTasks(newTaskMap: {targetTask: newTitle});
          switch (result) {
            case Success():
              // TextField の書き換えなどで頻繁に起こるので通知はなし
              break;
            case Failure():
              // エラーが発生した場合は、発生した箇所で通知
              break;
          }
        }
      });

  /// 週単位タスクは、仮データを書き換えた時に初めて作られる。
  ///
  /// データ未受信を防ぐために、あえて遅延初期化（初期化のタイミングを指定）して、ローディング
  /// を合わせるようにする。
  Future<void> _createNewTask({required String newTitle}) async {}

  /// タスクのチェック変更保存メソッド
  Future<void> saveCheck({
    required VWeeklyTask targetTask,
    required bool newValue,
  }) =>
      loadAsync(() async {
        final Result<void, Exception> result =
            await _readWeeklyTasksService.saveCheck(
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
      });

  // todo dispose
  void dispose() {
    // 購読を破棄
    _disposeSubscription();
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
