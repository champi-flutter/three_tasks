import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_yearly_tasks_use_case.dart';
import 'package:three_tasks/use_case/output_boundary/yearly_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/stream_handler_interface/yearly_tasks_stream_handler.dart';

/// 年単位タスクの監視フローを実装するクラス
class WatchYearlyTasksInteractor
    with NotificationFromUseCase
    implements WatchYearlyTasksUseCase {
  // todo コンストラクタ
  WatchYearlyTasksInteractor({
    required YearlyTasksPresenter yearlyTasksPresenter,
    required YearlyTasksStreamHandler yearlyTasksStreamHandler,
    required DataRepository dataRepository,
    required NotificationService notificationService,
    required LoadingService loadingService,
  })  : _yearlyTasksPresenter = yearlyTasksPresenter,
        _streamHandler = yearlyTasksStreamHandler,
        _repository = dataRepository,
        notificationService = notificationService,
        _loadingService = loadingService;

  // todo 依存先
  /// 受信データを反映させるポートのインスタンス
  final YearlyTasksPresenter _yearlyTasksPresenter;

  /// ストリームを取り扱うクラスのインスタンス
  final YearlyTasksStreamHandler _streamHandler;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// ローディング機能呼び出し口
  final LoadingService _loadingService;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  /// このクラスがすでに起動済みかどうか
  bool _isInitialized = false;

  /// 対象日付（[targetYear]）のデータの監視フローを開始する
  ///
  /// - [initAt] 初起動時に、ストリームハンドラに購読の開始を依頼し、
  /// リスナー（[_onData]）を登録する
  ///
  /// - [_onData]: データ受信時の処理フロー
  ///     - データの型を変換する
  ///     - 変換後のデータを反映させる
  ///
  /// - [targetYear]の監視を開始する
  ///     - [targetYear] の年単位タスクのフェッチする
  ///     - フェッチされたデータはキャッシュハンドラによってストリームに流され、 [_onData]
  /// が起動する
  ///
  @override
  Future<void> initAt(int targetYear) =>
      // 最初のデータの受信が完了するまでローディングを起動する
  _loadingService.loadAsync(() async {
    try {
      // 初めての起動の場合
      if (!_isInitialized) {
        // 購読を開始する
        _initSubscription();
      }
      // 対象の日付のタスクデータの監視を開始する。
      await _initWatching(targetYear: targetYear);
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

  /// 対象日付（[targetYear]）の監視を開始するプライベートメソッド
  /// - [targetYear] の日単位タスクのフェッチする
  /// - フェッチされたデータはキャッシュハンドラによってストリームに流され、 [_onData]
  /// が起動する
  Future<void> _initWatching({required int targetYear}) async {
    try {
      // 当日の日単位タスクのフェッチする
      // （フェッチされたデータはキャッシュハンドラの output によってストリームに流され、
      // 下の _onData が起動する）
      final Result<void, Exception> result =
      await _repository.fetchYearlyTasks(targetYear: targetYear);
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
  Future<void> _onData(Map<int, TaskList<EYearlyTask>> newDataMap) =>
      _loadingService.loadAsync(() async {
        try {
          // 変換後のデータを反映させる
          await _publishYearlyTasks(newDataMap);
        } catch (e) {
          notifyError(content: "$e", specifiesLayer: true);
        }
      });

  /// データを反映させるプライベートメソッド
  Future<void> _publishYearlyTasks(
      Map<int, TaskList<EYearlyTask>> newDataMap,
      ) =>
      _yearlyTasksPresenter.handleYearlyTasksUpdating(newDataMap);

  /// todo このクラスの dispose
  @override
  void dispose() {
    _streamHandler.dispose();
  }
}
