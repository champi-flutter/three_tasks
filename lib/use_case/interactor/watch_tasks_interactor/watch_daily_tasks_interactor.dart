import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_publisher.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 日単位タスクの監視フローを実装するクラス
class WatchDailyTasksInteractor implements WatchDailyTasksUseCase {
  // todo コンストラクタ
  WatchDailyTasksInteractor({
    required DailyTasksPublisher dailyTasksPublisher,
    required DailyTasksStreamHandler dailyTasksStreamHandler,
    required NotificationUseCase notificationUseCase,
  })  : _dailyTasksPublisher = dailyTasksPublisher,
        _streamHandler = dailyTasksStreamHandler,
        _notificationUseCase = notificationUseCase;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final DailyTasksPublisher _dailyTasksPublisher;

  /// ストリームを取り扱うクラスのインスタンス
  final DailyTasksStreamHandler _streamHandler;

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
  ///
  /// 【データ受信時の処理フロー】
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  @override
  void init() {
    _streamHandler.listen(
      onData: _onData,
    );
  }

  /// todo このクラスの dispose
  @override
  void dispose() {
    _streamHandler.dispose();
  }

  /// データ受信時の処理フロー
  ///
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  void _onData(Map<Date, List<DDailyTask>> newDataMap) {
    try {
      // データの型を変換する
      final Map<Date, List<VDailyTask>> convertedMap = _convertToV(newDataMap);
      // 変換後のデータを反映させる
      _publishDailyTasks(convertedMap);
    } catch (e) {
      _notifyError(content: "$e", specifiesLayer: true);
    }
  }

  /// [DDailyTask] の Map から [VDailyTask] の Map へ変換するプライベートメソッド
  Map<Date, List<VDailyTask>> _convertToV(Map<Date, List<DDailyTask>> dMap) {
    // ストリームに流すデータを組み込む枠
    final Map<Date, List<VDailyTask>> result = {};
    // データを日付ごとに変換していく
    for (final entry in dMap.entries) {
      // データの型を変換する
      final List<VDailyTask> convertedDataList =
          entry.value.map((DDailyTask dDailyTask) {
        // リポジトリからのデータの場合は null はない
        if (dDailyTask.task == null) {
          throw Exception(
            "受信データに欠陥があります。\n（dDailyTask.task == null）",
          );
        }
        if (dDailyTask.isChecked == null) {
          throw Exception(
            "受信データに欠陥があります。\n（dDailyTask.isChecked == null）",
          );
        }
        if (dDailyTask.labelId == null) {
          throw Exception(
            "受信データに欠陥があります。\n（dDailyTask.labelId == null）",
          );
        }
        return VDailyTask(
          task: dDailyTask.task!,
          date: dDailyTask.date,
          id: dDailyTask.id,
          isChecked: dDailyTask.isChecked!,
          labelId: dDailyTask.labelId!,
        );
      }).toList();
      result[entry.key] = convertedDataList;
    }
    return result;
  }

  /// データを反映させるプライベートメソッド
  void _publishDailyTasks(Map<Date, List<VDailyTask>> newDataMap) {
    _dailyTasksPublisher.handleDailyTasksUpdating(newDataMap);
  }
}
