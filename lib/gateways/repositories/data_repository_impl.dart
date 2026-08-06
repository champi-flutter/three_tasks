import 'dart:async';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/entities/data_type/d_labeled_task.dart';
import 'package:three_tasks/gateways/data_source_interface/data_source.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  // todo 依存先
  final Ref _ref;

  /// [DataSource] のインスタンスを参照する内部的な getter
  ///
  /// このクラスはインスタンスを保有せず、毎回この getter で参照する。
  DataSource get _dataSource => _ref.read(dataSourceProvider);

  /// 通知送信先（[EventNotifier]）のインスタンス
  EventNotifier get _readEventNotifier => _ref.read(eventProvider);

  // todo 通知関連
  /// エラー通知メソッド
  void _notifyQueryError({
    required Exception error,
    required String? methodName,
  })
  // 折りたたみ用
  {
    final String content = "$error\n（$methodName）";
    _readEventNotifier.notifyInfo(
      layer: NotificationFrom.gateway,
      type: NotificationType.error,
      notification: content,
    );
  }

  // todo コンストラクタ
  DataRepositoryImpl(this._ref) {}

  // todo 初期化
  /// 各種データ初期化メソッド
  // todo 各初期化メソッドを await するか（2026/06/02）＞＞
  Future<void> _initData() async {
    await _initLabeledTasks();
    await _initDailyTasksMap();
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

  /// 日単位タスクのキャッシュ
  Map<Date, List<DDailyTask>> _dailyTasksMap = {};

  /// 日単位タスクのキャッシュを管理するコントローラ
  final StreamController<Map<Date, List<DDailyTask>>> _dailyTasksController =
      BehaviorSubject<Map<Date, List<DDailyTask>>>();

  /// 日単位タスクのキャッシュが更新された際に、その情報を流すストリーム
  @override
  Stream<Map<Date, List<DDailyTask>>> get dailyTasksStream =>
      _dailyTasksController.stream;

  /// 指定日付の日単位タスクをまるごと置き換えて、ストリームに流す一連のプロセス
  ///  - [_dailyTasksMap] を更新
  ///  - ストリームに流す
  void _streamNewDailyTasks(Map<Date, List<DDailyTask>> dataMap) {
    // 取得したデータをキャッシュの Map に組み込む
    for (var entries in dataMap.entries) {
      _dailyTasksMap[entries.key] = entries.value;
    }
    // キャッシュをストリームに流す
    _dailyTasksController.add({..._dailyTasksMap});
  }

  /// 指定日付の日単位タスクの中身を一部更新して、ストリームに流す一連のプロセス
  ///  - [_dailyTasksMap] を更新
  ///  - ストリームに流す
  void _streamUpdatedDailyTasks({
    required Date date,
    required int taskId,
    Object task = nonSpecified,
    Object isChecked = nonSpecified,
    Object? labelId = nonSpecified,
  })
  // 折りたたみ用
  {
    final bool isNotSpecifiedTask = identical(task, nonSpecified);
    final bool isNotSpecifiedIsChecked = identical(isChecked, nonSpecified);
    final bool isNotSpecifiedLabelId = identical(labelId, nonSpecified);
    assert(
      isNotSpecifiedTask || task is String,
      "DDailyTask.task が String で指定されていません。",
    );
    assert(
      isNotSpecifiedIsChecked || isChecked is bool,
      "DDailyTask.isChecked が bool で指定されていません。",
    );
    assert(
      isNotSpecifiedLabelId || labelId == null || labelId is int,
      "DDailyTask.labelId が int? で指定されていません。",
    );
    if (_dailyTasksMap.containsKey(date)) {
      // キャッシュの更新
      _dailyTasksMap[date] = _dailyTasksMap[date]!.map((DDailyTask dailyTask) {
        // 該当IDのタスクの labelId を copyWith で書き換え
        if (dailyTask.id == taskId) {
          // 引数で指定したプロパティを変換
          return dailyTask.copyWith(
            task: isNotSpecifiedTask ? dailyTask.task : task as String,
            isChecked:
                isNotSpecifiedIsChecked ? dailyTask.isChecked : isChecked as bool,
            labelId: isNotSpecifiedLabelId ? dailyTask.labelId : labelId as int,
          );
        } else {
          return dailyTask;
        }
      }).toList();
      // ストリームに流す
      _dailyTasksController.add({..._dailyTasksMap});
    } else {
      throw Exception("予期せぬ不具合が発生しました（_dailyTasksMap[date] == null）。");
    }
  }

  /// 週単位タスクのキャッシュ
  List<DWeeklyTask> _weeklyTasksList = [];

  /// 週単位タスクのキャッシュを管理するコントローラ
  final StreamController<List<DWeeklyTask>> _weeklyTasksController =
      BehaviorSubject<List<DWeeklyTask>>();

  /// 週単位タスクのキャッシュが更新された際に、その情報を流すストリーム
  @override
  Stream<List<DWeeklyTask>> get weeklyTasksStream =>
      _weeklyTasksController.stream;

  /// 週単位タスクの Map をストリームに流す一連のプロセス
  ///  - [_weeklyTasksMap] を更新
  ///  - ストリームに流す
  void _streamNewWeeklyTasks(List<DWeeklyTask> dataList) {
    // 取得したデータをキャッシュに組み込む
    _weeklyTasksList.addAll([...dataList]);
    // キャッシュをストリームに流す
    _weeklyTasksController.add([..._weeklyTasksList]);
  }

  /// 週単位タスクの中身を更新して、ストリームに流す一連のプロセス
  ///  - [_weeklyTasksList] を更新
  ///  - ストリームに流す
  void _streamUpdatedWeeklyTasks({
    required int taskId,
    Object task = nonSpecified,
    Object isChecked = nonSpecified,
    Object? labelId = nonSpecified,
  })
  // 折りたたみ用
  {
    final bool isNotSpecifiedTask = identical(task, nonSpecified);
    final bool isNotSpecifiedIsChecked = identical(isChecked, nonSpecified);
    final bool isNotSpecifiedLabelId = identical(labelId, nonSpecified);
    assert(
      isNotSpecifiedTask || task is String,
      "DDailyTask.task が String で指定されていません。",
    );
    assert(
      isNotSpecifiedIsChecked || isChecked is bool,
      "DDailyTask.isChecked が bool で指定されていません。",
    );
    assert(
      isNotSpecifiedLabelId || labelId == null || labelId is int,
      "DDailyTask.labelId が int? で指定されていません。",
    );
    _weeklyTasksList = _weeklyTasksList.map((DWeeklyTask weeklyTask) {
      // 該当IDのタスクの labelId を copyWith で書き換え
      if (weeklyTask.id == taskId) {
        // 引数で指定したプロパティを変換
        return weeklyTask.copyWith(
          task: isNotSpecifiedTask ? weeklyTask.task : task as String,
          isChecked: isNotSpecifiedIsChecked
              ? weeklyTask.isChecked
              : isChecked as bool,
          labelId: isNotSpecifiedLabelId ? weeklyTask.labelId : labelId as int,
        );
      } else {
        return weeklyTask;
      }
    }).toList();
    // ストリームに流す
    _weeklyTasksController.add([..._weeklyTasksList]);
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

  /// 日単位タスク（「今日のタスク」と「明日のタスク」）のキャッシュ初期化メソッド
  Future<void> _initDailyTasksMap() async {
    // 今日と明日の値を要求する
    final List<Date> dateList = [
      today,
      today.nDaysLater(1),
    ];
    // DBからデータを取得する
    fetchDailyTasksMap(dateList: dateList);
  }

  /// 週単位タスクのキャッシュ初期化メソッド
  @override
  Future<Result<void, Exception>> initWeeklyTaskList() async {
    try {
      // 当日から1週間前まで（当日を含む週の開始日になりうる日付）の値を要求する
      final List<Date> firstDateList =
          List<Date>.generate(7, (int index) => today.nDaysAgo(index));
      // DBからデータを取得する
      return await fetchWeeklyTaskList(firstDateList: firstDateList);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  /// 日単位タスクフェッチメソッド
  ///
  /// DB からデータを取得して、ストリームに流す。
  ///
  /// 基本はキャッシュを参照するが、参照したい日付（[dateList]）がキャッシュにない場合
  /// にこのメソッドを呼び出す。
  @override
  Future<void> fetchDailyTasksMap({required List<Date> dateList}) async {
    // 日付を指定して日単位タスクをフェッチ
    final Result<Map<Date, List<DDailyTask>>, Exception> result =
        await _dataSource.getDailyTasksByDate(
      dateList: dateList,
    );

    switch (result) {
      case Success(value: final Map<Date, List<DDailyTask>> resultValue):
        // データが空の日付をリストで抽出
        final List<Date> emptyDateList = resultValue.entries
            .where((entry) => entry.value.isEmpty)
            .map((entry) => entry.key)
            .toList();

        // データがまだなかった場合（キャッシュにもDBにもデータがなかった場合）
        if (emptyDateList.isNotEmpty) {
          // 新しい日付の枠（空のタスク）を作る
          _createDailyTaskRecord(dateList: emptyDateList);
        }
        // 要求した日付のデータがDBにあった場合（キャッシュにはなかったが、DBにはあった場合）
        else {
          // ストリームにデータを流す
          _streamNewDailyTasks({...resultValue});
        }
      case Failure(exception: Exception error):
      // todo エラーハンドリング（2026/06/03）＞＞
    }
  }

  /// 週単位タスクフェッチメソッド
  ///
  /// DB からデータを取得して、ストリームに流す。
  ///
  /// 基本はキャッシュを参照するが、参照したい日付（[firstDateList]）がキャッシュにない場合
  /// にこのメソッドを呼び出す。
  @override
  Future<Result<void, Exception>> fetchWeeklyTaskList({
    required List<Date> firstDateList,
  })
  // 折りたたみ用
  async {
    // 日付を指定して週単位タスクをフェッチ
    final Result<List<DWeeklyTask>, Exception> result =
        await _dataSource.getWeeklyTasksByDate(firstDateList: firstDateList);

    switch (result) {
      case Success(value: final List<DWeeklyTask> resultValue):
        // ストリームにデータを流す（週タスクは空を許容）
        _streamNewWeeklyTasks(resultValue);

      // エラーハンドリング
      case Failure(
          exception: final Exception error,
          methodName: final String? methodName
        ):
        _notifyQueryError(error: error, methodName: methodName);
    }
    return result;
  }

  // todo 書き換え
  /// 日単位タスクの新しい日付の枠を作成するメソッド
  Future<Result<void, Exception>> _createDailyTaskRecord({
    required List<Date> dateList,
  })
  // 折りたたみ用
  async {
    // DB に新しい日付の枠（レコード）を作成
    final Result<Map<Date, List<DDailyTask>>, Exception> result =
        await _dataSource.createDailyTaskRecord(dateList: dateList);

    switch (result) {
      case Success(value: final Map<Date, List<DDailyTask>> resultValue):
        // ストリームにデータを流す
        _streamNewDailyTasks({...resultValue});
      case Failure(exception: Exception error, methodName: String? methodName):
      // todo エラーハンドリング（2026/05/23）＞＞
    }
    return result;
  }


  /// タスク情報変更保存メソッド
  @override
  Future<Result<void, Exception>> saveTaskChanges({
    required List<DTask> newTaskList,
  })
  // 折りたたみ用
  async {
    final Result<void, Exception> result = await _dataSource.saveTaskChanges(
      newTaskList: newTaskList,
    );
    switch (result) {
      case Success():
      // 日単位の値
        final Map<Date, List<DDailyTask>> resultDay = {};
        // 週単位の値
        final List<DWeeklyTask> resultWeek = [];
        for (DTask task in newTaskList) {
          switch (task) {
            case DDailyTask():
            // 対象日付の key のリストに task を追加
              resultDay.addNullable(key: task.date, value: task);
            case DWeeklyTask():
            // 週単位の値に追加
              resultWeek.add(task);
            case DMonthlyTask():
              _;
            case DYearlyTask():
              _;
          }
        }
        // 日単位の分があればストリームに流す
        if (resultDay.isNotEmpty) {
          _streamNewDailyTasks({...resultDay});
        }
        // 週単位の分があればストリームに流す
        if (resultWeek.isNotEmpty) {
          _streamNewWeeklyTasks([...resultWeek]);
        }
    // todo 月、年単位の場合のストリーム（2026/06/30）＞＞
      case Failure(exception: Exception error, methodName: String? methodName):
      // todo エラーハンドリング（2026/05/23）＞＞
    }
    return result;
  }

  /// タスクタイトル保存メソッド
  ///
  /// 引数 [newTaskMap] は、key が ID, value がタスクタイトルの Map 。
  ///
  /// 日付が揃っていることが前提。
  @override
  Future<Result<void, Exception>> saveTaskTitles({
    required List<DTask> newTaskList,
  })
  // 折りたたみ用
  async {
    final Result<void, Exception> result = await _dataSource.saveTaskTitles(
      newTaskList: newTaskList,
    );
    switch (result) {
      case Success():
        // 日単位の値
        final Map<Date, List<DDailyTask>> resultDay = {};
        // 週単位の値
        final List<DWeeklyTask> resultWeek = [];
        for (DTask task in newTaskList) {
          switch (task) {
            case DDailyTask():
              // 対象日付の key のリストに task を追加
              resultDay.addNullable(key: task.date, value: task);
            case DWeeklyTask():
              // 週単位の値に追加
              resultWeek.add(task);
            case DMonthlyTask():
              _;
            case DYearlyTask():
              _;
          }
        }
        // 日単位の分があればストリームに流す
        if (resultDay.isNotEmpty) {
          _streamNewDailyTasks({...resultDay});
        }
        // 週単位の分があればストリームに流す
        if (resultWeek.isNotEmpty) {
          _streamNewWeeklyTasks([...resultWeek]);
        }
      // todo 月、年単位の場合のストリーム（2026/06/30）＞＞
      case Failure(exception: Exception error, methodName: String? methodName):
      // todo エラーハンドリング（2026/05/23）＞＞
    }
    return result;
  }

  /// タスクのチェック変更保存メソッド
  @override
  Future<Result<void, Exception>> saveCheck({required DTask newTask}) async {
    final readDataSource = _ref.read(dataSourceProvider);
    final Result<void, Exception> result =
        await readDataSource.saveCheck(newTask: newTask);
    switch (result) {
      case Success():
        break;
      case Failure(exception: Exception error, methodName: String? methodName):
      // todo エラーハンドリング（2026/05/23）＞＞
    }
    return result;
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
  Future<void> addToLabel({
    required DTask dTask,
    required int labelId,
  })
  // 折りたたみ用
  async {
    switch (dTask) {
      // DTask.task は書き換えメソッドの整合性チェックのため、nullable だが、
      // 書き換え以外では null はない
      case DDailyTask(
          id: final int id,
        ):
        // DB に既存ラベルへの登録を依頼
        final Result<void, Exception> result = await _dataSource
            .addDailyTaskToLabel(labelId: labelId, targetId: dTask.id);

        switch (result) {
          case Success():
            // 日単位タスクのキャッシュを更新して、ストリームに流す
            // 仕様上、必ず存在すると思われるが一応例外処理
            try {
              _streamUpdatedDailyTasks(
                date: dTask.date,
                taskId: id,
                // 新しいラベルIDをキャッシュに組み込む
                labelId: labelId,
              );
            } catch (e) {
              // todo エラーハンドリング（2026/06/30）＞＞
            }
            // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedDailyId(labelId: labelId, removedId: id);
          case Failure(
              exception: Exception error,
              methodName: String? methodName
            ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DWeeklyTask(
          id: final int id,
        ):
        // DB に既存ラベルへの登録を依頼
        final Result<void, Exception> result = await _dataSource
            .addWeeklyTaskToLabel(labelId: labelId, targetId: dTask.id);

        switch (result) {
          case Success():
            // 週単位タスクのキャッシュを更新して、ストリームに流す
            _streamUpdatedWeeklyTasks(
              taskId: id,
              // 新しいラベルIDをキャッシュに組み込む
              labelId: labelId,
            );
            // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedWeeklyId(
              labelId: labelId,
              newId: id,
            );
          case Failure(
              exception: Exception error,
              methodName: String? methodName,
            ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DMonthlyTask(
          id: final int id,
        ):
        // DB に既存ラベルへの登録を依頼
        final Result<void, Exception> result = await _dataSource
            .unlabelDailyTask(labelId: labelId, targetId: dTask.id);

        switch (result) {
          case Success():
            // todo 月単位タスクのキャッシュを更新して、ストリームに流す（2026/06/30）＞＞

            // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedMonthlyId(
              labelId: labelId,
              newId: id,
            );
          case Failure(
              exception: Exception error,
              methodName: String? methodName
            ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
      case DYearlyTask(
          id: final int id,
        ):
        // DB にラベル化解除を依頼
        final Result<void, Exception> result = await _dataSource
            .unlabelDailyTask(labelId: labelId, targetId: dTask.id);

        switch (result) {
          case Success():
            // todo 年単位タスクのキャッシュを更新して、ストリームに流す（2026/06/30）＞＞

            // ラベル化タスクのキャッシュを更新
            _streamLabeledTasksUpdatedDailyId(
              labelId: labelId,
              newId: id,
            );
          case Failure(
              exception: Exception error,
              methodName: String? methodName
            ):
          // todo エラーハンドリング（2026/06/22）＞＞
        }
    }
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
            _streamLabeledTasksUpdatedWeeklyId(labelId: labelId!, removedId: id);
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
