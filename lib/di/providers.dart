import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/gateways/data_source_interface/data_source.dart';
import 'package:three_tasks/gateways/repositories/data_repository_impl.dart';
import 'package:three_tasks/gateways/repositories/external_launch_repository_impl.dart';
import 'package:three_tasks/use_case/event_notifier.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler_impl.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler_impl.dart';
import 'package:three_tasks/use_case/handler/stream_handler/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/daily_tasks_stream_handler_impl.dart';
import 'package:three_tasks/use_case/handler/stream_handler/weekly_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/handler/stream_handler/weekly_tasks_stream_handler_impl.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_weekly_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks_interactor/watch_daily_tasks_interactor.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/services/labeled_tasks_service.dart';
import 'package:three_tasks/use_case/services/day_tasks_service.dart';
import 'package:three_tasks/use_case/services/weekly_tasks_service.dart';
import 'package:three_tasks/use_case/toast_count.dart';
import 'package:three_tasks/view_models/controller/tasks_controller.dart';
import 'package:three_tasks/view_models/controller/weekly_tasks_controller.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/daily_tasks_presenter_impl.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/todays_tasks_view_model.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/tomorrows_tasks_view_model.dart';

part 'providers.g.dart';

// todo DB
@riverpod
DataSource dataSource(Ref ref) => MyDatabase();

// todo Gateway
@riverpod
DataRepository dataRepository(Ref ref) => DataRepositoryImpl(
      dataSource: ref.watch(dataSourceProvider),
      notificationService: ref.watch(notificationServiceProvider),
    );

// todo UseCase
@riverpod
ToastCount toastCount(Ref ref) => ToastCount();

/// 日別タスクサービスクラス
@riverpod
DayTasksService dayTasksService(Ref ref) => DayTasksService(ref);

/// 週タスクサービスクラス
@riverpod
WeeklyTasksService weeklyTasksService(Ref ref) => WeeklyTasksService(ref);

/// 「ラベル化したタスク」サービスクラス
@riverpod
LabeledTasksService labeledTasksService(Ref ref) => LabeledTasksService(ref);

/// タスク書き換え処理フロー
@riverpod
SaveTaskChangesUseCase saveTaskChangesUseCase(Ref ref) =>
    SaveTaskChangesInteractor(
      dataRepository: ref.watch(dataRepositoryProvider),
      notificationService: ref.watch(notificationServiceProvider),
      loadingService: ref.watch(loadingServiceProvider),
      dailyTasksCacheHandler: ref.watch(dailyTasksCacheHandlerProvider),
      weeklyTasksCacheHandler: ref.watch(weeklyTasksCacheHandlerProvider),
    );

/// 週単位タスク書き換え処理フロー
@riverpod
SaveWeeklyTaskChangesUseCase saveWeeklyTaskChangesUseCase(Ref ref) =>
    SaveWeeklyTaskChangesInteractor(
      dataRepository: ref.watch(dataRepositoryProvider),
      notificationService: ref.watch(notificationServiceProvider),
      loadingService: ref.watch(loadingServiceProvider),
      weeklyTasksCacheHandler: ref.watch(weeklyTasksCacheHandlerProvider),
      saveTaskChangesUseCase: ref.watch(saveTaskChangesUseCaseProvider),
    );

/// 日単位タスクの監視フロー
@riverpod
WatchDailyTasksUseCase watchDailyTasksUseCase(Ref ref) {
  final instance = WatchDailyTasksInteractor(
    dailyTasksPresenter: ref.watch(dailyTasksPresenterProvider),
    dailyTasksStreamHandler: ref.watch(dailyTasksStreamHandlerProvider),
    notificationService: ref.watch(notificationServiceProvider),
    dataRepository: ref.watch(dataRepositoryProvider),
    dailyTasksCacheHandler: ref.watch(dailyTasksCacheHandlerProvider),
    loadingService: ref.watch(loadingServiceProvider),
  );
  ref.onDispose(instance.dispose);
  return instance;
}

/// 日単位タスク監視反映ポート
@riverpod
DailyTasksPresenter dailyTasksPresenter(Ref ref) => DailyTasksPresenterImpl(
      todaysTasksViewModel: ref.watch(todaysTasksViewModelProvider.notifier),
      tomorrowsTasksViewModel:
          ref.watch(tomorrowsTasksViewModelProvider.notifier),
    );

/// 週単位タスク操作クラス
@riverpod
TasksController tasksController(Ref ref) => TasksController(
      saveTaskChangesUseCase: ref.watch(saveTaskChangesUseCaseProvider),
    );

/// 週単位タスク操作クラス
@riverpod
WeeklyTasksController weeklyTasksController(Ref ref) => WeeklyTasksController(
      saveTaskChangesUseCase: ref.watch(saveTaskChangesUseCaseProvider),
    );

// キャッシュハンドラ
/// 日単位タスクのキャッシュストリームハンドラ
@riverpod
DailyTasksCacheHandler dailyTasksCacheHandler(Ref ref) =>
    DailyTasksCacheHandlerImpl(
      dailyTasksStreamHandler: ref.watch(dailyTasksStreamHandlerProvider),
    );

/// 週単位タスクのキャッシュストリームハンドラ
@riverpod
WeeklyTasksCacheHandler weeklyTasksCacheHandler(Ref ref) =>
    WeeklyTasksCacheHandlerImpl(
      weeklyTasksStreamHandler: ref.watch(weeklyTasksStreamHandlerProvider),
    );

// ストリームハンドラ

/// 日単位タスクのキャッシュストリームハンドラ
@riverpod
DailyTasksStreamHandler dailyTasksStreamHandler(Ref ref) {
  final instance = DailyTasksStreamHandlerImpl(
      loadingService: ref.watch(loadingServiceProvider));

  ref.onDispose(instance.dispose);
  return instance;
}

/// 日単位タスクのキャッシュストリームハンドラ
@riverpod
WeeklyTasksStreamHandler weeklyTasksStreamHandler(Ref ref) {
  final instance = WeeklyTasksStreamHandlerImpl(
      loadingService: ref.watch(loadingServiceProvider));

  ref.onDispose(instance.dispose);
  return instance;
}

// todo ViewModel（状態なし）
// /// 通知管理クラス
// @riverpod
// NotificationViewModel notificationViewModel(Ref ref) =>
//     NotificationViewModel(ref);
//
// /// サイドメニューVM
// @riverpod
// DrawerViewModel drawerViewModel(Ref ref) => DrawerViewModel(ref);
