import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/infrastructure/cache/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/cache/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク情報の変更を保存する処理フローを実装するクラス
class SaveTaskChangesInteractor
    with NotificationFromUseCase
    implements SaveTaskChangesUseCase {
  SaveTaskChangesInteractor({
    required DataRepository dataRepository,
    required DailyTasksCacheHandler dailyTasksCacheHandler,
    required NotificationService notificationService,
    required LoadingService loadingService,
    required WeeklyTasksCacheHandler weeklyTasksCacheHandler,
  })  : _dailyTasksCacheHandler = dailyTasksCacheHandler,_weeklyTasksCacheHandler = weeklyTasksCacheHandler,
        _repository = dataRepository,
        notificationService = notificationService,
        _loadingService = loadingService;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// 日単位タスクのキャッシュハンドラのインスタンス
  final DailyTasksCacheHandler _dailyTasksCacheHandler;

  /// 週単位タスクのキャッシュハンドラのインスタンス
  final WeeklyTasksCacheHandler _weeklyTasksCacheHandler;

  /// ローディングの呼び出し口
  final LoadingService _loadingService;

  /// 通知送信先（[NotificationUseCase]）のインスタンス
  @override
  final NotificationService notificationService;

  /// タスク情報の変更を保存する処理フロー
  ///   1. パラメータの [VTask] を [DTask] に変換する
  ///   2. リポジトリにテータの保存を依頼する
  ///   3. キャッシュハンドラの `update` を実行する
  ///
  /// 変更の反映の完了まで `await` する。
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  @override
  Future<Result<void, Exception>> execute({
    required List<TaskUpdateParameter> updateParameterList,
  }) =>
      _loadingService.loadAsync<Result<void, Exception>>(
        () async {
          try {
            if (updateParameterList.isEmpty) {
              throw Exception("無効な値です");
            }
            // リポジトリにデータの保存を依頼する
            final Result<void, Exception> result =
                await _repository.saveTaskChanges(
              updateParameterList: updateParameterList,
            );
            // 保存が成功した場合に、キャッシュを更新する
            switch (result) {
              case Success():
                // 反映完了まで await
                await _cacheChanges(newTaskList);
              case Failure(
                  exception: final Exception exc,
                  methodName: final String? methodName,
                ):
                final Exception fetchExc = fetchError(methodName: methodName);
                notifyError(content: "$exc\n$fetchExc");
            }
            return result;
          } catch (e) {
            notifyError(content: "$e", specifiesLayer: true);
            return Failure(Exception(e));
          }
        },
      );
}
