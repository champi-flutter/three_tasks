import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_publisher.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/stream_handler/daily_tasks_stream_handler.dart';

/// 日単位タスクの監視フローを実装するクラス
///
/// todo 処理フローがわかりやすくなるように要改善（2026/08/05）＞＞
class WatchDailyTasksInteractor implements WatchDailyTasksUseCase {
  // todo コンストラクタ
  WatchDailyTasksInteractor({
    required DailyTasksPublisher dailyTasksPublisher,
    required DailyTasksStreamHandler dailyTasksStreamHandler,
    required NotificationUseCase notificationUseCase,
    required DataRepository dataRepository,
  })  : _dailyTasksPublisher = dailyTasksPublisher,
        _streamHandler = dailyTasksStreamHandler,
        _notificationUseCase = notificationUseCase,
        _repository = dataRepository;

  // todo 依存先
  final DailyTasksPublisher _dailyTasksPublisher;

  final DailyTasksStreamHandler _streamHandler;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// 通知送信先（[NotificationUseCase]）のインスタンス
  final NotificationUseCase _notificationUseCase;

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

  /// 監視を開始
  @override
  void init() {
    _streamHandler.listenTo(
      _repository.dailyTasksStream,
      onData: _handleDailyTasksUpdating,
    );
  }

  /// todo このクラスの dispose
  @override
  void dispose() {
    _streamHandler.dispose();
  }

  /// 受信データを表示用のデータ型に変換して、ストリームに流すハンドラ
  void _handleDailyTasksUpdating(Map<Date, List<DDailyTask>> newDataMap) {
    try {
      // ストリームに流すデータを組み込む枠
      final Map<Date, List<VDailyTask>> convertedDataMap = {};
      // データを日付ごとに変換していく
      for (var entry in newDataMap.entries) {
        // データを表示用の型に変換
        final List<VDailyTask> convertedDataList =
        [...entry.value].map((DDailyTask dDailyTask) {
          // リポジトリからのデータの場合は null はない
          if (dDailyTask.task == null) {
            throw Exception("受信データに欠陥があります。（dDailyTask.task == null）");
          }
          if (dDailyTask.isChecked == null) {
            throw Exception(
              "受信データに欠陥があります。（dDailyTask.isChecked == null）",
            );
          }
          return VDailyTask(
            task: dDailyTask.task!,
            date: dDailyTask.date,
            id: dDailyTask.id,
            isChecked: dDailyTask.isChecked!,
            labelId: dDailyTask.labelId,
          );
        }).toList();
        convertedDataMap[entry.key] = [...convertedDataList];
      }
      // 変換後のデータをストリームに流す
      _publishDailyTasks({...convertedDataMap});
    } catch (e) {
      _notifyError(content: "$e", specifiesLayer: true);
    }
  }

  /// OutputBoundary の更新処理を呼び出す
  void _publishDailyTasks(Map<Date, List<VDailyTask>> newDataMap) {
    _dailyTasksPublisher.handleDailyTasksUpdating(newDataMap);
  }
}
