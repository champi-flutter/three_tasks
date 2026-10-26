import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/infrastructure/gateway/stream_handler/daily_tasks_stream_handler_impl.dart';
import 'package:three_tasks/infrastructure/gateway/stream_handler/monthly_tasks_stream_handler_impl.dart';
import 'package:three_tasks/infrastructure/gateway/stream_handler/weekly_tasks_stream_handler_impl.dart';
import 'package:three_tasks/infrastructure/gateway/stream_handler/yearly_tasks_stream_handler_impl.dart';
import 'package:three_tasks/use_case/stream_handler_interface/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/stream_handler_interface/monthly_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/stream_handler_interface/weekly_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/stream_handler_interface/yearly_tasks_stream_handler.dart';

part 'stream_handler_providers.g.dart';

// 日単位タスクのストリームハンドラ
@riverpod
DailyTasksStreamHandler dailyTasksStreamHandler(Ref ref) {
  final instance = DailyTasksStreamHandlerImpl(
      loadingService: ref.watch(loadingServiceProvider));

  ref.onDispose(instance.dispose);
  return instance;
}

// 週単位タスクのストリームハンドラ
@riverpod
WeeklyTasksStreamHandler weeklyTasksStreamHandler(Ref ref) {
  final instance = WeeklyTasksStreamHandlerImpl(
      loadingService: ref.watch(loadingServiceProvider));

  ref.onDispose(instance.dispose);
  return instance;
}

// 月単位タスクのストリームハンドラ
@riverpod
MonthlyTasksStreamHandler monthlyTasksStreamHandler(Ref ref) {
  final instance =MonthlyTasksStreamHandlerImpl(
      loadingService: ref.watch(loadingServiceProvider),
    );

  ref.onDispose(instance.dispose);
  return instance;
}

// 年単位タスクのストリームハンドラ
@riverpod
YearlyTasksStreamHandler yearlyTasksStreamHandler(Ref ref) {
  final instance = YearlyTasksStreamHandlerImpl(
      loadingService: ref.watch(loadingServiceProvider),
    );

  ref.onDispose(instance.dispose);
  return instance;
}

