import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_publisher.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 日単位タスクの監視フローを実装するクラス
class WatchDailyTasksInteractor implements WatchDailyTasksUseCase {
  // todo コンストラクタ
  WatchDailyTasksInteractor({
    required DailyTasksPublisher dailyTasksPublisher,
    required DailyTasksCacheHandler dailyTasksCacheHandler,
    required DailyTasksStreamHandler dailyTasksStreamHandler,
    required DataRepository dataRepository,
    required NotificationUseCase notificationUseCase,
  })  : _dailyTasksPublisher = dailyTasksPublisher,
        _cacheHandler = dailyTasksCacheHandler,
        _streamHandler = dailyTasksStreamHandler,
        _repository = dataRepository,
        _notificationUseCase = notificationUseCase;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final DailyTasksPublisher _dailyTasksPublisher;

  /// 日単位タスクのキャッシュハンドラのインスタンス
  final DailyTasksCacheHandler _cacheHandler;

  /// ストリームを取り扱うクラスのインスタンス
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
      layer: specifiesLayer ? NotificationFrom.useCase : null,
      type: NotificationType.error,
      notification: content,
    );
  }

  /// リポジトリからのフェッチのエラーの [Exception] のテンプレート
  Exception _fetchError({
    String? details,
    required String? methodName,
  }) =>
      Exception("FETCH_ERROR: DataRepository.${methodName ?? "??"}\n$details");

  /// このクラスがすでに起動済みかどうか
  bool _isInitialized = false;

  /// 監視を開始
  ///
  /// 【データ受信時の処理フロー】
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  @override
  void initAt(List<Date> dateList) {
    try {
      // 初めての起動の場合
      if(!_isInitialized){
        // 購読を開始する
        _initSubscription();
      }
      // 対象の日付のタスクデータの監視を開始する。
      _startWatching(dateList);
      _isInitialized = true;
    } catch(_){
      _isInitialized = false;
    }
  }

  /// 購読を開始
  void _initSubscription() {
    try {
      _streamHandler.listen(
        onData: _onData,
      );
    } catch(_){
      rethrow;
    }
  }

  /// 対象日付（[dateList]）の監視を開始するプライベートメソッド
  Future<void> _startWatching(List<Date> dateList) async {
    try {
      // 当日の日単位タスクのフェッチを依頼し、データを受け取る
      final Result<Map<Date, List<DDailyTask>>, Exception> result =
          await _repository.fetchDailyTasks(dateList: dateList);

      switch (result) {
        case Success(value: final Map<Date, List<DDailyTask>> existingValue):
          // 取得したマップからデータがない日付のエントリを除外し、その日付をリストに格納する
          final List<Date> emptyDateList = [];
          existingValue.removeWhere((date, value) {
            final bool isEmpty = value.isEmpty;
            if(isEmpty){
              emptyDateList.add(date);
            }
            return isEmpty;
          });

          // データがまだなかった場合（キャッシュにもDBにもデータがなかった場合）
          if (emptyDateList.isNotEmpty) {
            // 新しい日付の枠（空のタスク）を作る
            final Result<Map<Date, List<DDailyTask>>, Exception> newDateData =
                await _repository.createDailyTaskRecord(
                    dateList: emptyDateList);

            // 正常にフェッチできた場合、新しい日付の枠に作った空のタスクをストリームに流す
            switch (newDateData) {
              case Success(
                  value: final Map<Date, List<DDailyTask>> newDateValue
                ):
                _cacheHandler.update(newDateValue);
              case Failure(
                  exception: final Exception error,
                  methodName: final String? methodName,
                ):
                throw _fetchError(details: "$error", methodName: methodName);
            }
          }
          // 要求した日付のうち、データがDBにあった分をキャッシュする
          if(existingValue.isNotEmpty) {
            _cacheHandler.update(existingValue);
          }
        case Failure(
            exception: final Exception error,
            methodName: final String? methodName,
          ):
          throw _fetchError(details: "$error", methodName: methodName);
      }
    } catch (e) {
      // エラーを通知
      _notifyError(content: "$e");
      rethrow;
    }
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
