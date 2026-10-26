import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/use_case/stream_handler_interface/yearly_tasks_stream_handler.dart';

/// 年単位タスクのストリームハンドラの具象クラス
///
///  - [listen]: ストリームを購読して、1回目のデータを受信して、初めての `onData` が
///  完了するまでローディングする。
class YearlyTasksStreamHandlerImpl
    extends SingleStreamHandlerImplementationWithInitialLoading<
        Map<int, TaskList<EYearlyTask>>> implements YearlyTasksStreamHandler {
  YearlyTasksStreamHandlerImpl({required LoadingService loadingService})
      : loadingService = loadingService;

  @override
  final LoadingService loadingService;
}
