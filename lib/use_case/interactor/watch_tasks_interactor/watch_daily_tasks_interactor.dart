import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/data_type/s_task/s_task.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/infrastructure/cache/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/stream_handler_interface/daily_tasks_stream_handler.dart';

/// 日単位タスクの監視フローを実装するクラス
class WatchDailyTasksInteractor
    with NotificationFromUseCase
    implements WatchDailyTasksUseCase {
  // todo コンストラクタ
  WatchDailyTasksInteractor({
    required DailyTasksPresenter dailyTasksPresenter,
    required DailyTasksCacheHandler dailyTasksCacheHandler,
    required DailyTasksStreamHandler dailyTasksStreamHandler,
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _dailyTasksPresenter = dailyTasksPresenter,
        _cacheHandler = dailyTasksCacheHandler,
        _streamHandler = dailyTasksStreamHandler,
        _repository = dataRepository,
        notificationService = notificationService,
        _loadingService = loadingService;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final DailyTasksPresenter _dailyTasksPresenter;

  /// 日単位タスクのキャッシュハンドラのインスタンス
  final DailyTasksCacheHandler _cacheHandler;

  /// ストリームを取り扱うクラスのインスタンス
  final DailyTasksStreamHandler _streamHandler;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// ローディング機能呼び出し口
  final LoadingService _loadingService;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  /// このクラスがすでに起動済みかどうか
  bool _isInitialized = false;

  /// 監視を開始
  ///
  /// 【データ受信時の処理フロー】
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  @override
  Future<void> initAt(List<Date> dateList) =>
      _loadingService.loadAsync(() async {
        try {
          // 初めての起動の場合
          if (!_isInitialized) {
            // 購読を開始する
            _initSubscription();
          }
          // 対象の日付のタスクデータの監視を開始する。
          await _initWatching(dateList);
          _isInitialized = true;
        } catch (_) {
          _isInitialized = false;
        }
      });

  /// 購読を開始
  void _initSubscription() {
    try {
      _streamHandler.listen(
        onData: _onData,
      );
    } catch (_) {
      rethrow;
    }
  }

  /// 対象日付（[dateList]）の監視を開始するプライベートメソッド
  Future<void> _initWatching(List<Date> dateList) async {
    try {
      // 当日の日単位タスクのフェッチを依頼し、データを受け取る
      final Result<Map<Date, List<EDailyTask>>, Exception> result =
          await _repository.fetchDailyTasks(dateList: dateList);

      switch (result) {
        case Success(value: final Map<Date, List<EDailyTask>> existingValue):
          // 取得したマップからデータがない日付のエントリを除外し、その日付をリストに格納する
          final List<Date> emptyDateList = [];
          existingValue.removeWhere((date, value) {
            final bool isEmpty = value.isEmpty;
            if (isEmpty) {
              emptyDateList.add(date);
            }
            return isEmpty;
          });

          // データがまだなかった場合（キャッシュにもDBにもデータがなかった場合）
          if (emptyDateList.isNotEmpty) {
            // 新しい日付の枠（空のタスク）を作る
            final Result<Map<Date, List<EDailyTask>>, Exception> newDateData =
                await _repository.createDailyTaskRecord(
                    dateList: emptyDateList);

            // 正常にフェッチできた場合、新しい日付の枠に作った空のタスクをストリームに流す
            switch (newDateData) {
              case Success(
                  value: final Map<Date, List<EDailyTask>> newDateValue
                ):
                await _cacheHandler.update(newDateValue);
              case Failure(
                  exception: final Exception exc,
                  methodName: final String? methodName,
                ):
                final Exception fetchExc = fetchError(methodName: methodName);
                notifyError(content: "$exc\n$fetchExc");
            }
          }
          // 要求した日付のうち、データがDBにあった分をキャッシュする
          if (existingValue.isNotEmpty) {
            await _cacheHandler.update(existingValue);
          }
        case Failure(
            exception: final Exception exc,
            methodName: final String? methodName,
          ):
          final Exception fetchExc = fetchError(methodName: methodName);
          notifyError(content: "$exc\n$fetchExc");
      }
    } catch (e, st) {
      // エラーを通知
      notifyError(content: "$e\n$st");
      rethrow;
    }
  }

  /// データ受信時の処理フロー
  ///
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  Future<void> _onData(Map<Date, List<EDailyTask>> newDataMap) =>
      _loadingService.loadAsync(() async {
        try {
          // 変換後のデータを反映させる
          await _publishDailyTasks(newDataMap);
        } catch (e) {
          notifyError(content: "$e", specifiesLayer: true);
        }
      });

  /// データを反映させるプライベートメソッド
  Future<void> _publishDailyTasks(
      Map<Date, List<EDailyTask>> newDataMap) async {
    await _dailyTasksPresenter.handleDailyTasksUpdating(newDataMap);
  }

  /// todo このクラスの dispose
  @override
  void dispose() {
    _streamHandler.dispose();
  }
}
