import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/gateways/data_source_interface/data_source.dart';
import 'package:three_tasks/gateways/repositories/data_repository_impl.dart';
import 'package:three_tasks/gateways/repositories/external_launch_repository_impl.dart';
import 'package:three_tasks/use_case/event_notifier.dart';
import 'package:three_tasks/use_case/handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks_interactor/watch_daily_tasks_interactor.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_publisher.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/services/labeled_tasks_service.dart';
import 'package:three_tasks/use_case/services/day_tasks_service.dart';
import 'package:three_tasks/use_case/services/weekly_tasks_service.dart';
import 'package:three_tasks/use_case/toast_count.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/daily_tasks_presenter.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/todays_tasks_view_model.dart';
import 'package:three_tasks/view_models/daily_tasks_view_model/tomorrows_tasks_view_model.dart';

part 'providers.g.dart';

// todo DB
@riverpod
DataSource dataSource(Ref ref) => MyDatabase();

// todo Gateway
@riverpod
DataRepository dataRepository(Ref ref) => DataRepositoryImpl(ref);

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
      dailyTasksCacheHandler: ref.watch(dailyTasksCacheHandlerProvider),
      notificationUseCase: ref.watch(notificationUseCaseProvider),
    );

/// 日単位タスクの監視フロー
@riverpod
WatchDailyTasksUseCase watchDailyTasksUseCase(Ref ref) {
  final instance = WatchDailyTasksInteractor(
    dailyTasksPublisher: ref.watch(dailyTasksPublisherProvider),
    dailyTasksStreamHandler: ref.watch(dailyTasksStreamHandlerProvider),
    notificationUseCase: ref.watch(notificationUseCaseProvider),
    dataRepository: ref.watch(dataRepositoryProvider),
  );
  ref.onDispose(instance.dispose);
  return instance;
}

/// 日単位タスク監視反映ポート
@riverpod
DailyTasksPublisher dailyTasksPublisher(Ref ref) =>
    DailyTasksPresenter(
      todaysTasksViewModel: ref.watch(todaysTasksViewModelProvider.notifier),
      tomorrowsTasksViewModel:
      ref.watch(tomorrowsTasksViewModelProvider.notifier),
    );

/// 日単位タスクのキャッシュストリームハンドラ
@riverpod
DailyTasksCacheHandler dailyTasksCacheHandler(Ref ref) =>
    DailyTasksCacheHandler(
      dailyTasksStreamHandler: ref.watch(dailyTasksStreamHandlerProvider),
    );

/// 日単位タスクのキャッシュストリームハンドラ
@riverpod
DailyTasksStreamHandler dailyTasksStreamHandler(Ref ref) =>
    DailyTasksStreamHandler();

// todo ViewModel（状態なし）
// /// 通知管理クラス
// @riverpod
// NotificationViewModel notificationViewModel(Ref ref) =>
//     NotificationViewModel(ref);
//
// /// サイドメニューVM
// @riverpod
// DrawerViewModel drawerViewModel(Ref ref) => DrawerViewModel(ref);
