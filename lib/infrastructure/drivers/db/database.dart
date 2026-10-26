
import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/infrastructure/drivers/db/table/converter/q_to_table_task.dart';
import 'package:three_tasks/infrastructure/drivers/db/table/converter/table_to_q_task.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/data_source_interface/data_source.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_label/q_label.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_setting/q_page_setting.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_task/q_task.dart';

// テーブル
import 'package:three_tasks/infrastructure/drivers/db/table/setting_tables.dart';
import 'package:three_tasks/infrastructure/drivers/db/table/task_tables.dart';
import 'package:three_tasks/infrastructure/drivers/db/table/label_tables.dart';
import 'package:three_tasks/infrastructure/drivers/db/table/review_tables.dart';

part 'database.g.dart';


@DriftDatabase(tables: [
  DayTasks,
  WeeklyTasks,
  MonthlyTasks,
  YearlyTasks,
  Reviews,
  LabeledTasks,
  PageSettings,
])
class MyDatabase extends _$MyDatabase implements DataSource {
  // データベースをどこに保存するかをDriftに伝えるリダイレクトコンストラクタ
  MyDatabase() : super(_openConnection());

  static QueryExecutor _openConnection() {
    // 拡張子抜きのデータベース名
    return driftDatabase(name: "tasks");
  }

  /// [LabeledTask]（テーブルクラス）から [QLabel]（クエリ用DTO）へ変換
  QLabel _toQLabel(LabeledTask rawData) {
    return QLabel(
      title: rawData.label,
      labelId: rawData.labeledId,
      dailyId32Blob: Int32Blob.fromUint8List(rawData.dailyIdList),
      weeklyId32Blob: Int32Blob.fromUint8List(rawData.weeklyIdList),
      monthlyId32Blob: Int32Blob.fromUint8List(rawData.monthlyIdList),
      yearlyId32Blob: Int32Blob.fromUint8List(rawData.yearlyIdList),
    );
  }

  /// [LabeledTask]（テーブルクラス）の List から [QLabel]（クエリ用DTO）の
  /// List へ変換
  List<QLabel> _toQLabelList(List<LabeledTask> rawDataList) {
    return rawDataList.map(_toQLabel).toList();
  }

  /// [QLabel] から [LabeledTask] への変換
  LabeledTask _toLabeledTaskRecord(QLabel qLabel) {
    return LabeledTask(
      labeledId: qLabel.labelId,
      label: qLabel.title,
      dailyIdList: qLabel.dailyId32Blob.data,
      weeklyIdList: qLabel.weeklyId32Blob.data,
      monthlyIdList: qLabel.monthlyId32Blob.data,
      yearlyIdList: qLabel.yearlyId32Blob.data,
    );
  }

  /// [PageSetting] から [QPageSetting] への変更
  QPageSetting _toQPageSetting(PageSetting pageSetting) {
    return QPageSetting(
      pageId: pageSetting.pageId,
      primaryAutoSaves: pageSetting.primaryAutoSaves,
      reviewAutoSaves: pageSetting.reviewAutoSaves,
    );
  }

  /// `List<PageSetting>` から [QSettingsMap] への変更
  QSettingsMap _toQSettingMap(List<PageSetting> pageSettingList) {
    final Map<int, QPageSetting> map = {};
    // pageId を key として map に QPageSetting を組み込んでいく
    for (final pageSetting in pageSettingList) {
      map[pageSetting.pageId] = _toQPageSetting(pageSetting);
    }
    return QSettingsMap.fromMapCopy(map);
  }

  // todo フェッチ
  // todo LabeledTasks
  /// `LabeledTask` フェッチメソッド
  @override
  Future<Result<List<QLabel>, Exception>> getAllLabeledTasks() async {
    try {
      final List<LabeledTask> rawDataList = await managers.labeledTasks.get();
      return Success(_toQLabelList(rawDataList));
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "getAllLabeledTasks");
    }
  }

  /// `DayTask` フェッチメソッド
  ///
  /// 要求された日付に該当するデータを返す。
  @override
  Future<Result<List<QDailyTask>, Exception>> getDailyTasksByDate({
    required int targetDateInt,
  })
  // 折りたたみ用
  async {
    try {
      // DB から該当日付のタスクを取得
      final List<DayTask> rawDataList = await managers.dayTasks
          .filter((dayTask) => dayTask.date.equals(targetDateInt))
          .get();
      // クエリ用 DTO に変換して返す
      return Success(TableToQTask.toQDailyTaskList(rawDataList));
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "getDailyTasksByDate");
    }
  }

  /// `WeeklyTask` フェッチメソッド
  ///
  /// 要求された日付（[targetDate]）に該当するデータを返す。
  @override
  Future<Result<List<QWeeklyTask>, Exception>> getWeeklyTasksByDate({
    required Date targetDate,
    required List<int> exclusionDiffs,
  })
  // 折りたたみ用
  async {
    try {
      final List<QWeeklyTask> resultValue = [];
      // transaction で、要求された日付のデータを一気に取得
      await transaction(() async {
        // targetDate をカラムの型の変換に対応
        final int targetDateInt = targetDate.toIntIdentifier();
        // targetDate から 6 〜 0 日前が週の初めとなっているタスクを取得
        for (int diff = 6; diff >= 0; diff--) {
          // 引数で指定された、除外する開始日
          if (exclusionDiffs.contains(diff)) {
            continue;
          }
          // 週の初めの日の int
          final int firstDateInt = targetDateInt - diff;
          // DB から該当日付のタスクを取得する
          final List<WeeklyTask> rawDataList = await managers.weeklyTasks
              .filter((weeklyTask) => weeklyTask.firstDate.equals(firstDateInt))
              .get();

          // そのリストを DTO に変換して、戻り値に組み込む（リストが空の場合も）
          resultValue.addAll(TableToQTask.toQWeeklyTaskList(rawDataList));
        }
      });
      // 3つ以下の時のみ Success を返す
      if (resultValue.length <= 3) {
        return Success(resultValue);
      } else {
        throw Exception(
            "週のタスクが 4 つ以上存在します。\nlength = ${resultValue.length} （${targetDate.toStrFormat()}）");
      }
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "getWeeklyTasksByDate");
    }
  }

  /// `MonthlyTask` フェッチメソッド
  ///
  /// 要求された月に該当するデータを返す。
  ///
  /// **【注意】** このデータは空の場合もある。
  @override
  Future<Result<List<QMonthlyTask>, Exception>> getMonthlyTasks({
    required int targetMonthInt,
  })
  // 折りたたみ用
  async {
    try {
      // DB から該当月のタスクを取得
      final List<MonthlyTask> rawDataList = await managers.monthlyTasks
          .filter((monthlyTask) => monthlyTask.month.equals(targetMonthInt))
          .get();
      // クエリ用 DTO に変換して返す
      return Success(TableToQTask.toQMonthlyTaskList(rawDataList));
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "getMonthlyTasks");
    }
  }

  /// `YearlyTask` フェッチメソッド
  ///
  /// 要求された年に該当するデータを返す。
  ///
  /// **【注意】** このデータは空の場合もある。
  Future<Result<List<QYearlyTask>, Exception>> getYearlyTasks({
    required int targetYear,
  })
  // 折りたたみ用
  async {
    try {
      // DB から該当月のタスクを取得
      final List<YearlyTask> rawDataList = await managers.yearlyTasks
          .filter((yearlyTask) => yearlyTask.year.equals(targetYear))
          .get();
      // クエリ用 DTO に変換して返す
      return Success(TableToQTask.toQYearlyTaskList(rawDataList));
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "getYearlyTasks");
    }
  }

  /// データソースに保存している各種設定値を取得する
  @override
  Future<Result<QSettingsMap, Exception>> getSettings() async {
    try {
      final settings = await managers.pageSettings.get();
      return Success(_toQSettingMap(settings));
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "getSettings");
    }
  }

  // todo DayTasks

  // Read（抽出）
  // managerが管理する全てのデータベース（）の中から対象のデータベース（）を取得する
  Future<List<DayTask>> get allDayTasks => managers.dayTasks.get();

  // // 今日のタスクだけを抽出
  // Future<List<DayTask>> get allTasksForToday =>
  //     managers.dayTasks.filter((f) => f.date(today)).get();
  //
  // // 明日のタスクだけを抽出
  // Future<List<DayTask>> get allTasksForTomorrow =>
  //     managers.dayTasks.filter((f) => f.date(tomorrow)).get();
  //
  // // 昨日のタスクだけを抽出
  // Future<List<DayTask>> get allTasksForYesterday => managers.dayTasks
  //     .filter((f) => f.date(outputFormat.format(now.add(Duration(days: -1)))))
  //     .get();
  //
  // // カレンダーで選択された日付のタスクを抽出
  // Future<List<DayTask>> get allTasksForTheDay => managers.dayTasks
  //     .filter((f) => f.date(outputFormat.format(theDay)))
  //     .get();

  /// 達成されなかったタスクを抽出
  Future<List<DayTask>> get allTasksNotAchieved => managers.dayTasks
      .filter((f) => f.isChecked.equals(false))
      .orderBy((o) => o.date.asc())
      .get();

  // Update（更新）
  // 指定したデータ行（）を古いデータと置き換える
  Future<void> updateDayTask(DayTask dayTaskUpdated) =>
      managers.dayTasks.replace(dayTaskUpdated);

  // todo 書き換え
  /// 日単位タスクの新しい日付の枠を作成するメソッド
  ///
  /// 複数の日付を指定可能。
  @override
  Future<Result<TaskList<QDailyTask>, Exception>> createDailyTaskRecord({
    required int targetDateInt,
  })
  // 折りたたみ用
  async {
    try {
      // 作成するタスクの枠
      final List<QDailyTask> qTaskList = [];
      await transaction(() async {
        // 空のタスクを3つ作る
        for (int i = 0; i < 3; i++) {
          final DayTask rawData =
              await managers.dayTasks.createReturning((record) => record(
                    task: "",
                    date: targetDateInt,
                  ));
          qTaskList.add(TableToQTask.toQDailyTask(rawData));
        }
      });
      final TaskList<QDailyTask> returning =
          TaskList<QDailyTask>.fromIterable(qTaskList);
      // Fetch 用の DTO に変換して返す
      return Success(returning);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "createDailyTaskRecord");
    }
  }

  /// 週単位タスクの新しい日付の枠を作成するメソッド
  ///
  /// 指定した座（[indexList]）に対応するタスク ID の Map （`Map<int, int>`）を返す。
  @override
  Future<Result<Map<int, int>, Exception>> createWeeklyTaskRecord({
    required List<int> indexList,
  })
  // 折りたたみ用
  async {
    try {
      // 返す List の枠
      final Map<int, int> dataMap = {};
      // 指定した各日付のタスクのリストを取得
      await transaction(() async {
        for (int index in indexList) {
          final int createdId =
              await managers.weeklyTasks.create((record) => record(
                    task: "",
                    // カラムの型の変換に対応
                    firstDate: today.toIntIdentifier(),
                  ));
          // 作ったタスクを、返す Map に組み込む
          dataMap[index] = createdId;
        }
      });
      return Success(dataMap);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"),
          methodName: "createWeeklyTaskRecord");
    }
  }

  /// 月単位タスクの新しい枠を作成するメソッド
  @override
  Future<Result<TaskList<QMonthlyTask>, Exception>> createMonthlyTaskRecord({
    required int targetMonthInt,
  })
  // 折りたたみ用
  async {
    try {
      // 作成するタスクの枠
      final List<QMonthlyTask> qTaskList = [];
      await transaction(() async {
        // 空のタスクを3つ作る
        for (int i = 0; i < 3; i++) {
          final MonthlyTask rawData =
          await managers.monthlyTasks.createReturning((record) => record(
            task: "",
            month: targetMonthInt,
          ));
          qTaskList.add(TableToQTask.toQMonthlyTask(rawData));
        }
      });
      final TaskList<QMonthlyTask> returning =
      TaskList<QMonthlyTask>.fromIterable(qTaskList);
      // Fetch 用の DTO に変換して返す
      return Success(returning);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "createMonthlyTaskRecord");
    }
  }

  /// 年単位タスクの新しい枠を作成するメソッド
  @override
  Future<Result<TaskList<QYearlyTask>, Exception>> createYearlyTaskRecord({
    required int targetYear,
  })
  // 折りたたみ用
  async {
    try {
      // 作成するタスクの枠
      final List<QYearlyTask> qTaskList = [];
      await transaction(() async {
        // 空のタスクを3つ作る
        for (int i = 0; i < 3; i++) {
          final YearlyTask rawData =
          await managers.yearlyTasks.createReturning((record) => record(
            task: "",
            year: targetYear,
          ));
          qTaskList.add(TableToQTask.toQYearlyTask(rawData));
        }
      });
      final TaskList<QYearlyTask> returning =
      TaskList<QYearlyTask>.fromIterable(qTaskList);
      // Fetch 用の DTO に変換して返す
      return Success(returning);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "createYearlyTaskRecord");
    }
  }

  // /// タスクタイトル保存メソッド
  // @override
  // Future<Result<void, Exception>> saveTaskTitles({
  //   required List<DTask> newTaskList,
  // })
  // // 折りたたみ用
  // async {
  //   try {
  //     // 返す Map の枠
  //     final Map<Date, List<DDailyTask>> dataMap = {};
  //     await transaction(() async {
  //       /// task ごとに情報を保存
  //       for (DTask task in newTaskList) {
  //         _print(
  //           "タスクを DB に保存",
  //           "  ID: ${task.id}",
  //           "  タスクタイトル: ${task.task}",
  //         );
  //         await _saveDTaskTitle(newDTask: task);
  //       }
  //     });
  //     return Success(null);
  //   } catch (e) {
  //     return Failure(Exception(e), methodName: "saveTaskTitles");
  //   }
  // }

  /// タスク情報変更保存メソッドを実装
  @override
  Future<Result<void, Exception>> saveTaskChanges({
    required List<QTask> newTaskList,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        /// task ごとに情報を保存
        for (QTask task in newTaskList) {
          await _saveTask(newQTask: task);
        }
      });
      return Success(null);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "saveTaskChanges");
    }
  }

  /// タイプ（日単位、週単位、など）別でタスク情報の変更を保存するメソッド
  ///
  /// sealed class の網羅性を使って条件分岐する。
  ///
  /// drift の [Value.absentIfNull] を用いて、指定されなかったカラムは更新せず、
  /// 元の値のままにする。
  Future<void> _saveTask({required QTask newQTask}) async {
    try {
      switch (newQTask) {
        case QDailyTask():
          // 変更後情報をテーブルのレコードの型に変換する
          final newRecord = QToTableTask.toDayTaskRecord(newQTask);
          // 変更後のレコードを保存する
          await managers.dayTasks.replace(newRecord);
        case QWeeklyTask():
          // 変更後情報をテーブルのレコードの型に変換する
          final newRecord = QToTableTask.toWeeklyTaskRecord(newQTask);
          // 変更後のレコードを保存する
          await managers.weeklyTasks.replace(newRecord);
        case QMonthlyTask():
        // 変更後情報をテーブルのレコードの型に変換する
          final newRecord = QToTableTask.toMonthlyTaskRecord(newQTask);
          // 変更後のレコードを保存する
          await managers.monthlyTasks.replace(newRecord);
        case QYearlyTask():
        // todo _saveTask の case QMonthlyTask(): （2026/09/11）＞＞
      }
    } catch (_) {
      rethrow;
    }
  }

  /// 週単位タスクの firstDate を書き換えるメソッド
  @override
  Future<Result<void, Exception>> updateWeeklyTasksFirstDate({
    required Map<int, Date> idFirstDateMap,
  })
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        // 指定 ID ごとに情報を更新する
        for (final entry in idFirstDateMap.entries) {
          final int targetId = entry.key;
          final int firstDateInt = entry.value.toIntIdentifier();
          // DBに変更を保存する
          await managers.weeklyTasks
              .filter((weeklyTask) => weeklyTask.id.equals(targetId))
              .update(
                (task) => task(
                  firstDate: Value(firstDateInt),
                ),
              );
        }
      });
      return Success(null);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"),
          methodName: "updateWeeklyTasksFirstDate");
    }
  }

  // Delete（削除）
  /// 指定したデータ行を削除する
  /// filterでは対象のdayTaskのtaskが指定したデータベースと一致するかどうかでフィルタリングし、削除
  Future<void> deleteDailyTask(DayTask unnecessaryDayTask) {
    // ややこしいので省略しないが、「=>』と同じ意味
    return managers.dayTasks
        .filter(
          (f) => f.task.equals(unnecessaryDayTask.task),
        )
        .delete();
  }

  /// 新しいラベルの枠を作成し、その ID を返す
  @override
  Future<Result<int, Exception>> createNewLabel({
    required String title,
    required QTask firstTask,
  })
  // 折りたたみ用
  async {
    try {
      // LabeledTasks に新しいレコードを作成
      final int createdId = await managers.labeledTasks.create(
        (record) => switch (firstTask) {
          QDailyTask(id: final int firstTaskId) => record(
              label: title,
              dailyIdList: Value([firstTaskId].toInt32Blob()),
            ),
          QWeeklyTask(id: final int firstTaskId) => record(
              label: title,
              weeklyIdList: Value([firstTaskId].toInt32Blob()),
            ),
          QMonthlyTask(id: final int firstTaskId) => record(
              label: title,
              monthlyIdList: Value([firstTaskId].toInt32Blob()),
            ),
          QYearlyTask(id: final int firstTaskId) => record(
              label: title,
              yearlyIdList: Value([firstTaskId].toInt32Blob()),
            ),
        },
      );
      return Success(createdId);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "createNewLabel");
    }
  }

  /// ラベルテーブルの情報を更新する
  @override
  Future<Result<void, Exception>> saveLabels({required List<QLabel> qLabels})
  // 折りたたみ用
  async {
    try {
      await transaction(() async {
        for (final qLabel in qLabels) {
          final newRecord = _toLabeledTaskRecord(qLabel);
          // 指定レコード（ID を自動検索）に新しい情報を当てはめる
          await managers.labeledTasks.replace(newRecord);
        }
      });
      return Success(null);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "saveLabels");
    }
  }

  /// 各種設定を初期化する
  @override
  Future<Result<QSettingsMap, Exception>> initSettings({
    required int length,
  })
  // 折りたたみ用
  async {
    try {
      // 取得する生データを入れる枠を用意する
      final List<PageSetting> rawCreatedList = [];
      await transaction(() async {
        for (int i = 0; i < length; i++) {
          // i を識別子として、設定テーブルに登録して取得する
          final setting = await managers.pageSettings.createReturning(
            (setting) => setting(pageId: i),
          );
          rawCreatedList.add(setting);
        }
      });
      return Success(_toQSettingMap(rawCreatedList));
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "initSettings");
    }
  }

  /// 指定ページの設定値の更新を保存する
  Future<Result<void, Exception>> saveSettingChanges({
    required QPageSetting qPageSetting,
  })
  // 折りたたみ用
  async {
    try {
      // 指定ページの設定値の更新を保存する
      await managers.pageSettings
          .filter((record) => record.pageId.equals(qPageSetting.pageId))
          .update(
            (record) => record(
              primaryAutoSaves: Value(qPageSetting.primaryAutoSaves),
              reviewAutoSaves: Value(qPageSetting.reviewAutoSaves),
            ),
          );
      return Success(null);
    } catch (e, st) {
      return Failure(Exception("$e\n$st"), methodName: "saveSettingChanges");
    }
  }

  @override
  // todo スキーマバージョン
  int get schemaVersion => 22;

  // todo 統合処理 ＜＜　重いかも
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await transaction(() async {
          print("${from} → ${to} のマイグレーション中");
          // if (from < 17) {
          //   await transaction(() async {
          //
          //     await m.addColumn(weeklyTasks, weeklyTasks.month);
          //
          //   });
          // }
          if (from < 18) {
            await m.createTable(labeledTasks);
          }
          if (from < 19) {
            await m.alterTable(
              // 変更をトリガーとした処理や外部キーによる参照などを考慮できないという警告
              TableMigration(
                dayTasks, // 対象のテーブル
                columnTransformer: {
                  // date カラムのデータを変換する処理を記述
                  dayTasks.date: CustomExpression<int>(
                      // SQLiteの関数を使って、既存のStringからハイフンを除去してintにキャスト
                      'CAST(REPLACE(date, "-", "") AS INTEGER)'),
                },
              ),
            );
            await m.alterTable(
              // 変更をトリガーとした処理や外部キーによる参照などを考慮できないという警告
              TableMigration(
                monthlyTasks, // 対象のテーブル
                columnTransformer: {
                  // month カラムのデータを変換する処理を記述
                  monthlyTasks.month: CustomExpression<int>(
                    // SQLiteの関数を使って、既存のStringからハイフンを除去してintにキャスト
                      'CAST(REPLACE(month, "-", "") AS INTEGER)'),
                },
              ),
            );
            await m.alterTable(
              // 変更をトリガーとした処理や外部キーによる参照などを考慮できないという警告
              TableMigration(
                yearlyTasks, // 対象のテーブル
                columnTransformer: {
                  // year カラムのデータを変換する処理を記述
                  yearlyTasks.year: CustomExpression<int>(
                    // SQLiteの関数を使って、既存のStringからハイフンを除去してintにキャスト
                      'CAST(REPLACE(year, "-", "") AS INTEGER)'),
                },
              ),
            );
          }
          if (from < 20) {
            await m.alterTable(
              // 変更をトリガーとした処理や外部キーによる参照などを考慮できないという警告
              TableMigration(
                weeklyTasks, // 対象のテーブル
                columnTransformer: {
                  // week カラムのデータを変換する処理を記述
                  weeklyTasks.firstDate: CustomExpression<int>(
                      // SQLiteの関数を使って、既存のStringからハイフンを除去してintにキャスト
                      'CAST(REPLACE(week, "-", "") AS INTEGER)'),
                },
              ),
            );
          }
          if (from < 21) {
            await m.addColumn(dayTasks, dayTasks.labelId);
            await m.addColumn(weeklyTasks, weeklyTasks.labelId);
            await m.addColumn(monthlyTasks, monthlyTasks.labelId);
            await m.addColumn(yearlyTasks, yearlyTasks.labelId);
          }
          if (from < 22) {
            await m.createTable(reviews);

            // --- DayTasks からのデータ移行 ---
            // DayTasksの識別子を 1 とする (1 を 32ビット左シフトし、id と結合)
            await customStatement('''
            INSERT INTO reviews (taskBitId, result, improvement)
            SELECT (1 << 32) | id, result, improvement FROM day_tasks
            WHERE result IS NOT NULL OR improvement IS NOT NULL;
          ''');

            // --- WeeklyTasks からのデータ移行 ---
            // WeeklyTasksの識別子を 2 とする (2 を 32ビット左シフトし、id と結合)
            await customStatement('''
            INSERT INTO reviews (taskBitId, result, improvement)
            SELECT (2 << 32) | id, result, improvement FROM weekly_tasks
            WHERE result IS NOT NULL OR improvement IS NOT NULL;
          ''');

            // --- MonthlyTasks からのデータ移行 ---
            // MonthlyTasksの識別子を 2 とする (2 を 32ビット左シフトし、id と結合)
            await customStatement('''
            INSERT INTO reviews (taskBitId, result, improvement)
            SELECT (3 << 32) | id, result, improvement FROM monthly_tasks
            WHERE result IS NOT NULL OR improvement IS NOT NULL;
          ''');

            // --- YearlyTasks からのデータ移行 ---
            // YearlyTasksの識別子を 2 とする (2 を 32ビット左シフトし、id と結合)
            await customStatement('''
            INSERT INTO reviews (taskBitId, result, improvement)
            SELECT (4 << 32) | id, result, improvement FROM yearly_tasks
            WHERE result IS NOT NULL OR improvement IS NOT NULL;
          ''');

            // 3. 各Tasksテーブルから古いカラムを削除
            await m.alterTable(TableMigration(dayTasks));
            await m.alterTable(TableMigration(weeklyTasks));
            await m.alterTable(TableMigration(monthlyTasks));
            await m.alterTable(TableMigration(yearlyTasks));
          }
          // if (from < 2) {
          //   await m.addColumn(dayTasks, dayTasks.id);
          // }
          // if (from < 3) {
          //   await m.alterTable(TableMigration(dayTasks));
          // }
          // if (from < 4) {
          //   await m.addColumn(dayTasks, dayTasks.isChecked);
          // }
          // if (from < 5) {
          //   await m.alterTable(TableMigration(themeColorTables));
          // }
          // if (from < 6) {
          //   await m.alterTable(TableMigration(themeColorTables));
          // }
          // if (from < 7) {
          //   await m.addColumn(themeColorTables, themeColorTables.primaryNum);
          //   await m.addColumn(themeColorTables, themeColorTables.onPrimaryNum);
          //   await m.addColumn(themeColorTables, themeColorTables.isLight);
          // }
          // if (from < 8) {
          //   await m.createTable(themeColorTables);
          // }
          // if (from < 9) {
          //   await m.createTable(themeColorTables);
          // }
          // if (from < 10) {
          //   await m.createTable(themeColorTables);
          // }
          // if (from < 13) {
          //   await m.createTable(weeklyTasks);
          //   await m.createTable(monthlyTasks);
          //   await m.createTable(yearlyTasks);
          // }
          // if (from < 14) {
          //   await m.addColumn(weeklyTasks, weeklyTasks.firstDay);
          // }
          // if (from < 15) {
          //   await m.addColumn(dayTasks, dayTasks.result);
          //   await m.addColumn(dayTasks, dayTasks.improvement);
          //   await m.addColumn(weeklyTasks, weeklyTasks.result);
          //   await m.addColumn(weeklyTasks, weeklyTasks.improvement);
          //   await m.addColumn(monthlyTasks, monthlyTasks.result);
          //   await m.addColumn(monthlyTasks, monthlyTasks.improvement);
          //   await m.addColumn(yearlyTasks, yearlyTasks.result);
          //   await m.addColumn(yearlyTasks, yearlyTasks.improvement);
          // }
          print("${from} → ${to} のマイグレーションが完了");
        });
      },
    );
  }
}

/// printメソッド [database.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[database.dart]　" + s1);
    if (s2 != null) print("[database.dart]　" + s2);
    if (s3 != null) print("[database.dart]　" + s3);
    if (s4 != null) print("[database.dart]　" + s4);
    if (s5 != null) print("[database.dart]　" + s5);
    print("");
  }
}
