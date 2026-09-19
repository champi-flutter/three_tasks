import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/daily_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/data_source_interface/data_source.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/converter/to_c_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/label_save_parameter/converter/to_label_save_parameter.dart';
import 'package:three_tasks/infrastructure/gateway/dto/label_save_parameter/label_save_parameter.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/converter/q_to_e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/converter/to_q_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/converter/unload_from_q_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/s_task/converter/to_s_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/s_task/s_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/task_save_parameter/converter/to_task_save_parameter.dart';
import 'package:three_tasks/infrastructure/gateway/dto/task_save_parameter/task_save_parameter.dart';
import 'package:three_tasks/infrastructure/type_extension/e_task_data_entry.dart';
import 'package:three_tasks/use_case/input_parameter/label_update_parameter/label_update_parameter.dart';
import 'package:three_tasks/use_case/input_parameter/task_update_parameter/task_update_parameter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

class DataRepositoryImpl
    with NotificationFromGateway
    implements DataRepository {
  // todo コンストラクタ
  DataRepositoryImpl({
    required DataSource dataSource,
    required NotificationService notificationService,
    required DailyTasksCacheHandler dailyTasksCacheHandler,
    required WeeklyTasksCacheHandler weeklyTasksCacheHandler,
  })
      : _dailyTasksCacheHandler = dailyTasksCacheHandler,
        _weeklyTasksCacheHandler = weeklyTasksCacheHandler,
        _dataSource = dataSource,
        _notificator = notificationService;

  // todo 依存先
  /// [DataSource] の呼び出し口
  final DataSource _dataSource;

  /// 日単位タスクのキャッシュハンドラの呼び出し口
  final DailyTasksCacheHandler _dailyTasksCacheHandler;

  /// 週単位タスクのキャッシュハンドラの呼び出し口
  final WeeklyTasksCacheHandler _weeklyTasksCacheHandler;

  /// 通知機能の呼び出し口
  final NotificationService _notificationService;

  // todo 通知関連
  /// エラー通知メソッド
  void _notifyQueryError({
    required Exception error,
    required String? methodName,
  })
  // 折りたたみ用
  {
    final String content = "$error\n（$methodName）";
    _notificationService.notifyInfo(
      layer: NotificationFrom.gateway,
      type: NotificationType.error,
      notification: content,
    );
  }

  // todo キャッシュ
  /// 「ラベル化したタスク」のキャッシュ
  List<DLabeledTask> _allLabeledTasks = [];

  /// 「ラベル化したタスク」のキャッシュのストリームを管理するコントローラ
  final StreamController<List<DLabeledTask>> _labeledTasksController =
  BehaviorSubject<List<DLabeledTask>>();

  /// 「ラベル化したタスク」のキャッシュが更新された際に、その情報を流すストリーム
  @override
  Stream<List<DLabeledTask>> get labeledTasksStream =>
      _labeledTasksController.stream;

  /// ラベル化タスクリストの `dailyIdList` を変更して、ストリームに流す
  ///
  /// [newId] か [removedId] のどちらかは必ず指定すること。
  void _streamLabeledTasksUpdatedDailyId({
    required int labelId,
    int? newId,
    int? removedId,
  })
  // 折りたたみ用
  {
    // どちらかは必ず指定するようにする
    assert(
    (newId != null || removedId != null) &&
        (newId == null || removedId == null),
    "パラメータが正しく指定されていません（_streamLabeledTasksUpdatedDailyId）。",
    );
    // キャッシュを変換して再代入
    _allLabeledTasks = _allLabeledTasks.map((DLabeledTask labeledTask) {
      // 該当 ID のラベルを更新
      if (labeledTask.labelId == labelId) {
        final List<int> newIdList = [...labeledTask.dailyIdList];
        // newId を指定した場合
        if (newId != null) {
          newIdList.add(newId);
        }
        // removedId を指定した場合
        if (removedId != null) {
          newIdList.remove(removedId);
        }
        return labeledTask.copyWith(
          dailyIdList: newIdList,
        );
      } else {
        return labeledTask;
      }
    }).toList();
  }

  /// ラベル化タスクリストの `weeklyIdList` を変更して、ストリームに流す
  ///
  /// [newId] か [removedId] のどちらかは必ず指定すること。
  void _streamLabeledTasksUpdatedWeeklyId({
    required int labelId,
    int? newId,
    int? removedId,
  })
  // 折りたたみ用
  {
    // どちらかは必ず指定するようにする
    assert(
    (newId != null || removedId != null) &&
        (newId == null || removedId == null),
    "パラメータが正しく指定されていません（_streamLabeledTasksUpdatedWeeklyId）。",
    );
    // キャッシュを変換して再代入
    _allLabeledTasks = _allLabeledTasks.map((DLabeledTask labeledTask) {
      // 該当 ID のラベルを更新
      if (labeledTask.labelId == labelId) {
        final List<int> newIdList = [...labeledTask.weeklyIdList];
        // newId を指定した場合
        if (newId != null) {
          newIdList.add(newId);
        }
        // removedId を指定した場合
        if (removedId != null) {
          newIdList.remove(removedId);
        }
        return labeledTask.copyWith(
          weeklyIdList: newIdList,
        );
      } else {
        return labeledTask;
      }
    }).toList();
    // ラベル化タスクのキャッシュの更新を通知
    _labeledTasksController.add([..._allLabeledTasks]);
  }

  /// ラベル化タスクリストの `monthlyIdList` を変更して、ストリームに流す
  ///
  /// [newId] か [removedId] のどちらかは必ず指定すること。
  void _streamLabeledTasksUpdatedMonthlyId({
    required int labelId,
    int? newId,
    int? removedId,
  })
  // 折りたたみ用
  {
    // どちらかは必ず指定するようにする
    assert(
    newId != null || removedId != null,
    "パラメータが正しく指定されていません（_streamLabeledTasksUpdatedMonthlyId）。",
    );
    // キャッシュを変換して再代入
    _allLabeledTasks = _allLabeledTasks.map((DLabeledTask labeledTask) {
      // 該当 ID のラベルを更新
      if (labeledTask.labelId == labelId) {
        final List<int> newIdList = [...labeledTask.monthlyIdList];
        // newId を指定した場合
        if (newId != null) {
          newIdList.add(newId);
        }
        // removedId を指定した場合
        if (removedId != null) {
          newIdList.remove(removedId);
        }
        return labeledTask.copyWith(
          monthlyIdList: newIdList,
        );
      } else {
        return labeledTask;
      }
    }).toList();
    // ラベル化タスクのキャッシュの更新を通知
    _labeledTasksController.add([..._allLabeledTasks]);
  }

  /// ラベル化タスクリストの `YearlyIdList` を変更して、ストリームに流す
  ///
  /// [newId] か [removedId] のどちらかは必ず指定すること。
  void _streamLabeledTasksUpdatedYearlyId({
    required int labelId,
    int? newId,
    int? removedId,
  })
  // 折りたたみ用
  {
    // どちらかは必ず指定するようにする
    assert(
    newId != null || removedId != null,
    "パラメータが正しく指定されていません（_streamLabeledTasksUpdatedYearlyId）。",
    );
    // キャッシュを変換して再代入
    _allLabeledTasks = _allLabeledTasks.map((DLabeledTask labeledTask) {
      // 該当 ID のラベルを更新
      if (labeledTask.labelId == labelId) {
        final List<int> newIdList = [...labeledTask.yearlyIdList];
        // newId を指定した場合
        if (newId != null) {
          newIdList.add(newId);
        }
        // removedId を指定した場合
        if (removedId != null) {
          newIdList.remove(removedId);
        }
        return labeledTask.copyWith(
          yearlyIdList: newIdList,
        );
      } else {
        return labeledTask;
      }
    }).toList();
    // ラベル化タスクのキャッシュの更新を通知
    _labeledTasksController.add([..._allLabeledTasks]);
  }

  // todo フェッチ
  /// 「ラベル化したタスク」のキャッシュ初期化メソッド
  Future<void> _initLabeledTasks() async {
    // DB から「ラベル化したタスク」のリストを取得
    final Result<List<DLabeledTask>, Exception> result =
    await _dataSource.getAllLabeledTasks();
    switch (result) {
      case Success(value: final List<DLabeledTask> value):
      // キャッシュを更新
        _allLabeledTasks = [...value];
        // キャッシュの更新を通知
        _labeledTasksController.add([..._allLabeledTasks]);

    // エラーハンドリング
      case Failure(
      exception: final Exception error,
      methodName: final String? methodName
      ):
        _notifyQueryError(error: error, methodName: methodName);
    }
  }

  /// ラベルデータをフェッチするメソッド
  @override
  Future<Result<void, Exception>> fetchLabel() async {
    try {
      // todo キャッシュを確認（2026/09/09）＞＞
      final Result<void, Exception> result = ;
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "fetchLabel");
    }
  }

  /// 日単位タスクフェッチメソッド
  ///  - [DailyTasksCacheHandler] にすでにキャッシュされている分を確認する
  ///  - キャッシュにない分のデータを [DataSource] から取得する
  ///  - 取得した分のデータを加えたキャッシュを更新する
  ///
  @override
  Future<Result<void, Exception>> fetchDailyTasks({
    required Date targetDate,
  })
  // 折りたたみ用
  async {
    try {
      // targetDate のデータがキャッシュに存在するかどうかを取得する
      final bool isCached = _dailyTasksCacheHandler.isCachedAt(targetDate);

      // キャッシュに存在する場合、その状態で output を呼び出す
      if (isCached) {
        await _dailyTasksCacheHandler.outputCurrentCache();
        return Success(null);
      }
      // そうでない場合
      else {
        // 日付を指定して日単位タスクをフェッチ
        final Result<List<FDailyTask>, Exception> result =
        await _dataSource.getDailyTasksByDate(
          targetDateInt: targetDate.toIntIdentifier(),
        );

        // 取得した分のデータを加えたキャッシュを更新する
        switch (result) {
        // region
          case Success(
          value: final List<FDailyTask> resultList,
          methodName: final String? methodName,
          ):
          // DailyTasksCacheHandler.update の valueMap に当てはめる Map
            final Map<int, DataEntry<int, EDailyTask>> valueMap = {};

            // データがまだなかった場合（キャッシュにもDBにもデータがなかった場合）
            if (resultList.isEmpty) {
              // 新しい日付の枠（空のタスク）を作って、受け取る
              final Result<List<FDailyTask>, Exception> newDateData =
              await _createDailyTaskRecord(targetDate: targetDate);

              // 正常にフェッチできた場合、新しい日付の枠に作った空のタスクをストリームに流す
              switch (newDateData) {
              // region
                case Success(
                value: final List<FDailyTask> newDateRecord,
                ):
                // valueMap に 3 つの枠の情報を組み込む
                  for (int i = 0; i < 3; i++) {
                    // List<FDailyTask> を DataEntry<int, EDailyTask> に変換
                    // する拡張メソッドを用いる
                    valueMap[i] = newDateRecord.toDataEntry(i);
                  }
                case Failure(
                exception: final Exception exc,
                ):
                  throw exc;
              // endregion
              }
            }
            // データソースにあったデータをキャッシュする
            else {
              // 要素数が 3 以外の場合はエラー
              if (resultList.length != 3) {
                final Exception queryExc = queryError(methodName: methodName);
                throw Exception(
                  "$queryExc\nデータの数が不適当です。（resultList.length = ${resultList
                      .length}）",
                );
              }
              // valueMap に 3 つのタスクの情報を組み込む
              for (int i = 0; i < 3; i++) {
                // List<FDailyTask> を DataEntry<int, EDailyTask> に変換
                // する拡張メソッドを用いる
                valueMap[i] = resultList.toDataEntry(i);
              }
            }
            if (valueMap.isNotEmpty) {
              // キャッシュを更新する
              await _dailyTasksCacheHandler.update(
                key: targetDate,
                valueMap: valueMap,
              );
              return Success(null);
            } else {
              throw Exception(
                "構文エラー: valueMap に情報が組み込まれていません。（DataRepository.fetchDailyTasks）",
              );
            }
          case Failure(
          exception: final Exception exc,
          methodName: final String? methodName,
          ):
            final Exception queryExc = queryError(methodName: methodName);
            throw Exception("$exc\n$queryExc");
        // endregion
        }
      }
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "fetchDailyTasks");
    }
  }

  /// 週単位タスクフェッチメソッド
  ///  - [WeeklyTasksCacheHandler] にすでにキャッシュされている分を確認する
  ///  - キャッシュにない分のデータを [DataSource] から取得する
  ///  - 取得した分のデータを加えたキャッシュを更新する
  ///
  @override
  Future<Result<void, Exception>> fetchWeeklyTasks({
    required Date targetDate,
  })
  // 折りたたみ用
  async {
    try {
      // すでにキャッシュされている週を取得する
      final List<UniqueWeek> cachedWeeks =
      _weeklyTasksCacheHandler.getCachedWeeks(
        targetDate,
      );
      // キャッシュ済みの週のリストを、指定日と対象週の開始日との差分のリストに変換する
      final List<int> exclusionDiffs = cachedWeeks
          .map<int>(
              (week) =>
          targetDate
              .difference(week.firstDateOfWeek)
              .inDays)
          .toList();

      // キャッシュにない分の週単位タスクをデータソースから取得する
      final Result<List<QWeeklyTask>, Exception> result =
      await _dataSource.getWeeklyTasksByDate(
        targetDate: targetDate,
        exclusionDiffs: exclusionDiffs,
      );

      // 取得した分のデータを加えたキャッシュを更新する
      switch (result) {
      // region
        case Success(value: final List<QWeeklyTask> successList):
        // キャッシュハンドラに渡す Map （UniqueWeek に対応する DataEntry を格納する）
          final Map<UniqueWeek, List<DataEntry<int, CWeeklyTask>>> updateMap =
          {};
          // // あとで DataEntry にする値の組み合わせ
          //   final Map<UniqueWeek, List<CWeeklyTask>> dataEntryMap = {};
          // 要求した日付のうち、データがDBにあった分をキャッシュする
          for (final QWeeklyTask qTask in successList) {
            // 対象の UniqueWeek を取得する
            final UniqueWeek uniqueWeek = UniqueWeek.fromDate(
              currentDate: qTask.firstDateInt.toDate(),
              firstDate: qTask.firstDateInt.toDate(),
            );
            // QWeeklyTask から値を取り出して DataEntry（ID と CTask のセット）
            // に組み込む
            final DataEntry<int, CWeeklyTask> dataEntry = DataEntry(
              id: qTask.id,
              value: CWeeklyTask(
                title: qTask.title,
                week: UnloadFromQTask.uniqueWeek(qTask),
                id: qTask.id,
                isChecked: qTask.isChecked,
                labelId: qTask.labelId,
              ),
            );
            // キャッシュハンドラに渡す Map に上の DataEntry を追加する
            updateMap.addNullable(key: uniqueWeek, value: dataEntry);
          }
          // 対象 UniqueWeek に
          // （for 文の入れ子になっているが、対象 UniqueWeek が数個、それぞれの値が最大で
          // 3つなので実質的な計算量は少なめ）
          for (final updateEntry in updateMap.entries) {
            final UniqueWeek updateKey = updateEntry.key;
            final updateDataEntryList = updateEntry.value;
            // _weeklyTasksCacheHandler.update の valueMap に入れる Map
            final Map<int, DataEntry<int, CWeeklyTask>> valueMap = {};
            // 探索するリストの要素を追加する valueMap の key
            // （キャッシュのグループにおける index）
            // グループにおける index はわからないので負の値を指定する
            int invertIndex = 0;
            for (final updateDataEntry in updateDataEntryList) {
              valueMap[invertIndex] = updateDataEntry;
              invertIndex--;
            }
            _weeklyTasksCacheHandler.update(key: updateKey, valueMap: valueMap);
          }
          return Success(null);
        case Failure(
        exception: final Exception exc,
        methodName: final String? methodName,
        ):
          throw queryError(details: "$exc", methodName: methodName);
      // endregion
      }
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "fetchWeeklyTasks");
    }
  }

  // /// 週単位タスクフェッチメソッド
  // ///
  // /// DB からデータを取得して、ストリームに流す。
  // ///
  // /// 基本はキャッシュを参照するが、参照したい日付（[firstDateList]）がキャッシュにない場合
  // /// にこのメソッドを呼び出す。
  // @override
  // Future<Result<void, Exception>> fetchWeeklyTaskList({
  //   required List<Date> firstDateList,
  // })
  // // 折りたたみ用
  // async {
  //   // 日付を指定して週単位タスクをフェッチ
  //   final Result<List<DWeeklyTask>, Exception> result =
  //       await _dataSource.getWeeklyTasksByDate(firstDateList: firstDateList);
  //
  //   switch (result) {
  //     case Success(value: final List<DWeeklyTask> resultValue):
  //       // ストリームにデータを流す（週タスクは空を許容）
  //       _streamNewWeeklyTasks(resultValue);
  //
  //     // エラーハンドリング
  //     case Failure(
  //         exception: final Exception error,
  //         methodName: final String? methodName
  //       ):
  //       _notifyQueryError(error: error, methodName: methodName);
  //   }
  //   return result;
  // }

  // todo 書き換え

  /// 日単位タスクの新しい日付の枠を作成するメソッド
  Future<Result<List<FDailyTask>, Exception>> _createDailyTaskRecord({
    required Date targetDate,
  })
  // 折りたたみ用
  async {
    // データソースに新しい日付の枠（レコード）の作成を要求する
    final Result<List<FDailyTask>, Exception> result =
    await _dataSource.createDailyTaskRecord(
      targetDateInt: targetDate.toIntIdentifier(),
    );

    switch (result) {
      case Success():
        return result;
      case Failure(
      exception: final Exception error,
      methodName: final String? methodName
      ):
        return Failure(
          queryError(details: "$error", methodName: methodName),
          methodName: "createDailyTaskRecord",
        );
    }
  }

  /// クエリエラーの [Exception] のテンプレート
  Exception _queryError({
    String? details,
    required String? methodName,
  }) =>
      Exception("QUERY_ERROR: DataSource.${methodName ?? "??"}\n$details");

  /// タスク情報変更保存メソッド
  @override
  Future<Result<void, Exception>> saveTaskChanges({
    required TaskList<ETask> updatedETaskList,
  })
  // 折りたたみ用
  async {
    // Entity のリストを保存用 DTO のリストに変換する
    final TaskList<QTask> newTaskList = updatedETaskList.mapValues<QTask>(
        ToQTask.toQTask).toListAs<TaskList<QTask>>(
        TaskList.fromIterable);
    // データソースに保存する
    final Result<void, Exception> result = await _dataSource.saveTaskChanges(
      // TaskList から普通の List に変換してから渡す
      newTaskList: newTaskList.toValueList(),
    );
    // 保存が成功した場合に、キャッシュを更新する
    switch (result) {
      case Success():
      // 反映完了まで await
        await _cacheChanges(updatedETaskList);
        return Success(null);
      case Failure(
      exception: final Exception exc,
      methodName: final String? methodName,
      ):
        final Exception queryExc = queryError(methodName: methodName);
        return Failure(Exception("$exc\n$queryExc"));
    }
  }

  /// 週タスク固有の情報変更保存メソッド
  @override
  Future<Result<void, Exception>> saveWeeklyTaskChanges({
    required WeeklyTaskList<EWeeklyTask> updatedETaskList,
  })
  // 折りたたみ用
  async {
    // placeholder2 に値が入った場合は、新しくレコードを追加する
    final applied = await _applyPlaceholder2(eTaskList: updatedETaskList,);
    switch (applied) {
    // region
      case Success(value: final WeeklyTaskList<EWeeklyTask> adaptedETaskList):
      // 適応後の Entity のリストを保存用 DTO のリストに変換する
        final List<QWeeklyTask> qTaskList = adaptedETaskList.mapValues<
            QWeeklyTask>(
            ToQTask.toQWeeklyTask).toList();
        // データソースに保存する
        final Result<void, Exception> result = await _dataSource
            .saveTaskChanges(
          // TaskList から普通の List に変換してから渡す
          newTaskList: qTaskList,
        );
        // 保存が成功した場合に、キャッシュを更新する
        switch (result) {
          case Success():
          // 反映完了まで await
            await _cacheChanges(updatedETaskList);
            return Success(null);
          case Failure(
          exception: final Exception exc,
          methodName: final String? methodName,
          ):
            final Exception queryExc = queryError(methodName: methodName);
            return Failure(Exception("$exc\n$queryExc"));
        }
      case Failure(
      exception: final Exception exc,
      ):
        return Failure(Exception("$exc"));
    // endregion
    }
  }

  /// placeholder2 に入れられた値を反映し、更新されたタスクリストを返す
  Future<Result<WeeklyTaskList<EWeeklyTask>, Exception>> _applyPlaceholder2({
    required WeeklyTaskList<EWeeklyTask> eTaskList,
  })
  // 折りたたみ用
  async {
    // 値が入れられた placeholder2 を抽出する
    final List<ListEntry<EWeeklyTask>> valuedPlaceholders = eTaskList.where((
        eTask) => eTask.value.canReplace).toList();
    // placeholder2 に値が入れられていなかった場合は、早期リターン
    if (valuedPlaceholders.isEmpty) {
      return Success(eTaskList);
    }

    //　オリジナルをコピーして、返すリストの新しい枠を生成する
    final WeeklyTaskList<EWeeklyTask> updatedTaskList = eTaskList.deepCopy;

    // valuedPlaceholder.keys と created.value （↓の newDTaskList ）の
    // リスト番号は同期する
    final Result<Map<int, int>,
        Exception> createdMap = await _createIdWithPlaceholder2(
      valuedPlaceholders,
    );
    switch (createdMap) {
      case Success(value: final Map<int, int> successMap):
        for (final entry in successMap.entries) {
          final int index = entry.key;
          final int createdId = entry.value;
          final originalETask = updatedTaskList[index].value;
          updatedTaskList.setAt(
            index,
            originalETask.replacePlaceholder2(createdId),
          );
        }
        return Success(updatedTaskList);
      case Failure(
      exception: final Exception exc,
      ):
        return Failure(Exception("$exc"));
    }
  }

  /// 週単位タスクの新しい枠を作成するメソッド
  ///
  /// [WeeklyTaskList] における index と、生成した ID の Map を返す。
  Future<Result<Map<int, int>, Exception>> _createIdWithPlaceholder2(
      List<ListEntry<EWeeklyTask>> valuedPlaceholders,)
  // 折りたたみ用
  async {
    if (valuedPlaceholders.isNotEmpty) {
      final List<int> indexList = valuedPlaceholders.map((entry) => entry.index)
          .toList();

      final Result<Map<int, int>, Exception> created =
      await _dataSource.createWeeklyTaskRecord(indexList: indexList);

      switch (created) {
      // region
        case Success(value: final successMap):
          return Success(successMap);
        case Failure(
        exception: final Exception exc,
        methodName: final String? methodName,
        ):
          final Exception queryExc = queryError(methodName: methodName);
          return Failure(Exception("$exc\n$queryExc"));
      // endregion
      }
    } else {
      return Success({});
    }
  }

  /// 変更をキャッシュするプライベートメソッド
  ///
  /// [parameterList] のインデックスに対応した場所にキャッシュされる。
  ///
  /// 変更の反映の完了まで await する。
  Future<void> _cacheChanges(TaskListBase<ETask> updatedETaskList) async {
    // Date と日単位タスクリストデータ（index と DTO との Map ）との Map
    final Map<Date, Map<int, DataEntry<int, CDailyTask>>> resultDay = {};
    // 週単位の値
    final Map<UniqueWeek, Map<int, DataEntry<int, CWeeklyTask>>> resultWeek =
    {};

    for (final newETaskEntry in updatedETaskList) {
      // このタスクのインデックス（配置）
      final int index = newETaskEntry.index;
      // タスク本体
      final ETask newETask = newETaskEntry.value;
      switch (newETask) {
        case EDailyTask():
          final DataEntry<int, CDailyTask> dataEntry = DataEntry(
            id: newETask.id,
            // エンティティをキャッシュ用 DTO に変換して格納する
            value: ToCTask.toCDailyTask<EDailyTask>(newETask),
          );
          // 対象日付の key のリストに index と 日単位タスク の組み合わせを追加する
          resultDay.addNullable(
            key: newETask.date,
            subKey: index, // 配置を指定
            value: dataEntry,
          );
        case EWeeklyTask():
          final DataEntry<int, CWeeklyTask> dataEntry = DataEntry(
            id: newETask.id,
            // エンティティをキャッシュ用 DTO に変換して格納する
            value: ToCTask.toCWeeklyTask<EWeeklyTask>(newETask),
          );
          // 対象日付の key のリストに index と 週単位タスク の組み合わせを追加する
          resultWeek.addNullable(
            key: newETask.week,
            subKey: index,
            value: dataEntry,
          );
        case EMonthlyTask():
          _;
        case EYearlyTask():
          _;
      }
    }
    // 日単位の分があればキャッシュを更新
    if (resultDay.isNotEmpty) {
      // key は通常1つのみ
      for (final entry in resultDay.entries) {
        // 反映まで await
        await _dailyTasksCacheHandler.update(
          key: entry.key,
          valueMap: entry.value,
        );
      }
    }
    // 週単位の分があればキャッシュを更新
    if (resultWeek.isNotEmpty) {
      // key は通常1つのみ
      for (final entry in resultWeek.entries) {
        // 週を key にして更新する（反映まで await）
        await _weeklyTasksCacheHandler.update(
          key: entry.key,
          valueMap: entry.value,
        );
      }
    }
    // todo 月、年単位の場合のキャッシュ（2026/08/06）＞＞
  }

  /// 週単位タスクの firstDate を書き換えるメソッド
  @override
  Future<Result<void, Exception>> updateWeeklyTasksFirstDate({
    required Map<int, Date> idFirstDateMap,
  }) async {
    final Result<void, Exception> result = await _dataSource
        .updateWeeklyTasksFirstDate(idFirstDateMap: idFirstDateMap);
    switch (result) {
      case Success():
        break;
      case Failure(
      exception: final Exception exc,
      methodName: final String? methodName,
      ):
        final Exception queryExc = queryError(methodName: methodName);
        return Failure(Exception("$exc\n$queryExc"));
    }
    return result;
  }

  // /// タスクタイトル保存メソッド
  // ///
  // /// 引数 [newTaskMap] は、key が ID, value がタスクタイトルの Map 。
  // ///
  // /// 日付が揃っていることが前提。
  // @override
  // Future<Result<void, Exception>> saveTaskTitles({
  //   required List<DTask> newTaskList,
  // })
  // // 折りたたみ用
  // async {
  //   final Result<void, Exception> result = await _dataSource.saveTaskTitles(
  //     newTaskList: newTaskList,
  //   );
  //   switch (result) {
  //     case Success():
  //       // 日単位の値
  //       final Map<Date, List<DDailyTask>> resultDay = {};
  //       // 週単位の値
  //       final List<DWeeklyTask> resultWeek = [];
  //       for (DTask task in newTaskList) {
  //         switch (task) {
  //           case DDailyTask():
  //             // 対象日付の key のリストに task を追加
  //             resultDay.addNullable(key: task.date, value: task);
  //           case DWeeklyTask():
  //             // 週単位の値に追加
  //             resultWeek.add(task);
  //           case DMonthlyTask():
  //             _;
  //           case DYearlyTask():
  //             _;
  //         }
  //       }
  //       // 日単位の分があればストリームに流す
  //       if (resultDay.isNotEmpty) {
  //         _streamNewDailyTasks({...resultDay});
  //       }
  //       // 週単位の分があればストリームに流す
  //       if (resultWeek.isNotEmpty) {
  //         _streamNewWeeklyTasks([...resultWeek]);
  //       }
  //     // todo 月、年単位の場合のストリーム（2026/06/30）＞＞
  //     case Failure(exception: Exception error, methodName: String? methodName):
  //     // todo エラーハンドリング（2026/05/23）＞＞
  //   }
  //   return result;
  // }

  // /// タスクのチェック変更保存メソッド
  // @override
  // Future<Result<void, Exception>> saveCheck({required DTask newTask}) async {
  //   final readDataSource = _ref.read(dataSourceProvider);
  //   final Result<void, Exception> result =
  //       await readDataSource.saveCheck(newTask: newTask);
  //   switch (result) {
  //     case Success():
  //       break;
  //     case Failure(exception: Exception error, methodName: String? methodName):
  //     // todo エラーハンドリング（2026/05/23）＞＞
  //   }
  //   return result;
  // }

  /// ラベル情報変更保存メソッド
  @override
  Future<Result<void, Exception>> saveLabelChanges({
    required LabelUpdateParameter updateParameter,
  })
  // 折りたたみ用
  async {
    // 保存用パラメータに変換する
    final LabelSaveParameter saveParameter = ToLabelSaveParameter
        .toSaveParameter(updateParameter);
  }

  /// 新しいラベルの枠を作成し、その ID を返す
  @override
  Future<Result<int, Exception>> createNewLabel({
    required String title,
  })
  // 折りたたみ用
  async {
    final Result<int, Exception> result =
    await _dataSource.createNewLabel(title: title);

    switch (result) {
      case Success(value: final DLabeledTask label):
        return label.labelId;
      case Failure(exception: Exception error, methodName: String? methodName):
      // todo エラーハンドリング（2026/05/23）＞＞
    }
  }

  /// タスクラベル化メソッド
  ///
  /// 新規ラベルの ID を返す。
  ///
  /// 例外が発生した場合は、`null` を返す。
  @override
  Future<int?> labeling({required DTask dTask}) async {
    switch (dTask) {
    // DTask.task は書き換えメソッドの整合性チェックのため、nullable だが、
    // 書き換え以外では null はない
      case DDailyTask(
      task: final String? task,
      id: final int id,
      ):
      // DB にラベル化を依頼し、DLabeledTask を取得
        final Result<DLabeledTask, Exception> result =
        await _dataSource.labelDailyTask(label: task!, newId: id);

        switch (result) {
          case Success(value: final DLabeledTask resultValue):
          // 日単位タスクのキャッシュを更新して、ストリームに流す
          // 仕様上、必ず存在すると思われるが一応例外処理
            try {
              _streamUpdatedDailyTasks(
                date: dTask.date,
                taskId: id,
                labelId: resultValue.labelId,
              );
            } catch (e) {
              // todo エラーハンドリング（2026/06/30）＞＞
            }
            // ラベル化タスクのキャッシュを更新
            _allLabeledTasks.add(resultValue);
            // ラベル化タスクのキャッシュの更新を通知
            _labeledTasksController.add([..._allLabeledTasks]);
            // DB からの戻り値の .labelId を返す
            return resultValue.labelId;
          case Failure(
          exception: Exception error,
          methodName: String? methodName
          ):
            return null;
        // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DWeeklyTask(
      task: final String? task,
      id: final int id,
      ):
      // DB にラベル化を依頼し、DLabeledTask を取得
        final Result<DLabeledTask, Exception> result =
        await _dataSource.labelWeeklyTask(label: task!, newId: id);

        switch (result) {
          case Success(value: final DLabeledTask resultValue):
          // 週単位タスクのキャッシュを更新して、ストリームに流す
            _streamUpdatedWeeklyTasks(taskId: id, labelId: resultValue.labelId);
            // ラベル化タスクのキャッシュを更新
            _allLabeledTasks.add(resultValue);
            // ラベル化タスクのキャッシュの更新を通知
            _labeledTasksController.add([..._allLabeledTasks]);
            // DB からの戻り値の .labelId を返す
            return resultValue.labelId;
          case Failure(
          exception: Exception error,
          methodName: String? methodName,
          ):
            return null;
        // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DMonthlyTask(
      task: final String? task,
      id: final int id,
      ):
      // DB にラベル化を依頼し、DLabeledTask を取得
        final Result<DLabeledTask, Exception> result =
        await _dataSource.labelMonthlyTask(label: task!, newId: id);

        switch (result) {
          case Success(value: final DLabeledTask resultValue):
          // todo 月単位タスクのキャッシュを更新して、ストリームに流す（2026/06/30）＞＞

          // ラベル化タスクのキャッシュを更新
            _allLabeledTasks.add(resultValue);
            // ラベル化タスクのキャッシュの更新を通知
            _labeledTasksController.add([..._allLabeledTasks]);
            // DB からの戻り値の .labelId を返す
            return resultValue.labelId;
          case Failure(
          exception: Exception error,
          methodName: String? methodName
          ):
            return null;
        // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DYearlyTask(
      task: final String? task,
      id: final int id,
      ):
      // DB にラベル化を依頼し、DLabeledTask を取得
        final Result<DLabeledTask, Exception> result =
        await _dataSource.labelYearlyTask(label: task!, newId: id);

        switch (result) {
          case Success(value: final DLabeledTask resultValue):
          // todo 年単位タスクのキャッシュを更新して、ストリームに流す（2026/06/30）＞＞

          // ラベル化タスクのキャッシュを更新
            _allLabeledTasks.add(resultValue);
            // ラベル化タスクのキャッシュの更新を通知
            _labeledTasksController.add([..._allLabeledTasks]);
            // DB からの戻り値の .labelId を返す
            return resultValue.labelId;
          case Failure(
          exception: Exception error,
          methodName: String? methodName
          ):
            return null;
        // todo エラーハンドリング（2026/06/22）＞＞
        }
    }
  }

  /// タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[dTask.id]）を追加する。
  ///
  /// 指定タスクのラベル情報（[dTask.labelId]）に、指定ラベルを加える。
  @override
  Future<Result<void, Exception>> addTaskIdToLabel({
    required ETask eTask,
    required int labelId,
  }) async {
    return await _dataSource.addTaskIdToLabel(
      labelId: labelId,
      dTask: dTask,
    );
  }

  /// 指定タスクのラベル化を解除するメソッド
  ///
  /// 指定タスク（[dTask]）がこの段階で属しているラベルから、このタスクのIDを除外する。
  ///
  /// 指定タスクの [DTask.labelId] を `null` にする。
  @override
  Future<void> unlabeling({
    required DTask dTask,
  })
  // 折りたたみ用
  async {
    switch (dTask) {
    // DTask.task は書き換えメソッドの整合性チェックのため、nullable だが、
    // 書き換え以外では null はない
      case DDailyTask(
      id: final int id,
      labelId: final int? labelId,
      ):
      // DB にラベル化解除を依頼
        final Result<void, Exception> result = labelId != null
            ? await _dataSource.unlabelDailyTask(
            labelId: labelId, targetId: dTask.id)
        // ここで見つからないのは、どこかの記入ミス
            : Failure(Exception("元のラベルが見つかりませんでした。"));

        switch (result) {
          case Success():
          // 日単位タスクのキャッシュを更新して、ストリームに流す
          // 仕様上、必ず存在すると思われるが一応例外処理
            try {
              _streamUpdatedDailyTasks(
                date: dTask.date,
                taskId: id,
                labelId: null,
              );
            } catch (e) {
              // todo エラーハンドリング（2026/06/30）＞＞
            }
            // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedDailyId(labelId: labelId!, removedId: id);
          case Failure(
          exception: Exception error,
          methodName: String? methodName
          ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DWeeklyTask(
      id: final int id,
      labelId: final int? labelId,
      ):
      // DB にラベル化解除を依頼
        final Result<void, Exception> result = labelId != null
            ? await _dataSource.unlabelWeeklyTask(
            labelId: labelId, targetId: dTask.id)
        // ここで見つからないのは、どこかの記入ミス
            : Failure(Exception("元のラベルが見つかりませんでした。"));

        switch (result) {
          case Success():
          // 週単位タスクのキャッシュを更新して、ストリームに流す
            _streamUpdatedWeeklyTasks(taskId: id, labelId: null);
            // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedWeeklyId(
                labelId: labelId!, removedId: id);
          case Failure(
          exception: Exception error,
          methodName: String? methodName,
          ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DMonthlyTask(
      id: final int id,
      labelId: final int? labelId,
      ):
      // DB にラベル化解除を依頼
        final Result<void, Exception> result = labelId != null
            ? await _dataSource.unlabelMonthlyTask(
            labelId: labelId, targetId: dTask.id)
        // ここで見つからないのは、どこかの記入ミス
            : Failure(Exception("元のラベルが見つかりませんでした。"));

        switch (result) {
          case Success():
          // todo 月単位タスクのキャッシュを更新して、ストリームに流す（2026/06/30）＞＞

          // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedMonthlyId(
              labelId: labelId!,
              removedId: id,
            );
          case Failure(
          exception: Exception error,
          methodName: String? methodName
          ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DYearlyTask(
      id: final int id,
      labelId: final int? labelId,
      ):
      // DB にラベル化解除を依頼
        final Result<void, Exception> result = labelId != null
            ? await _dataSource.unlabelYearlyTask(
            labelId: labelId, targetId: dTask.id)
        // ここで見つからないのは、どこかの記入ミス
            : Failure(Exception("元のラベルが見つかりませんでした。"));

        switch (result) {
          case Success():
          // todo 年単位タスクのキャッシュを更新して、ストリームに流す（2026/06/30）＞＞

          // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedDailyId(
              labelId: labelId!,
              removedId: id,
            );
          case Failure(
          exception: Exception error,
          methodName: String? methodName
          ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
    }
  }
}
