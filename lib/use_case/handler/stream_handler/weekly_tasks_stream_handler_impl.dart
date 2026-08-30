
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/use_case/handler/stream_handler/weekly_tasks_stream_handler.dart';

class WeeklyTasksStreamHandlerImpl extends WeeklyTasksStreamHandler{

  WeeklyTasksStreamHandlerImpl({required LoadingService loadingService}): loader = loadingService;

  @override
  final LoadingService loader;
}