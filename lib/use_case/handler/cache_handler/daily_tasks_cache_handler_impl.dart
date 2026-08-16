import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/daily_tasks_stream_handler.dart';

/// 日単位タスクのキャッシュハンドラを実装するクラス
class DailyTasksCacheHandlerImpl extends DailyTasksCacheHandler{
  // todo コンストラクタ
  DailyTasksCacheHandlerImpl({
    required super.capacity,
    required DailyTasksStreamHandler dailyTasksStreamHandler,
  }) : _streamHandler = dailyTasksStreamHandler;

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final DailyTasksStreamHandler _streamHandler;

  /// データ更新時のストリームへの反映
  @override
  Future<void> output(Map<Date, List<DDailyTask>> dataMap) async {
    // キャッシュをストリームに流す
    _streamHandler.add(dataMap);
  }
}
