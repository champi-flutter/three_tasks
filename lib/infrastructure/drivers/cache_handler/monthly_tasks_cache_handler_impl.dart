import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/base/tasks_cache_handler_base_implementation.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/monthly_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/converter/c_to_e_task.dart';
import 'package:three_tasks/use_case/stream_handler_interface/monthly_tasks_stream_handler.dart';

/// 月単位タスクのキャッシュハンドラを実装するクラス
class MonthlyTasksCacheHandlerImpl
    extends TasksCacheHandlerBaseImplementation<Month, CMonthlyTask>
    implements MonthlyTasksCacheHandler {
  // todo コンストラクタ
  // capacity は 12 ヶ月分
  MonthlyTasksCacheHandlerImpl({
    required MonthlyTasksStreamHandler monthlyTasksStreamHandler,
  }) : _streamHandler = monthlyTasksStreamHandler, super(capacity: 12);

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final MonthlyTasksStreamHandler _streamHandler;

  /// データ更新時の反映処理の内容を実装する
  ///  - 渡されたデータを [MonthlyTasksStreamHandler] に流す
  @override
  Future<void> output(Map<Month, List<CMonthlyTask>> dataMap) async {
    // TaskList<EMonthlyTask> の Map に変換する
    final Map<Month, TaskList<EMonthlyTask>> streamMap = dataMap.map(
          (key, List<CMonthlyTask> data) => MapEntry(
        key,
        data
            .map((cTask) => CToETask.toEMonthlyTask(cTask))
            .toListAs<TaskList<EMonthlyTask>>(TaskList.fromIterable),
      ),
    );
    // キャッシュをストリームに流す
    _streamHandler.add(streamMap);
  }
}
