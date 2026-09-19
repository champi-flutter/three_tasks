import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/base/tasks_cache_handler_base_implementation.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/daily_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';
import 'package:three_tasks/use_case/stream_handler_interface/daily_tasks_stream_handler.dart';

/// 日単位タスクのキャッシュハンドラを実装するクラス
class DailyTasksCacheHandlerImpl
    extends TasksCacheHandlerBaseImplementation<Date, CDailyTask>
    implements DailyTasksCacheHandler {
  // todo コンストラクタ
  // capacity は 14 日分
  DailyTasksCacheHandlerImpl({
    required DailyTasksStreamHandler dailyTasksStreamHandler,
  }) : _streamHandler = dailyTasksStreamHandler, super(capacity: 14);

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final DailyTasksStreamHandler _streamHandler;

  /// データ更新時の反映処理の内容を実装する
  ///  - 渡されたデータを [DailyTasksStreamHandler] に流す
  @override
  Future<void> output(Map<Date, List<CDailyTask>> dataMap) async {
    // TaskList<EDailyTask> の Map に変換する
    final Map<Date, TaskList<EDailyTask>> streamMap = dataMap.map(
      (key, List<CDailyTask> data) => MapEntry(
        key,
        data
            .map((cTask) => ToETask.toEDailyTask<CDailyTask>(cTask))
            .toListAs<TaskList<EDailyTask>>(TaskList.fromIterable),
      ),
    );
    // キャッシュをストリームに流す
    _streamHandler.add(streamMap);
  }

  /// 指定 [date] のデータがキャッシュされているかどうか
  @override
  bool isCachedAt(Date date) => cacheMap.containsKey(date);
}
