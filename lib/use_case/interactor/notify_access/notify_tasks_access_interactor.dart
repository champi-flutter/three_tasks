import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/use_case/input_boundary/notify_access/notify_tasks_access_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';


/// 日単位タスクへのアクセスを通知するフローの実装
class NotifyDailyTasksAccessInteractor
    implements NotifyDailyTasksAccessUseCase {
  NotifyDailyTasksAccessInteractor({
    required DataRepository dataRepository,
  }) : _repository = dataRepository;

  final DataRepository _repository;

  @override
  void execute(Date date) {
    _repository.notifyDailyTaskAccess(date: date);
  }
}

/// 週単位タスクへのアクセスを通知するフローの実装
class NotifyWeeklyTasksAccessInteractor
    implements NotifyWeeklyTasksAccessUseCase {
  NotifyWeeklyTasksAccessInteractor({
    required DataRepository dataRepository,
  }) : _repository = dataRepository;

  final DataRepository _repository;

  @override
  void execute(UniqueWeek week) {
    _repository.notifyWeeklyTaskAccess(week: week);
  }
}

/// 月単位タスクへのアクセスを通知するフローの実装
class NotifyMonthlyTasksAccessInteractor
    implements NotifyMonthlyTasksAccessUseCase {
  NotifyMonthlyTasksAccessInteractor({
    required DataRepository dataRepository,
  }) : _repository = dataRepository;

  final DataRepository _repository;

  @override
  void execute(Month month) {
    _repository.notifyMonthlyTaskAccess(month: month);
  }
}

/// 年単位タスクへのアクセスを通知するフローの実装
class NotifyYearlyTasksAccessInteractor
    implements NotifyYearlyTasksAccessUseCase {
  NotifyYearlyTasksAccessInteractor({
    required DataRepository dataRepository,
  }) : _repository = dataRepository;

  final DataRepository _repository;

  @override
  void execute(int year) {
    _repository.notifyYearlyTaskAccess(year: year);
  }
}
