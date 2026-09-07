import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/base/tasks_cache_handler_base_implementation.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/stream_handler_interface/weekly_tasks_stream_handler.dart';

/// 週単位タスクのキャッシュハンドラを実装するクラス
class WeeklyTasksCacheHandlerImpl
    extends TasksCacheHandlerBaseImplementation<UniqueWeek, EWeeklyTask>
    implements WeeklyTasksCacheHandler {
  // todo コンストラクタ
  WeeklyTasksCacheHandlerImpl({
    required WeeklyTasksStreamHandler weeklyTasksStreamHandler,
  }) : _streamHandler = weeklyTasksStreamHandler;

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

  /// データ更新時の反映処理の内容を実装する
  ///  - 渡されたデータを [WeeklyTasksStreamHandler] に流す
  @override
  Future<void> output(Map<UniqueWeek, List<EWeeklyTask>> dataMap) async {
    // キャッシュをストリームに流す
    _streamHandler.add(dataMap);
  }
}
