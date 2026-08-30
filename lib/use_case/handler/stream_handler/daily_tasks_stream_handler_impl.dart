
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/use_case/handler/stream_handler/daily_tasks_stream_handler.dart';

class DailyTasksStreamHandlerImpl extends DailyTasksStreamHandler{

  DailyTasksStreamHandlerImpl({required LoadingService loadingService}): loader = loadingService;

  @override
  final LoadingService loader;
}