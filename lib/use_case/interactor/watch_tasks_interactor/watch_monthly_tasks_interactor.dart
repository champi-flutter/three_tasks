import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_monthly_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/monthly_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/stream_handler_interface/monthly_tasks_stream_handler.dart';

/// 日単位タスクの監視フローを実装するクラス
class WatchMonthlyTasksInteractor
    with NotificationFromUseCase
    implements WatchMonthlyTasksUseCase {
  // todo コンストラクタ
  WatchMonthlyTasksInteractor({
    required MonthlyTasksPresenter monthlyTasksPresenter,
    required MonthlyTasksStreamHandler monthlyTasksStreamHandler,
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _monthlyTasksPresenter = monthlyTasksPresenter,
        _streamHandler = monthlyTasksStreamHandler,
        _repository = dataRepository,
        notificationService = notificationService,
        _loadingService = loadingService;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final MonthlyTasksPresenter _monthlyTasksPresenter;

  /// ストリームを取り扱うクラスのインスタンス
  final MonthlyTasksStreamHandler _streamHandler;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// ローディング機能呼び出し口
  final LoadingService _loadingService;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  /// このクラスがすでに起動済みかどうか
  bool _isInitialized = false;

  /// 対象日付（[targetMonth]）のデータの監視フローを開始する
  ///
  /// - [initAt] 初起動時に、ストリームハンドラに購読の開始を依頼し、
  /// リスナー（[_onData]）を登録する
  ///
  /// - [_onData]: データ受信時の処理フロー
  ///     - データの型を変換する
  ///     - 変換後のデータを反映させる
  ///
  /// - [targetMonth]の監視を開始する
  ///     - [targetMonth] の日単位タスクのフェッチする
  ///     - フェッチされたデータはキャッシュハンドラによってストリームに流され、 [_onData]
  /// が起動する
  ///
  @override
  Future<void> initAt(Month targetMonth) =>
      // 最初のデータの受信が完了するまでローディングを起動する
      _loadingService.loadAsync(() async {
        try {
          // 初めての起動の場合
          if (!_isInitialized) {
            // 購読を開始する
            _initSubscription();
          }
          // 対象の日付のタスクデータの監視を開始する。
          await _initWatching(targetMonth: targetMonth);
          _isInitialized = true;
        } catch (e, st) {
          _isInitialized = false;
          // エラーを通知
          notifyError(content: "$e\n$st");
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

  /// 対象日付（[targetMonth]）の監視を開始するプライベートメソッド
  /// - [targetMonth] の日単位タスクのフェッチする
  /// - フェッチされたデータはキャッシュハンドラによってストリームに流され、 [_onData]
  /// が起動する
  Future<void> _initWatching({required Month targetMonth}) async {
    try {
      // 当日の日単位タスクのフェッチする
      // （フェッチされたデータはキャッシュハンドラの output によってストリームに流され、
      // 下の _onData が起動する）
      final Result<void, Exception> result =
          await _repository.fetchMonthlyTasks(targetMonth: targetMonth);
      switch (result) {
        // region
        case Success():
          break;
        case Failure(
            exception: final Exception exc,
            methodName: final String? methodName,
          ):
          final Exception fetchExc = fetchError(methodName: methodName);
          throw Exception("$exc\n$fetchExc");
        // endregion
      }
    } catch (e, st) {
      rethrow;
    }
  }

  /// データ受信時の処理フロー
  ///
  ///   1. データの型を変換する
  ///   2. 変換後のデータを反映させる
  ///
  Future<void> _onData(Map<Month, TaskList<EMonthlyTask>> newDataMap) =>
      _loadingService.loadAsync(() async {
        try {
          // 変換後のデータを反映させる
          await _publishMonthlyTasks(newDataMap);
        } catch (e) {
          notifyError(content: "$e", specifiesLayer: true);
        }
      });

  /// データを反映させるプライベートメソッド
  Future<void> _publishMonthlyTasks(
    Map<Month, TaskList<EMonthlyTask>> newDataMap,
  ) =>
      _monthlyTasksPresenter.handleMonthlyTasksUpdating(newDataMap);

  /// todo このクラスの dispose
  @override
  void dispose() {
    _streamHandler.dispose();
  }
}
