import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

class SaveWeeklyTaskChangesInteractor implements SaveWeeklyTaskChangesUseCase {
  SaveWeeklyTaskChangesInteractor({
    required SaveTaskChangesUseCase saveTaskChangesUseCase,
    required WeeklyTasksCacheHandler weeklyTasksCacheHandler,
    required DataRepository dataRepository,
    required NotificationService notificationService,
  })  : _weeklyTasksCacheHandler = weeklyTasksCacheHandler,
        _repository = dataRepository,
        _saveTaskChangesUseCase = saveTaskChangesUseCase,
        _notifier = notificationService;

  /// タスク変更保存フローへのアクセス
  final SaveTaskChangesUseCase _saveTaskChangesUseCase;

  /// 週単位タスクのキャッシュハンドラのインスタンス
  final WeeklyTasksCacheHandler _weeklyTasksCacheHandler;

  /// [DataRepository] のインスタンス
  final DataRepository _repository;

  /// 通知機能
  final NotificationService _notifier;

  @override
  Future<Result<void, Exception>> execute({
    required List<WeeklyTaskUpdateParameter> taskInfo,
  })
  // 折りたたみ用
  async {
    try {
      // 開始日変更保存用 Map（どのタスクの開始日がどの日になったか）
      // 【注意】key は、index ではなくタスクの ID 。
      final Map<int, Date> firstDateChangeSaveMap = {};

      // 開始日が変更されたタスクの、キャッシュする形
      // （対象の UniqueWeek に変更されるタスクの ID のリスト）
      final Map<UniqueWeek, List<int>> firstDateChangeCacheMap = {};

      // ID が -2 のタスクを抽出する枠
      // 対象 index の数だけ today を設置する
      final Map<int, Date> valuedPlaceholder = {};

      // // パラメータを SaveTaskChangesUseCase 用に変換する前に、週タスク特有の変更を
      // // 記録する（taskInfo の index と変更後 VWeeklyTask との Map ）
      // final Map<int, VWeeklyTask> parameterUpdateMap = {};

      int index = -1;
      // 特殊な変更を探索
      for (final taskParameter in taskInfo) {
        index++;
        final VWeeklyTask vTask = taskParameter.targetVTask;

        // 開始日が変更されたかどうか ----------------------------------------------
        final Date? newFirstDate = taskParameter.newStart;
        // 開始日が変更された場合
        if (newFirstDate != null) {
          // 変更を受けるタスクの ID
          final int changedTaskId = vTask.id;
          // 変更保存用に情報を組み込む
          firstDateChangeSaveMap[changedTaskId] = newFirstDate;
          // キャッシュの更新分にも格納する
          final UniqueWeek newWeek = UniqueWeek.fromDate(
            currentDate: newFirstDate,
            firstDate: newFirstDate,
          );
          // 変更キャッシュように組み込む
          firstDateChangeCacheMap.addNullable(
            key: newWeek,
            value: changedTaskId,
          );

          // パラメータの変更する
          taskInfo = taskInfo.copyVTaskWith(index)(
            week: newWeek,
          );
        }
        // --------------------------------------------------------------------

        // placeholder2 の状態から、パラメータが変更されたかどうか -------------------
        // ID が -2 かどうか
        final bool isPlaceholder2 = vTask.id == -2;
        // インスタンスのパラメータが placeholder2 から変化しているかどうか（@freezed）
        final bool isChanged =
            vTask != VWeeklyTask.placeholder2(vTask.week.firstDateOfWeek);
        if (isPlaceholder2 && isChanged) {
          valuedPlaceholder[index] = today;
        }

        // --------------------------------------------------------------------
      }

      // 特殊な変更を反映
      // 開始日の変更を反映させる -------------------------------------------------
      if (firstDateChangeSaveMap.isNotEmpty &&
          firstDateChangeCacheMap.isNotEmpty) {
        // 更新された分の保存を依頼する
        final _result = await _repository.updateWeeklyTasksFirstDate(
          idFirstDateMap: firstDateChangeSaveMap,
        );
        switch (_result) {
          case Success():
            for (final newCacheEntry in firstDateChangeCacheMap.entries) {
              final UniqueWeek keyWeek = newCacheEntry.key;
              // week が keyWeek になったタスクの ID リスト（ID が古い順）
              final List<int> orderedIdList = newCacheEntry.value..sort();
              _weeklyTasksCacheHandler.moveTo(
                keyWeek,
                orderedId: orderedIdList,
              );
            }
          case Failure(
              exception: final Exception exception,
              methodName: final String? methodName
            ):
            // todo エラーハンドリング（2026/08/28）＞＞
            throw exception;
        }
      }
      // ----------------------------------------------------------------------

      // placeholder2 に入れられた値を反映させる ----------------------------------
      if (valuedPlaceholder.isNotEmpty) {
        // valuedPlaceholder.keys と created.value （↓の newDTaskList ）の
        // リスト番号は同期する
        final created = await _reflectEntryInPlaceholder(valuedPlaceholder);
        switch (created) {
          case Success(value: final List<DWeeklyTask> newDTaskList):
            // valuedPlaceholder.keys（Iterable）と newDTaskList のリスト番号は
            // 同期している
            int linkedIndex = -1;

            // valuedPlaceholder の key は taskInfo の index
            for (final targetInfoIndex in valuedPlaceholder.keys) {
              linkedIndex++;

              // taskInfo の targetVTask の部分を変更して更新する
              taskInfo = taskInfo.copyVTaskWith(index)(
                id: newDTaskList[linkedIndex].id,
              );
            }
          case Failure():
          // todo エラーハンドリング（2026/08/28）＞＞
        }
      }
      // ----------------------------------------------------------------------

      // パラメータを、 SaveTaskChangesUseCase に対応する型に変換する
      final List<TaskUpdateParameter> convertedInfo = taskInfo
          .map<TaskUpdateParameter>((parameter) => parameter.generalize())
          .toList();

      // SaveTaskChangesUseCase を起動する
      await _saveTaskChangesUseCase.execute(taskInfo: convertedInfo);

      return Success(null);
    } catch (e) {
      // todo エラーハンドリング（2026/08/28）＞＞
      return Failure();
    }
  }

  /// placeholder2 に入れられた値を反映させる
  ///
  /// 引数（[valuedPlaceholder]）の key 順のリストが返される。
  Future<Result<List<DWeeklyTask>, Exception>> _reflectEntryInPlaceholder(
    Map<int, Date> valuedPlaceholder,
  )
  // 折りたたみ用
  async {
    if (valuedPlaceholder.isNotEmpty) {
      // 設置された today の数だけ新しいIDの枠を作る
      final Result<List<DWeeklyTask>, Exception> created =
          await _repository.createWeeklyTaskRecord(
              firstDateList: valuedPlaceholder.values.toList());

      switch (created) {
        case Success(value: final newTasks):
          // 新しいIDの枠をキャッシュに反映させる
          for (final task in newTasks) {
            final DataEntry<int, DWeeklyTask> dataEntry =
                (id: task.id, value: task);
            _weeklyTasksCacheHandler.update(key: task.week, valueMap: {
              // グループにおける index はわからないので負の値を指定する
              -1: dataEntry,
            });
          }
        case Failure():
          break;
      }
      return created;
    } else {
      return Success([]);
    }
  }
}
