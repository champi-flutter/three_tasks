import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/use_case/stream_handler_interface/weekly_tasks_stream_handler.dart';

/// 週単位タスクのストリームハンドラの具象クラス
///
///  - [listen]: ストリームを購読して、1回目のデータを受信して、初めての `onData` が
///  完了するまでローディングする。
class WeeklyTasksStreamHandlerImpl
    extends SingleStreamHandlerImplementationWithInitialLoading<
        Map<UniqueWeek, List<EWeeklyTask>>>
    implements WeeklyTasksStreamHandler {
  WeeklyTasksStreamHandlerImpl({required LoadingService loadingService})
      : loadingService = loadingService;

  @override
  final LoadingService loadingService;
}
