import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/base/tasks_cache_handler_base_implementation.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/yearly_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/converter/c_to_e_task.dart';
import 'package:three_tasks/use_case/stream_handler_interface/yearly_tasks_stream_handler.dart';

/// 年単位タスクのキャッシュハンドラを実装するクラス
class YearlyTasksCacheHandlerImpl
    extends TasksCacheHandlerBaseImplementation<int, CYearlyTask>
    implements YearlyTasksCacheHandler {
  // todo コンストラクタ
  // capacity は 10 年分
  YearlyTasksCacheHandlerImpl({
    required YearlyTasksStreamHandler yearlyTasksStreamHandler,
  }) : _streamHandler = yearlyTasksStreamHandler, super(capacity: 10);

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final YearlyTasksStreamHandler _streamHandler;

  /// データ更新時の反映処理の内容を実装する
  ///  - 渡されたデータを [YearlyTasksStreamHandler] に流す
  @override
  Future<void> output(Map<int, List<CYearlyTask>> dataMap) async {
    // TaskList<EYearlyTask> の Map に変換する
    final Map<int, TaskList<EYearlyTask>> streamMap = dataMap.map(
          (key, List<CYearlyTask> data) => MapEntry(
        key,
        data
            .map((cTask) => CToETask.toEYearlyTask(cTask))
            .toListAs<TaskList<EYearlyTask>>(TaskList.fromIterable),
      ),
    );
    // キャッシュをストリームに流す
    _streamHandler.add(streamMap);
  }
}
