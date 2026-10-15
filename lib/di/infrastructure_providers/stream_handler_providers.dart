import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/infrastructure/gateway/stream_handler/monthly_tasks_stream_handler_impl.dart';
import 'package:three_tasks/use_case/stream_handler_interface/monthly_tasks_stream_handler.dart';

part 'stream_handler_providers.g.dart';

@riverpod
MonthlyTasksStreamHandler monthlyTasksStreamHandler(Ref ref) =>
    MonthlyTasksStreamHandlerImpl(
      loadingService: ref.watch(loadingServiceProvider),
    );
