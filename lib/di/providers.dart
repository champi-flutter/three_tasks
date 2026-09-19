import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/daily_tasks_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/weekly_tasks_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/daily_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/data_source_interface/data_source.dart';
import 'package:three_tasks/infrastructure/gateway/repositories/data_repository_impl.dart';
import 'package:three_tasks/infrastructure/gateway/stream_handler/daily_tasks_stream_handler_impl.dart';
import 'package:three_tasks/infrastructure/gateway/stream_handler/weekly_tasks_stream_handler_impl.dart';
import 'package:three_tasks/presentation/view_model/daily_tasks_view_model/daily_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/weekly_tasks_view_model/weekly_tasks_view_model.dart';
import 'package:three_tasks/use_case/input_boundary/notify_access/notify_daily_tasks_access_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/keep_as_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_weekly_tasks_use_case.dart';
import 'package:three_tasks/use_case/interactor/notify_access/notify_daily_tasks_access_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/draft/discard_draft_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/draft/keep_as_draft_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_weekly_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks_interactor/watch_daily_tasks_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks_interactor/watch_weekly_tasks_interactor.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/services/labeled_tasks_service.dart';
import 'package:three_tasks/use_case/stream_handler_interface/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/stream_handler_interface/weekly_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/toast_count.dart';
import 'package:three_tasks/presentation/controller/tasks_controller.dart';
import 'package:three_tasks/presentation/controller/weekly_tasks_controller.dart';
import 'package:three_tasks/presentation/presenter/daily_tasks_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/weekly_tasks_presenter_impl.dart';

part 'providers.g.dart';

// todo DB
@riverpod
DataSource dataSource(Ref ref) => MyDatabase();

// todo Gateway
@riverpod
DataRepository dataRepository(Ref ref) => DataRepositoryImpl(
      dataSource: ref.watch(dataSourceProvider),
      notificationService: ref.watch(notificationServiceProvider),
      dailyTasksCacheHandler: ref.watch(dailyTasksCacheHandlerProvider),
      weeklyTasksCacheHandler: ref.watch(weeklyTasksCacheHandlerProvider),
    );

// todo UseCase
@riverpod
ToastCount toastCount(Ref ref) => ToastCount();

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
    );

/// 週単位タスク書き換え処理フロー
@riverpod
SaveWeeklyTaskChangesUseCase saveWeeklyTaskChangesUseCase(Ref ref) =>
    SaveWeeklyTaskChangesInteractor(
      dataRepository: ref.watch(dataRepositoryProvider),
      notificationService: ref.watch(notificationServiceProvider),
      loadingService: ref.watch(loadingServiceProvider),
    );

/// 日単位タスクの監視フロー
@riverpod
WatchDailyTasksUseCase watchDailyTasksUseCase(Ref ref) {
  final instance = WatchDailyTasksInteractor(
    dailyTasksPresenter: ref.watch(dailyTasksPresenterProvider),
    dailyTasksStreamHandler: ref.watch(dailyTasksStreamHandlerProvider),
    notificationService: ref.watch(notificationServiceProvider),
    dataRepository: ref.watch(dataRepositoryProvider),
    loadingService: ref.watch(loadingServiceProvider),
  );
  ref.onDispose(instance.dispose);
  return instance;
}

/// 週単位タスクの監視フロー
@riverpod
WatchWeeklyTasksUseCase watchWeeklyTasksUseCase(Ref ref) {
  return WatchWeeklyTasksInteractor(
    notificationService: ref.watch(notificationServiceProvider),
    dataRepository: ref.watch(dataRepositoryProvider),
    weeklyTasksPresenter: ref.watch(weeklyTasksPresenterProvider),
    weeklyTasksStreamHandler: ref.watch(weeklyTasksStreamHandlerProvider),
    loadingService: ref.watch(loadingServiceProvider),
  );
}

/// 日単位タスクのアクセス通知フロー
@riverpod
NotifyDailyTasksAccessUseCase notifyDailyTasksAccessUseCase(Ref ref) =>
    NotifyDailyTasksAccessInteractor(
        dailyTasksCacheHandler: ref.watch(dailyTasksCacheHandlerProvider));

/// タスク情報の変更を下書きとして保有する処理フロー
@riverpod
KeepAsDraftUseCase keepAsDraftUseCase(Ref ref) => KeepAsDraftInteractor(
      notificationService: ref.watch(notificationServiceProvider),
      loadingService: ref.watch(loadingServiceProvider),
      dailyTasksPresenter: ref.watch(dailyTasksPresenterProvider),
    );

/// 下書き破棄フロー
@riverpod
DiscardDraftUseCase discardDraftUseCase(Ref ref) => DiscardDraftInteractor();

/// 日単位タスク監視反映ポート
@riverpod
DailyTasksPresenter dailyTasksPresenter(Ref ref) => DailyTasksPresenterImpl(
      dailyTasksViewModel: ref.watch(dailyTasksViewModelProvider.notifier),
      notificationService: ref.watch(notificationServiceProvider),
    );

/// 週単位タスク監視反映ポート
@riverpod
WeeklyTasksPresenter weeklyTasksPresenter(Ref ref) => WeeklyTasksPresenterImpl(
      notificationService: ref.watch(notificationServiceProvider),
      weeklyTasksViewModel: ref.watch(weeklyTasksViewModelProvider.notifier),
    );

/// 週単位タスク操作クラス
@riverpod
TasksController tasksController(Ref ref) => TasksController(
      saveTaskChangesUseCase: ref.watch(saveTaskChangesUseCaseProvider),
      keepAsDraftUseCase: ref.watch(keepAsDraftUseCaseProvider),
      discardDraftUseCase: ref.watch(discardDraftUseCaseProvider),
    );

/// 週単位タスク操作クラス
@riverpod
WeeklyTasksController weeklyTasksController(Ref ref) => WeeklyTasksController(
      saveWeeklyTaskChangesUseCase:
          ref.watch(saveWeeklyTaskChangesUseCaseProvider),
  keepAsDraftUseCase: ref.watch(keepAsDraftUseCaseProvider),
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
