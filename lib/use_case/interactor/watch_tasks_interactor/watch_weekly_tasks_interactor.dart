import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/weekly_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_weekly_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 日単位タスクの監視フローを実装するクラス
class WatchWeeklyTasksInteractor implements WatchWeeklyTasksUseCase {
  // todo コンストラクタ
  WatchWeeklyTasksInteractor({
    required WeeklyTasksPresenter weeklyTasksPresenter,
    required WeeklyTasksCacheHandler weeklyTasksCacheHandler,
    required WeeklyTasksStreamHandler weeklyTasksStreamHandler,
    required DataRepository dataRepository,
    required NotificationService notificationService,
  })  : _presenter = weeklyTasksPresenter,
        _cacheHandler = weeklyTasksCacheHandler,
        _streamHandler = weeklyTasksStreamHandler,
        _repository = dataRepository,
        _notificator = notificationService;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final WeeklyTasksPresenter _presenter;

  /// 日単位タスクのキャッシュハンドラのインスタンス
  final WeeklyTasksCacheHandler _cacheHandler;

  /// ストリームを取り扱うクラスのインスタンス
  final WeeklyTasksStreamHandler _streamHandler;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// 通知送信先（[NotificationService]）のインスタンス
  final NotificationService _notificator;

  // todo 通知関連
  /// エラー通知メソッド
  void _notifyError({
    required String content,
    bool specifiesLayer = false,
  })
  // 折りたたみ用
  {
    _notificator.notifyInfo(
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
  void initAt(Date date) {
    try {
      // 初めての起動の場合
      if (!_isInitialized) {
        // 購読を開始する
        _initSubscription();
      }
      // 対象の日付のタスクデータの監視を開始する。
      _startWatching(date);
      _isInitialized = true;
    } catch (_) {
      _isInitialized = false;
    }
  }

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

  /// 対象日付（[targetDate]）を含む週の監視を開始するプライベートメソッド
  Future<void> _startWatching(Date targetDate) async {
    try {
      // すでにキャッシュされている週を取得する
      final List<UniqueWeek> cachedWeeks =
          _cacheHandler.getCachedWeeks(targetDate);
      // 当日を含む週の週単位タスクのフェッチを依頼し、データを受け取る
      final Result<List<DWeeklyTask>, Exception> fetched = await _repository
          .fetchWeeklyTasks(targetDate: targetDate, cachedWeeks: cachedWeeks);

      switch (fetched) {
        case Success(value: final List<DWeeklyTask> fetchedValueList):
        // 要求した日付のうち、データがDBにあった分をキャッシュする
          for (final value in fetchedValueList) {
            final UniqueWeek uniqueWeek = value.week;
            _cacheHandler.addEl(key: uniqueWeek, value: value);
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
  void _onData(Map<UniqueWeek, DWeeklyTask> newDataMap) {
    try {
      // データの型を変換する
      final Map<UniqueWeek, VWeeklyTask> convertedMap = _convertToV(newDataMap);
      // 変換後のデータを反映させる
      _publishWeeklyTasks(convertedMap);
    } catch (e) {
      _notifyError(content: "$e", specifiesLayer: true);
    }
  }

  /// [DWeeklyTask] の Map から [VWeeklyTask] の Map へ変換するプライベートメソッド
  Map<UniqueWeek, VWeeklyTask> _convertToV(Map<UniqueWeek, DWeeklyTask> dMap) {
    // ストリームに流すデータを組み込む枠
    final Map<UniqueWeek, VWeeklyTask> result = {};
    // データを日付ごとに変換していく
    for (final entry in dMap.entries) {
      final DWeeklyTask dWeeklyTask = entry.value;

      // リポジトリからのデータの場合は null はない
      if (dWeeklyTask.task == null) {
        throw Exception(
          "受信データに欠陥があります。\n（dWeeklyTask.task == null）",
        );
      }
      if (dWeeklyTask.isChecked == null) {
        throw Exception(
          "受信データに欠陥があります。\n（dWeeklyTask.isChecked == null）",
        );
      }
      if (dWeeklyTask.labelId == null) {
        throw Exception(
          "受信データに欠陥があります。\n（dWeeklyTask.labelId == null）",
        );
      }

      // データの型を変換する
      final VWeeklyTask convertedData = VWeeklyTask(
        task: dWeeklyTask.task!,
        week: dWeeklyTask.week,
        id: dWeeklyTask.id,
        isChecked: dWeeklyTask.isChecked!,
        labelId: dWeeklyTask.labelId!,
      );
      result[entry.key] = convertedData;
    }
    return result;
  }

  /// データを反映させるプライベートメソッド
  void _publishWeeklyTasks(Map<UniqueWeek, VWeeklyTask> newDataMap) {
    _presenter.handleWeeklyTasksUpdating(newDataMap);
  }
}
