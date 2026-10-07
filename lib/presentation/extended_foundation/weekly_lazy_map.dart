import 'dart:collection';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';

/// データを `Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>>` で持ち、
/// 大括弧で [Date] を指定すると、 `LazyViewState<TaskList<VWeeklyTask>>`
/// を返すハッシュマップクラス
///
/// 大括弧の operator の処理は若干重めなので、View 層で監視する際は、以下のように、
/// build につき1回だけ参照すること。
/// ```
/// final LazyViewState<TaskList<VWeeklyTask>> weeklyTasksState =
///     ref.watch(weeklyTasksViewModelProvider.select((state)=> state[today]));
/// ```
class WeeklyLazyMap {
  WeeklyLazyMap({
    Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>>? initialData,
    required this.onAnyAccess,
    required this.onNewAccess,
    required TaskList<VWeeklyTask> Function(Date key) placeholder,
  })  : _source =
            Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>>.of(
                initialData ?? {}),
        _refLengthAtEachDate = {},
        placeholder = ((Date key) =>
            LazyViewState<TaskList<VWeeklyTask>>.placeholder(placeholder(key)));

  /// コピーメソッドのためのプライベートなコンストラクタ
  WeeklyLazyMap._copy({
    required Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>> source,
    required Map<Date, int> refLengthAtEachDate,
    required this.onAnyAccess,
    required this.onNewAccess,
    required this.placeholder,
  })  : _source = {...source},
        _refLengthAtEachDate = refLengthAtEachDate;

  /// まだ値の入っていない key にアクセスされたときのコールバック
  @protected
  final void Function(Date key) onAnyAccess;

  /// まだ値の入っていない key にアクセスされたときのコールバック
  @protected
  final void Function(Date key) onNewAccess;

  /// [onNewAccess] が呼ばれている間に入れる仮データ
  @protected
  late final LazyViewState<TaskList<VWeeklyTask>> Function(Date key)
      placeholder;

  // final Map<Date, TaskList<VWeeklyTask>> _dateMap;

  /// 送られてくる単位のタスクリスト
  final Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>> _source;

  /// 各 key （日付）が持つタスクの数
  final Map<Date, int> _refLengthAtEachDate;

  // @override
  LazyViewState<TaskList<VWeeklyTask>> operator [](Object? key) {
    if (key is Date) {
      // 参照前段階での有効要素数
      final int? oldListLength = _refLengthAtEachDate[key];

      // まだ登録されていない日付の場合、onNewAccess を呼ぶ
      if (oldListLength == null) {
        onNewAccess(key);
        return placeholder(key);
      }

      // // _source を、対象日付を含む週のエントリのリストに変換する
      // // fixme UniqueWeek を持つリストから対象日付を探索する計算ロジックは改善の余地あり
      // //  （現状 O(n) （n は UniqueWeek の数））
      // final taskEntries =
      //     _source.entries.where((e) => e.key.includesDate(key)).toList();
      //
      // // 週が古い順の順になるようにソートする
      // // （更新時の順番の乱れを防ぐ）
      // taskEntries.sort((a, b) => a.key.compareTo(b.key));

      final taskEntries =
          <MapEntry<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>>>[];
      // key（指定日付）を含む週の開始日で探索する（最大7回）
      // 開始日順に探索することで、週が古い順になるようにする（更新時の順番の乱れを防ぐ）
      for (int diff = 1; diff <= 7; diff++) {
        final Date targetFirstDate = key.nDaysAgo((key.week - diff) % 7);
        final targetWeek = UniqueWeek.fromDate(
          currentDate: key,
          firstDate: targetFirstDate,
        );

        final LazyViewState<WeeklyTaskList<VWeeklyTask>>? targetTaskList =
            _source[targetWeek];
        if (targetTaskList != null) {
          taskEntries.add(MapEntry(targetWeek, targetTaskList));
        }
      }

      // 最大7件の中だけでソート（件数が定数のため計算量は O(1)）
      if (taskEntries.length > 1) {
        taskEntries.sort((a, b) => a.key.compareTo(b.key));
      }

      final List<VWeeklyTask> resultList = [];

      // ソート済みの値を取り出して、EWeeklyTask に変換して、結果リストを作成する
      for (final entry in taskEntries) {
        // 週1つ分のタスクリストのstate
        final LazyViewState<WeeklyTaskList<VWeeklyTask>> tasksStateOfUnitWeek =
            entry.value;

        final WeeklyTaskList<VWeeklyTask> tasksOfUnitWeek =
            tasksStateOfUnitWeek.data;

        // Iterable<VWeeklyTask> に変換する
        final iterable = tasksOfUnitWeek.mapValues((value) => value);

        resultList.addAll(iterable);
      }

      final int newLength = resultList.length;

      // _refLengthAtEachDate に登録されている要素数より少ない（減っている）場合、
      // キャッシュが evict されたことを意味するので、onNewAccess を呼ぶ
      if (newLength < oldListLength) {
        onNewAccess(key);
        return placeholder(key);
      }

      // そうでない場合は、登録を更新する
      _refLengthAtEachDate[key] = newLength;

      // データが 2 つ以下のとき、足りない分を、`VWeeklyTask.placeholder2` で埋める
      final int numOfEmpty = 3 - newLength;
      for (int i = 1; i <= numOfEmpty; i++) {
        resultList.add(VWeeklyTask.placeholder2(today));
      }

      // TaskList を返す時のみ onAnyAccess を回す
      onAnyAccess(key);

      // TaskList に変換する
      final taskList = TaskList<VWeeklyTask>(
        resultList[0],
        resultList[1],
        resultList[2],
      );
      return LazyViewState.data(taskList);
    } else {
      throw Exception("key が不適当です");
    }
  }

  // @override
  // TaskList<VWeeklyTask> operator [](Object? key) {
  //   if (key is Date) {
  //     // 参照前段階での有効要素数
  //     final TaskList<VWeeklyTask>? targetTaskList = _dateMap[key];
  //
  //     // _dateMap にまだ登録されていない日付の場合、onNewAccess を呼ぶ
  //     if (targetTaskList == null) {
  //       _dateMap[key] = placeholder;
  //       onNewAccess(key);
  //       return placeholder;
  //     }
  //     else {
  //       // _source を key を含む週のエントリのリストに変換する
  //       final taskEntries =
  //       _source.entries.where((e) => e.key.includesDate(key)).toList();
  //
  //       // 週が古い順の順になるようにソートする
  //       // （更新時の順番の乱れを防ぐ）
  //       taskEntries.sort((a, b) => a.key.compareTo(b.key));
  //
  //       final List<VWeeklyTask> resultList = [];
  //
  //       // ソート済みの値を取り出して、EWeeklyTask に変換して、結果リストを作成する
  //       for (final entry in taskEntries) {
  //         // 週1つ分のタスクのリスト
  //         final WeeklyTaskList<VWeeklyTask> tasksOfUnitWeek = entry.value;
  //
  //         // Iterable<VWeeklyTask> に変換する
  //         final iterable = tasksOfUnitWeek.mapValues((value) => value);
  //
  //         resultList.addAll(iterable);
  //       }
  //
  //       final int newLength = resultList.length;
  //
  //       // _refLengthAtEachDate に登録されている要素数より少ない（減っている）場合、
  //       // キャッシュが evict されたことを意味するので、onNewAccess を呼ぶ
  //       if (newLength < ta) {
  //         onNewAccess(key);
  //         return placeholder(key);
  //       }
  //
  //       // そうでない場合は、登録を更新する
  //       _refLengthAtEachDate[key] = newLength;
  //
  //       // データが 2 つ以下のとき、足りない分を、`VWeeklyTask.placeholder2` で埋める
  //       final int numOfEmpty = 3 - newLength;
  //       for (int i = 1; i <= numOfEmpty; i++) {
  //         resultList.add(VWeeklyTask.placeholder2(today));
  //       }
  //
  //       // TaskList に変換する
  //       return TaskList<VWeeklyTask>(
  //         resultList[0],
  //         resultList[1],
  //         resultList[2],
  //       );
  //     }
  //   } else {
  //     throw Exception("key が不適当です");
  //   }
  // }

  void setReception(UniqueWeek week, WeeklyTaskList<VWeeklyTask> value) {
    _source[week] = LazyViewState.data(value);
  }

  // @override
  // void operator []=(Date key, TaskList<VWeeklyTask> value) {
  //   throw UnsupportedError("[WeeklyLazyMap] operator `[]=` は無効です。");
  // }

  // @override
  void clear() {
    _source.clear();
    _refLengthAtEachDate.clear();
  }

  // @override
  TaskList<VWeeklyTask>? remove(Object? key) {
    _refLengthAtEachDate.remove(key);
    _source.remove(key);
    return null;
  }

  /// 指定 [UniqueWeek] のを更新して、複製した [WeeklyLazyMap] の新しい枠を返すメソッド
  ///
  /// 受信データを当てはめたコピーを返す
  WeeklyLazyMap copyReception(UniqueWeek key, WeeklyTaskList<VWeeklyTask> value) =>
      copyWith(key, LazyViewState.data(value));

  /// [copyWith] の override
  ///
  /// 呼び出しは、他のメソッドに限定する。
  @protected
  WeeklyLazyMap copyWith(
    UniqueWeek key,
    LazyViewState<WeeklyTaskList<VWeeklyTask>> value,
  ) {
    final newMap = Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>>.of(_source)..[key] = value;
    return WeeklyLazyMap._copy(
      source: newMap,
      refLengthAtEachDate: _refLengthAtEachDate,
      onAnyAccess: onAnyAccess,
      onNewAccess: onNewAccess,
      placeholder: placeholder,
    );
  }

  /// 自身を更新して、複製した [WeeklyLazyMap] の新しい枠を返すメソッド
  WeeklyLazyMap copyAs(
    Map<UniqueWeek, LazyViewState<WeeklyTaskList<VWeeklyTask>>> newMap,
  ) {
    return WeeklyLazyMap._copy(
      source: newMap,
      refLengthAtEachDate: _refLengthAtEachDate,
      onAnyAccess: onAnyAccess,
      onNewAccess: onNewAccess,
      placeholder: placeholder,
    );
  }
}

/// 週タスクの key の変換ロジック
///
/// `Iterable<MapEntry<UniqueWeek, List<WeeklyTask>>>` は、
/// `Map<UniqueWeek, List<WeeklyTask>>` の `entries` 。
extension WeeklyTasksKeyConverter<WeeklyTask extends WeeklyTaskBase>
    on Iterable<MapEntry<UniqueWeek, List<WeeklyTask>>> {
  MapEntry<Date, WeeklyTaskList<ConvertedTaskType>>
      convertKeyTo<ConvertedTaskType extends WeeklyTaskBase>(
    Date targetDate, {
    ConvertedTaskType Function(WeeklyTask)? typeConverter,
  })
  // 折りたたみ用
  {
    // 変換後の型が指定されなかった場合は、typeConverter にそのまま返す関数を代入する
    if (WeeklyTask is ConvertedTaskType) {
      typeConverter = ((task) => task as ConvertedTaskType);
    }
    // それでも null になる場合は例外を投げる
    if (typeConverter == null) {
      throw Exception(
        "[convertKeyTo] 変換後の型を指定する場合、引数 `typeConverter` を指定してください。",
      );
    } else {
      // _source を key を含む週のエントリのリストに変換する
      final taskEntries = where((e) => e.key.includesDate(targetDate)).toList();

      // 週が古い順の順になるようにソートする
      // （更新時の順番の乱れを防ぐ）
      taskEntries.sort((a, b) => a.key.compareTo(b.key));

      final List<ConvertedTaskType> resultList = [];

      // ソート済みの値を取り出して、EWeeklyTask に変換して、結果リストを作成する
      for (final entry in taskEntries) {
        // 週1つ分のタスクのリスト
        final List<WeeklyTask> tasksOfUnitWeek = entry.value;

        // List<WeeklyTask> から Iterable<ConvertedTaskType> に変換する
        final iterable = tasksOfUnitWeek.map(typeConverter);

        resultList.addAll(iterable);
      }

      // MapEntry<Date, WeeklyTaskList<ConvertedTaskType>> に変換する
      return MapEntry<Date, WeeklyTaskList<ConvertedTaskType>>(
        targetDate,
        WeeklyTaskList<ConvertedTaskType>(resultList),
      );
    }
  }
}

extension SetPlaceholder on WeeklyTaskList<VWeeklyTask> {
  TaskList<VWeeklyTask> toTaskList() {
    // タスクを3つ以上含む場合は、 RangeError を投げる
    if (length > 3) {
      throw RangeError(
        "[WeeklyTaskList.toTaskList] 無効なリストです。\nlength = $length",
      );
    }
    // 普通の `List` に変換する。
    final List<VWeeklyTask> resultList = this.toValueList();
    // データが 2 つ以下のとき、足りない分を、`VWeeklyTask.placeholder2` で埋める
    final int numOfEmpty = 3 - length;
    for (int i = 1; i <= numOfEmpty; i++) {
      resultList.add(VWeeklyTask.placeholder2(today));
    }
    // TaskList に変換する
    return TaskList<VWeeklyTask>(
      resultList[0],
      resultList[1],
      resultList[2],
    );
  }
}
