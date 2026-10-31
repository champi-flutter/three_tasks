import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/infrastructure_providers/cache_handler_providers.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
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
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_weekly_tasks_use_case.dart';
import 'package:three_tasks/use_case/interactor/notify_access/notify_daily_tasks_access_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/draft/discard_draft_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_weekly_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks/watch_daily_tasks_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks/watch_weekly_tasks_interactor.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/stream_handler_interface/daily_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/stream_handler_interface/weekly_tasks_stream_handler.dart';
import 'package:three_tasks/use_case/toast_count.dart';
import 'package:three_tasks/presentation/controller/tasks_controller.dart';
import 'package:three_tasks/presentation/presenter/daily_tasks_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/weekly_tasks_presenter_impl.dart';

part 'providers.g.dart';

// todo DB

// todo UseCase
@riverpod
ToastCount toastCount(Ref ref) => ToastCount();


/// 日単位タスクのアクセス通知フロー
@riverpod
NotifyDailyTasksAccessUseCase notifyDailyTasksAccessUseCase(Ref ref) =>
    NotifyDailyTasksAccessInteractor(
        dailyTasksCacheHandler: ref.watch(dailyTasksCacheHandlerProvider));


// /// 週単位タスク操作クラス
// @riverpod
// WeeklyTasksController weeklyTasksController(Ref ref) => WeeklyTasksController(
//       saveWeeklyTaskChangesUseCase:
//           ref.watch(saveWeeklyTaskChangesUseCaseProvider),
//   keepAsDraftUseCase: ref.watch(keepAsDraftUseCaseProvider),
//     );

// キャッシュハンドラ

// ストリームハンドラ

// todo ViewModel（状態なし）
// /// 通知管理クラス
// @riverpod
// NotificationViewModel notificationViewModel(Ref ref) =>
//     NotificationViewModel(ref);
//
// /// サイドメニューVM
// @riverpod
// DrawerViewModel drawerViewModel(Ref ref) => DrawerViewModel(ref);
