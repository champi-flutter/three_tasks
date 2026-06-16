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
class DayTasksService {
  // todo コンストラクタ
  DayTasksService(this._ref) {
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
  StreamSubscription<Map<Date, List<DDayTask>>>? _dayTaskSubscription;

  /// 受信したキャッシュを管理するコントローラ
  final StreamController<Map<Date, List<VDayTask>>> _dayTaskController =
      BehaviorSubject();

  /// 受信したキャッシュを流すストリーム
  Stream<Map<Date, List<VDayTask>>> get dayTaskStream =>
      _dayTaskController.stream;

  /// 購読を開始
  void _initSubscription() {
    _dayTaskSubscription =
        _readRepository.dayTasksStream.listen(_handleDayTasksUpdating);
  }

  /// 受信データを表示用のデータ型に変換して、ストリームに流すハンドラ
  void _handleDayTasksUpdating(Map<Date, List<DDayTask>> newDataMap) {
    try {
      // ストリームに流すデータを組み込む枠
      final Map<Date, List<VDayTask>> convertedDataMap = {};
      // データを日付ごとに変換していく
      for (var entry in newDataMap.entries) {
        // データを表示用の型に変換
        final List<VDayTask> convertedDataList =
        [...entry.value].map((DDayTask dDayTask) {
          // リポジトリからのデータの場合は null はない
          if(dDayTask.task == null){
            throw Exception("受信データに欠陥があります。（dDayTask.task == null）");
          }
          if(dDayTask.isChecked == null){
            throw Exception(
              "受信データに欠陥があります。（dDayTask.isChecked == null）",
            );
          }
          return VDayTask(
            task: dDayTask.task!,
            date: dDayTask.date,
            id: dDayTask.id,
            isChecked: dDayTask.isChecked!,
          );
        }).toList();
        convertedDataMap[entry.key] = [...convertedDataList];
      }
      // 変換後のデータをストリームに流す
      _dayTaskController.add({...convertedDataMap});
    } catch(e){
      _notifyError(content: "$e", specifiesLayer: true);
    }
  }

  /// 購読を破棄
  void _disposeSubscription() {
    _dayTaskSubscription?.cancel();
  }

  // todo 書き換え
  /// タスクのタイトルの保存をリポジトリに依頼するメソッド
  ///
  /// 引数 [newTaskMap] は、key が タスクの枠（[VDayTask]）, value がタスクタイトルの Map 。
  Future<Result<void, Exception>> saveTasks({
    required Map<VDayTask, String> newTaskMap,
  })
  // 折りたたみ用
  async {
    try {
      final List<DDayTask> dDayTaskList = [];
      for (var taskEntry in newTaskMap.entries) {
        // 変更を加えられるタスクの枠
        final VDayTask targetVTask = taskEntry.key;
        // 変更内容
        final String newTitle = taskEntry.value;
        // VTask の形で変更を加える
        final VDayTask newVTask = targetVTask.copyWith(task: newTitle);
        // DTask への変換（isChecked を明示的に null）
        dDayTaskList.add(
          DDayTask(
            task: newVTask.task,
            date: newVTask.date,
            id: newVTask.id,
            isChecked: null,
          ),
        );
      }
      if (dDayTaskList.isEmpty) {
        throw Exception(
          "データを正しく認識できませんでした。\n（DayTasksService.saveTasks）",
        );
      }
      return await _readRepository.saveTaskTitles(
          newTaskList: [...dDayTaskList]);
    } catch (e){
      _notifyError(content: "$e", specifiesLayer: true);
      return Failure(Exception(e));
    }
  }

  /// タスクのチェック変更保存メソッド
  Future<Result<void, Exception>> saveCheck({
    required VDayTask targetTask,
    required bool newValue,
  })
  // 折りたたみ用
  async {
    // DTask への変換（task を明示的に null）
    final DDayTask newDTask =
    DDayTask(
      task: null,
      date: targetTask.date,
      id: targetTask.id,
      isChecked: newValue,
    );
    return await _readRepository.saveCheck(newTask: newDTask);
  }
}
