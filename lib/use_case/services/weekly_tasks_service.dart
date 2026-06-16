import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 当日のタスクのサービスクラス
class WeeklyTasksService {
  // todo コンストラクタ
  WeeklyTasksService(this._ref) {
    _initService();
  }

  // todo 初期化
  /// このクラスの初期化
  void _initService() {
    // 古い購読を破棄
    _disposeSubscription();
    // 購読を開始
    _initSubscription();
  }

  /// 最初のデータのフェッチを依頼
  Future<void> initData()async{
    await _readRepository.initWeeklyTaskList();
  }

  // todo 依存先
  final Ref _ref;

  /// [DataRepository] のインスタンスを参照する内部的な getter
  ///
  /// このクラスはインスタンスを保有せず、毎回この getter で参照する。
  DataRepository get _readRepository => _ref.read(dataRepositoryProvider);

  /// 通知送信先（[EventNotifier]）のインスタンス
  EventNotifier get _readEventNotifier => _ref.read(eventProvider);

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

  // todo キャッシュ
  /// キャッシュの変更の通知の購読
  StreamSubscription<List<DWeeklyTask>>? _weeklyTaskSubscription;

  /// 受信したキャッシュを管理するコントローラ
  final StreamController<List<VWeeklyTask>> _weeklyTaskController =
      BehaviorSubject();

  /// 受信したキャッシュを流すストリーム
  Stream<List<VWeeklyTask>> get weeklyTaskStream =>
      _weeklyTaskController.stream;

  /// 購読を開始
  void _initSubscription() {
    _weeklyTaskSubscription =
        _readRepository.weeklyTasksStream.listen(_handleDayTasksUpdating);
  }

  /// 受信データを表示用のデータ型に変換して、ストリームに流すハンドラ
  void _handleDayTasksUpdating(List<DWeeklyTask> newDataList) {
    try {
      // データを表示用の型に変換
      final List<VWeeklyTask> convertedDataList =
          [...newDataList].map((DWeeklyTask dWeeklyTask) {
        // リポジトリからのデータの場合は null はない
        if (dWeeklyTask.task == null) {
          throw Exception("受信データに欠陥があります。（dDayTask.task == null）");
        }
        if (dWeeklyTask.isChecked == null) {
          throw Exception(
            "受信データに欠陥があります。（dDayTask.isChecked == null）",
          );
        }
        return VWeeklyTask(
          task: dWeeklyTask.task!,
          week: dWeeklyTask.week,
          id: dWeeklyTask.id,
          isChecked: dWeeklyTask.isChecked!,
        );
      }).toList();
      // 変換後のデータをストリームに流す
      _weeklyTaskController.add([...convertedDataList]);
    } catch (e) {
      _notifyError(content: "$e", specifiesLayer: true);
    }
  }

  /// 購読を破棄
  void _disposeSubscription() {
    _weeklyTaskSubscription?.cancel();
  }

  /// タスクのタイトルの保存をリポジトリに依頼するメソッド
  ///
  /// 引数 [newTaskMap] は、key が タスクの枠（[VWeeklyTask]）,
  /// value がタスクタイトルの Map 。
  Future<Result<void, Exception>> saveTasks({
    required Map<VWeeklyTask, String> newTaskMap,
  })
  // 折りたたみ用
  async {
    try {
      final List<DWeeklyTask> dWeeklyTaskList = [];
      for (var taskEntry in newTaskMap.entries) {
        // 変更を加えられるタスクの枠
        final VWeeklyTask targetVTask = taskEntry.key;
        // 変更内容
        final String newTitle = taskEntry.value;
        // VTask の形で変更を加える
        final VWeeklyTask newVTask = targetVTask.copyWith(task: newTitle);
        // DTask への変換（isChecked を明示的に null）
        dWeeklyTaskList.add(
          DWeeklyTask(
            task: newVTask.task,
            week: newVTask.week,
            id: newVTask.id,
            isChecked: null,
          ),
        );
      }
      if (dWeeklyTaskList.isEmpty) {
        throw Exception(
          "データを正しく認識できませんでした。\n（DayTasksService.saveTasks）",
        );
      }
      return await _readRepository
          .saveTaskTitles(newTaskList: [...dWeeklyTaskList]);
    } catch (e) {
      _notifyError(content: "$e", specifiesLayer: true);
      return Failure(Exception(e));
    }
  }

  /// タスクのチェック変更保存メソッド
  Future<Result<void, Exception>> saveCheck({
    required VWeeklyTask targetTask,
    required bool newValue,
  })
  // 折りたたみ用
  async {
    // DTask への変換（task を明示的に null）
    final DWeeklyTask newDTask = DWeeklyTask(
      task: null,
      week: targetTask.week,
      id: targetTask.id,
      isChecked: newValue,
    );
    return await _readRepository.saveCheck(newTask: newDTask);
  }
}
