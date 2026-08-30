import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/weekly_tasks_stream_handler.dart';

/// 週単位タスクのキャッシュハンドラを実装するクラス
class WeeklyTasksCacheHandlerImpl extends WeeklyTasksCacheHandler{
  // todo コンストラクタ
  WeeklyTasksCacheHandlerImpl({
    required WeeklyTasksStreamHandler weeklyTasksStreamHandler,
  }) : _streamHandler = weeklyTasksStreamHandler;

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final WeeklyTasksStreamHandler _streamHandler;

  /// 指定日付を含む週のうち、すでにキャッシュに存在する週を取得する
  @override
  List<UniqueWeek> getCachedWeeks(Date date){
    final result = <UniqueWeek>[];
    // 6 〜 0 日前を探索
    for(int diff = 6; diff >= 0; diff--){
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
  bool containsWeek(UniqueWeek week)=> cacheMap.base.containsKey(week);

  /// データ更新時のストリームへの反映
  @override
  Future<void> output(Map<UniqueWeek, List<DWeeklyTask>> dataMap) async {
    // キャッシュをストリームに流す
    _streamHandler.add(dataMap);
  }
}
