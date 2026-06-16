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
    await _initDayTasksMap();
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

  /// 日単位タスクのキャッシュ
  Map<Date, List<DDayTask>> _dayTasksMap = {};

  /// 日単位タスクのキャッシュを管理するコントローラ
  final StreamController<Map<Date, List<DDayTask>>> _dayTasksController =
      BehaviorSubject<Map<Date, List<DDayTask>>>();

  /// 日単位タスクのキャッシュが更新された際に、その情報を流すストリーム
  @override
  Stream<Map<Date, List<DDayTask>>> get dayTasksStream =>
      _dayTasksController.stream;

  /// 日単位タスクの Map をストリームに流す一連のプロセス
  ///  - [_dayTasksMap] を更新
  ///  - ストリームに流す
  void _streamDayTasks(Map<Date, List<DDayTask>> dataMap) {
    // 取得したデータをキャッシュの Map に組み込む
    for (var entries in dataMap.entries) {
      _dayTasksMap[entries.key] = entries.value;
    }
    // キャッシュをストリームに流す
    _dayTasksController.add({..._dayTasksMap});
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
  void _streamWeeklyTasks(List<DWeeklyTask> dataList) {
    // 取得したデータをキャッシュに組み込む
    _weeklyTasksList.addAll([...dataList]);
    // キャッシュをストリームに流す
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
  Future<void> _initDayTasksMap() async {
    // 今日と明日の値を要求する
    final List<Date> dateList = [
      today,
      today.nDaysLater(1),
    ];
    // DBからデータを取得する
    fetchDayTasksMap(dateList: dateList);
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
  Future<void> fetchDayTasksMap({required List<Date> dateList}) async {
    // 日付を指定して日単位タスクをフェッチ
    final Result<Map<Date, List<DDayTask>>, Exception> result =
        await _dataSource.getDayTasksByDate(
      dateList: dateList,
    );

    switch (result) {
      case Success(value: final Map<Date, List<DDayTask>> resultValue):
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
          _streamDayTasks({...resultValue});
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
        _streamWeeklyTasks(resultValue);

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
    final Result<Map<Date, List<DDayTask>>, Exception> result =
        await _dataSource.createDailyTaskRecord(dateList: dateList);

    switch (result) {
      case Success(value: final Map<Date, List<DDayTask>> resultValue):
        // ストリームにデータを流す
        _streamDayTasks({...resultValue});
      case Failure(exception: Exception error, methodName: String? methodName):
      // todo エラーハンドリング（2026/05/23）＞＞
    }
    return result;
  }

  /// タスクタイトル保存メソッド
  ///
  /// 引数 [newTaskMap] は、key が ID, value がタスクタイトルの Map 。
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
        break;
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
}
