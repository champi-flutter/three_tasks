import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/notify_access/notify_daily_tasks_access_use_case.dart';

class NotifyDailyTasksAccessInteractor
    implements NotifyDailyTasksAccessUseCase {
  NotifyDailyTasksAccessInteractor(
      {required DailyTasksCacheHandler dailyTasksCacheHandler})
      : _cacheHandler = dailyTasksCacheHandler;

  final DailyTasksCacheHandler _cacheHandler;

  @override
  void execute(Date date) {
    _cacheHandler.notifyAccess(key: date);
  }
}
