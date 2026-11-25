import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/use_case/input_boundary/notify_access/notify_tasks_access_use_case.dart';
import 'package:three_tasks/use_case/input_data/task_input_data/notify_tasks_access/notify_tasks_access_input_data.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';


/// 日単位タスクへのアクセスを通知するフローの実装
class NotifyDailyTasksAccessInteractor
    implements NotifyDailyTasksAccessUseCase {
  NotifyDailyTasksAccessInteractor({
    required DataRepository dataRepository,
  }) : _repository = dataRepository;

  final DataRepository _repository;

  @override
  void execute(NotifyDailyTasksAccessInputData inputData) {
    _repository.notifyDailyTaskAccess(date: inputData.date);
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
  void execute(NotifyWeeklyTasksAccessInputData inputData) {
    _repository.notifyWeeklyTaskAccess(week: inputData.week);
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
  void execute(NotifyMonthlyTasksAccessInputData inputData) {
    _repository.notifyMonthlyTaskAccess(month: inputData.month);
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
  void execute(NotifyYearlyTasksAccessInputData inputData) {
    _repository.notifyYearlyTaskAccess(year: inputData.year);
  }
}
