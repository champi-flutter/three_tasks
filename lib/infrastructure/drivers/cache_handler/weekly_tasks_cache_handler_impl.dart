import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/base/tasks_cache_handler_base_implementation.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/converter/c_to_e_task.dart';
import 'package:three_tasks/use_case/stream_handler_interface/weekly_tasks_stream_handler.dart';

// class WeeklyTasksByWeekCacheHandlerImpl
//     extends TasksCacheHandlerBaseImplementation<UniqueWeek, CWeeklyTask>
//     implements WeeklyTasksByWeekCacheHandler {
//   // todo コンストラクタ
//   WeeklyTasksCacheHandlerImpl({
//     required WeeklyTasksStreamHandler weeklyTasksStreamHandler,
//   }) : _streamHandler = weeklyTasksStreamHandler;
//
//   // todo 依存先
//   /// ストリームハンドラのインスタンス
//   final WeeklyTasksStreamHandler _streamHandler;
//
//   ///
//   final WeeklyTasksByDateCacheHandler _weeklyTasksByDateCacheHandler;
//
//
//   /// 指定日付を含む週のうち、すでにキャッシュに存在する週を取得する
//   @override
//   List<UniqueWeek> getCachedWeeks(Date date) {
//     final result = <UniqueWeek>[];
//     // 6 〜 0 日前を探索
//     for (int diff = 6; diff >= 0; diff--) {
//       final Date tFirstDate = date.nDaysAgo(diff);
//
//       // date から diff 日前が開始日の曜日の枠を生成する
//       final targetWeek = UniqueWeek.fromDate(
//         currentDate: date,
//         firstDate: tFirstDate,
//       );
//
//       // キャッシュに存在し、データが入っているかチェックする
//       if (containsWeek(targetWeek)) {
//         result.add(targetWeek);
//       }
//     }
//     return result;
//   }
//
//   /// 指定週のデータがキャッシュされているかどうか
//   @override
//   bool containsWeek(UniqueWeek week) => cacheMap.containsKey(week);
//
//   /// データ更新時の反映処理の内容を実装する
//   ///  - 渡されたデータを [WeeklyTasksStreamHandler] に流す
//   @override
//   Future<void> output(Map<UniqueWeek, List<CWeeklyTask>> dataMap) async {
//     _dailyWeeklyTasksCacheHandler.update(key:, valueMap:);
//   }
// }

/// 週単位タスクのキャッシュハンドラを実装するクラス
class WeeklyTasksCacheHandlerImpl
    extends TasksCacheHandlerBaseImplementation<UniqueWeek, CWeeklyTask>
    implements WeeklyTasksCacheHandler {
  // todo コンストラクタ
  WeeklyTasksCacheHandlerImpl({
    required WeeklyTasksStreamHandler weeklyTasksStreamHandler,
  })  : _streamHandler = weeklyTasksStreamHandler,
        super(capacity: 9);

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final WeeklyTasksStreamHandler _streamHandler;

  /// 指定日付を含む週のうち、すでにキャッシュに存在する週を取得する
  @override
  List<UniqueWeek> getCachedWeeks(Date date) {
    final result = <UniqueWeek>[];
    // 6 〜 0 日前を探索
    for (int diff = 6; diff >= 0; diff--) {
      final Date tFirstDate = date.nDaysAgo(diff);

      // date から diff 日前が開始日の曜日の枠を生成する
      final targetWeek = UniqueWeek.fromDate(
        currentDate: date,
        firstDate: tFirstDate,
      );

      // キャッシュに存在し、データが入っているかチェックする
      if (containsWeek(targetWeek)) {
        result.add(targetWeek);
      }
    }
    return result;
  }

  /// 指定週のデータがキャッシュされているかどうか
  @override
  bool containsWeek(UniqueWeek week) => cacheMap.containsKey(week);

  @override
  Future<void> output(Map<UniqueWeek, List<CWeeklyTask>> dataMap) async {
    // データを `List<CWeeklyTask>` を `WeeklyTaskList<EWeeklyTask>` に変換する
    final Map<UniqueWeek, WeeklyTaskList<EWeeklyTask>> streamMap =
        dataMap.map((targetWeek, List<CWeeklyTask> cTaskList) {
      final List<EWeeklyTask> eTaskList =
          cTaskList.map(CToETask.toEWeeklyTask).toList();
      return MapEntry(targetWeek, WeeklyTaskList<EWeeklyTask>(eTaskList));
    });
    // キャッシュをストリームに流す
    _streamHandler.add(streamMap);
  }

// @override
// Future<void> output(Map<Date, List<List<CWeeklyTask>>> dataMap) async {
//   // データを `List<CWeeklyTask>` を `WeeklyTaskList<EWeeklyTask>` に変換する
//   final Map<Date, WeeklyTaskList<EWeeklyTask>> streamMap =
//       dataMap.map((targetDate, List<List<CWeeklyTask>> cTasksByWeek) {
//         // `List<List<CWeeklyTask>>`（週のタスクリストのリスト）を
//         // `List<CWeeklyTask>` に変換する
//         final cTaskList = [for(final subList in cTasksByWeek)...subList];
//     final List<EWeeklyTask> eTaskList =
//         cTaskList.map(ToETask.toEWeeklyTask<CWeeklyTask>).toList();
//     return MapEntry(targetDate, WeeklyTaskList<EWeeklyTask>(eTaskList));
//   });
//   // キャッシュをストリームに流す
//   _streamHandler.add(streamMap);
// }

// Future<void> output(
//     Map<Date, List<MapEntry<UniqueWeek, List<CWeeklyTask>>>> dataMap)
// async {
//   final Map<UniqueWeek,
//       Map<int, DataEntry<int, CWeeklyTask>>> cacheMapByWeek = {};
//   // TaskList<EWeeklyTask> の Map に変換する
//   // 繰り返し処理の入れ子になっており、ここの計算量が過多にならないように evict する。
//   // dataMap.map（1段目）の計算量は、日付の数（このハンドラ内の key の登録数）
//   final Map<Date, WeeklyTaskList<EWeeklyTask>> streamMap = dataMap.map(
//         (targetDate, List<MapEntry<UniqueWeek, List<CWeeklyTask>>> data) {
//           // 週単位で管理するキャッシュハンドラに渡す値（cacheMapByWeek）をセットする
//           // 計算量は、最大 3
//           for(final entryByWeek in data){
//             final UniqueWeek targetWeek = entryByWeek.key;
//             final List<CWeeklyTask> cTaskList = entryByWeek.value;
//             // targetWeek に対応する値がまだ組み込まれていない場合のみ、以下を実行する
//             if(cacheMapByWeek[targetWeek] == null) {
//               final Map<int, DataEntry<int, CWeeklyTask>> dataEntryMap = {};
//               // WeeklyTask のキャッシュの座はわからないので負の数を用いる
//               int invertIndex = 0;
//               for (final cTask in cTaskList) {
//                 invertIndex--;
//                 dataEntryMap[invertIndex] = DataEntry<int, CWeeklyTask>(
//                   id: cTask.id,
//                   value: cTask,
//                 );
//               }
//               cacheMapByWeek[targetWeek] = dataEntryMap;
//             }
//           }
//       return data.convertKeyTo<EWeeklyTask>(
//         targetDate,
//         typeConverter: ToETask.toEWeeklyTask<CWeeklyTask>,
//       );
//     },
//   );
//   // UniqueWeek を key にキャッシュする
//   _weeklyTasksByWeekCacheHandler.updateByMap(updateInfo: cacheMapByWeek);
//   // キャッシュをストリームに流す
//   _streamHandler.add(streamMap);
// }
}
