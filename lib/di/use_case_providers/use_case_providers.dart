
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/infrastructure_providers/stream_handler_providers.dart';
import 'package:three_tasks/di/infrastructure_providers/data_source_providers.dart';
import 'package:three_tasks/di/infrastructure_providers/repository_providers.dart';
import 'package:three_tasks/di/presentation_providers/presenter_providers.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/use_case/input_boundary/draft_label/draft_label_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_label/fetch_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_settings/fetch_settings_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/register_new_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_label_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_settings/save_setting_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/draft_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_daily_tasks_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_monthly_tasks_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_weekly_tasks_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/watch_tasks/watch_yearly_tasks_use_case.dart';
import 'package:three_tasks/use_case/interactor/draft_label/draft_label_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/fetch_label/fetch_label_interactor.dart';
import 'package:three_tasks/use_case/interactor/fetch_settings/fetch_settings_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_label/register_new_label_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_label/save_label_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_settings/save_setting_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/draft/discard_draft_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/draft/draft_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/save_weekly_task_changes_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks/watch_daily_tasks_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks/watch_monthly_tasks_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks/watch_weekly_tasks_interactor.dart';
import 'package:three_tasks/use_case/interactor/watch_tasks/watch_yearly_tasks_interactor.dart';

part 'use_case_providers.g.dart';

// todo UseCase 層のクラスの Provider をこっちに移していく（2026/09/19）＞＞


// 日単位タスクの監視フロー
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

// 週単位タスクの監視フロー
@riverpod
WatchWeeklyTasksUseCase watchWeeklyTasksUseCase(Ref ref) {
  final instance = WatchWeeklyTasksInteractor(
    notificationService: ref.watch(notificationServiceProvider),
    dataRepository: ref.watch(dataRepositoryProvider),
    weeklyTasksPresenter: ref.watch(weeklyTasksPresenterProvider),
    weeklyTasksStreamHandler: ref.watch(weeklyTasksStreamHandlerProvider),
    loadingService: ref.watch(loadingServiceProvider),
  );
  ref.onDispose(instance.dispose);
  return instance;
}

// 月単位タスク監視フロー
@riverpod
WatchMonthlyTasksUseCase watchMonthlyTasksUseCase(Ref ref) {
  final instance = WatchMonthlyTasksInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  notificationService: ref.watch(notificationServiceProvider),
  loadingService: ref.watch(loadingServiceProvider),
  monthlyTasksPresenter: ref.watch(monthlyTasksPresenterProvider),
  monthlyTasksStreamHandler: ref.watch(monthlyTasksStreamHandlerProvider),
);
  ref.onDispose(instance.dispose);
  return instance;
}

// 年単位タスク監視フロー
@riverpod
WatchYearlyTasksUseCase watchYearlyTasksUseCase(Ref ref) {
  final instance = WatchYearlyTasksInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  notificationService: ref.watch(notificationServiceProvider),
  loadingService: ref.watch(loadingServiceProvider),
  yearlyTasksPresenter: ref.watch(yearlyTasksPresenterProvider),
  yearlyTasksStreamHandler: ref.watch(yearlyTasksStreamHandlerProvider),
);
  ref.onDispose(instance.dispose);
  return instance;
}

// タスク書き換え処理フロー
@riverpod
SaveTaskChangesUseCase saveTaskChangesUseCase(Ref ref) =>
    SaveTaskChangesInteractor(
      dataRepository: ref.watch(dataRepositoryProvider),
      notificationService: ref.watch(notificationServiceProvider),
      loadingService: ref.watch(loadingServiceProvider),
    );

// 週単位タスク書き換え処理フロー
@riverpod
SaveWeeklyTaskChangesUseCase saveWeeklyTaskChangesUseCase(Ref ref) =>
    SaveWeeklyTaskChangesInteractor(
      dataRepository: ref.watch(dataRepositoryProvider),
      notificationService: ref.watch(notificationServiceProvider),
      loadingService: ref.watch(loadingServiceProvider),
    );

// タスク情報変更下書きフロー
@riverpod
DraftTaskChangesUseCase draftTaskChangesUseCase(Ref ref) => DraftTaskChangesInteractor(
  notificationService: ref.watch(notificationServiceProvider),
  loadingService: ref.watch(loadingServiceProvider),
  dailyTasksPresenter: ref.watch(dailyTasksPresenterProvider),
  weeklyTasksPresenter: ref.watch(weeklyTasksPresenterProvider),
  monthlyTasksPresenter: ref.watch(monthlyTasksPresenterProvider),
  yearlyTasksPresenter: ref.watch(yearlyTasksPresenterProvider),
);

// 下書き破棄フロー
@riverpod
DiscardDraftUseCase discardDraftUseCase(Ref ref) => DiscardDraftInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  notificationService: ref.watch(notificationServiceProvider),
  loadingService: ref.watch(loadingServiceProvider),
);

// ラベルフェッチフロー
@riverpod
FetchLabelUseCase fetchLabelUseCase(Ref ref) => FetchLabelInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  labelsPresenter: ref.watch(labelsPresenterProvider),
  loadingService: ref.watch(loadingServiceProvider),
  notificationService: ref.watch(notificationServiceProvider),
);

// ラベル情報変更保存フロー
@riverpod
SaveLabelChangesUseCase saveLabelChangesUseCase(Ref ref) => SaveLabelChangesInteractor(
    dataRepository: ref.watch(dataRepositoryProvider),
    notificationService: ref.watch(notificationServiceProvider),
    loadingService: ref.watch(loadingServiceProvider),
);

// 新規ラベル登録フロー
@riverpod
RegisterNewLabelUseCase registerNewLabelUseCase(Ref ref) => RegisterNewLabelInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  notificationService: ref.watch(notificationServiceProvider),
  loadingService: ref.watch(loadingServiceProvider),
);

// 設定値フェッチフロー
@riverpod
FetchSettingsUseCase fetchSettingsUseCase(Ref ref)=> FetchSettingsInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  loadingService: ref.watch(loadingServiceProvider),
  notificationService: ref.watch(notificationServiceProvider),
  settingsPresenter: ref.watch(settingsPresenterProvider),
);

// 設定値変更保存フロー
@riverpod
SaveSettingChangesUseCase saveSettingChangesUseCase(Ref ref) => SaveSettingChangesInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  loadingService: ref.watch(loadingServiceProvider),
  notificationService: ref.watch(notificationServiceProvider),
  settingsPresenter: ref.watch(settingsPresenterProvider),
);