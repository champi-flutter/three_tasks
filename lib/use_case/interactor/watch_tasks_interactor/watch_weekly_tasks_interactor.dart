import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_weekly_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/stream_handler_interface/weekly_tasks_stream_handler.dart';

/// 日単位タスクの監視フローを実装するクラス
class WatchWeeklyTasksInteractor
    with NotificationFromUseCase
    implements WatchWeeklyTasksUseCase {
  // todo コンストラクタ
  WatchWeeklyTasksInteractor({
    required WeeklyTasksPresenter weeklyTasksPresenter,
    required WeeklyTasksStreamHandler weeklyTasksStreamHandler,
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _presenter = weeklyTasksPresenter,
        _streamHandler = weeklyTasksStreamHandler,
        _repository = dataRepository,
        notificationService = notificationService,
        _loadingService = loadingService;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final WeeklyTasksPresenter _presenter;

  /// ストリームを取り扱うクラスのインスタンス
  final WeeklyTasksStreamHandler _streamHandler;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// 通知送信先（[NotificationService]）のインスタンス
  @override
  final NotificationService notificationService;

  /// ローディング機能呼び出し口
  final LoadingService _loadingService;

  /// このクラスがすでに起動済みかどうか
  bool _isInitialized = false;

  /// 監視を開始
  ///
  /// 【データ受信時の処理フロー】
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  @override
  Future<void> initAt(Date targetDate) => _loadingService.loadAsync(() async {
        try {
          // 初めての起動の場合
          if (!_isInitialized) {
            // 購読を開始する
            _initSubscription();
          }
          // 対象の日付のタスクデータの監視を開始する。
          _startWatching(targetDate);
          _isInitialized = true;
        } catch (e, st) {
          // エラーを通知
          notifyError(content: "$e\n$st", specifiesLayer: true);
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
      throw Exception("購読エラー: WatchWeeklyTasksUseCase._initSubscription");
    }
  }

  /// 対象日付（[targetDate]）を含む週の監視を開始するプライベートメソッド
  Future<void> _startWatching(Date targetDate) async {
    // 当日を含む週の週単位タスクのフェッチを依頼する（データはストリームが受け取る）
    final Result<void, Exception> fetchResult =
        await _repository.fetchWeeklyTasks(targetDate: targetDate);
    switch (fetchResult) {
      case Success():
        return;
      case Failure(
          exception: final Exception exc,
          methodName: final String? methodName,
        ):
        final fetchExc = fetchError(methodName: methodName);
        throw Exception("$exc\n$fetchExc");
    }
  }

  /// データ受信時の処理フロー
  ///
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  Future<void> _onData(
    Map<UniqueWeek, WeeklyTaskList<EWeeklyTask>> newDataMap,
  ) =>
      _loadingService.loadAsync(() async {
        try {
          // 変換後のデータを反映させる
          await _publishWeeklyTasks(newDataMap);
        } catch (e) {
          // プライベートだが、誰もキャッチできないので...
          notifyError(content: "データ受信時の処理のエラー: $e", specifiesLayer: true);
        }
      });

  /// データを反映させるプライベートメソッド
  Future<void> _publishWeeklyTasks(
    Map<UniqueWeek, WeeklyTaskList<EWeeklyTask>> newDataMap,
  )
  // 折りたたみ用
  async {
    try {
      await _presenter.handleWeeklyTasksUpdating(newDataMap);
    } catch (e, st) {
      throw Exception("データ反映時...\n$e\n$st");
    }
  }
}
