import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/di/infrastructure_providers/stream_handler_providers.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/daily_tasks_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/labels_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/monthly_tasks_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/weekly_tasks_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/yearly_tasks_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/daily_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/labels_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/monthly_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/yearly_tasks_cache_handler.dart';

part 'cache_handler_providers.g.dart';

// 日単位タスクのキャッシュストリームハンドラ
@riverpod
DailyTasksCacheHandler dailyTasksCacheHandler(Ref ref) =>
    DailyTasksCacheHandlerImpl(
      dailyTasksStreamHandler: ref.watch(dailyTasksStreamHandlerProvider),
    );

// 週単位タスクのキャッシュストリームハンドラ
@riverpod
WeeklyTasksCacheHandler weeklyTasksCacheHandler(Ref ref) =>
    WeeklyTasksCacheHandlerImpl(
      weeklyTasksStreamHandler: ref.watch(weeklyTasksStreamHandlerProvider),
    );

// 月単位タスクのキャッシュハンドラ
@riverpod
MonthlyTasksCacheHandler monthlyTasksCacheHandler(Ref ref) =>
    MonthlyTasksCacheHandlerImpl(
      monthlyTasksStreamHandler: ref.watch(
        monthlyTasksStreamHandlerProvider,
      ),
    );

// 年単位タスクのキャッシュハンドラ
@riverpod
YearlyTasksCacheHandler yearlyTasksCacheHandler(Ref ref) =>
    YearlyTasksCacheHandlerImpl(
      yearlyTasksStreamHandler: ref.watch(
        yearlyTasksStreamHandlerProvider,
      ),
    );

/// ラベルのキャッシュハンドラ
@riverpod
LabelsCacheHandler labelsCacheHandler(Ref ref) => LabelsCacheHandlerImpl();
