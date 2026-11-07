import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/presentation_providers/notifier_providers.dart';
import 'package:three_tasks/presentation/presenter/daily_tasks_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/labels_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/monthly_tasks_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/settings_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/weekly_tasks_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/yearly_tasks_presenter_impl.dart';
import 'package:three_tasks/presentation/view_model/labels_view_model/labels_view_model.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/use_case/output_boundary/daily_tasks_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/labels_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/monthly_tasks_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/settings_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/weekly_tasks_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/yearly_tasks_presenter.dart';

part 'presenter_providers.g.dart';



// 日単位タスク監視反映ポート
@riverpod
DailyTasksPresenter dailyTasksPresenter(Ref ref) => DailyTasksPresenterImpl(
  dailyTasksStateNotifier: ref.watch(dailyTasksStateProvider),
  notificationService: ref.watch(notificationServiceProvider),
);

// 週単位タスク監視反映ポート
@riverpod
WeeklyTasksPresenter weeklyTasksPresenter(Ref ref) => WeeklyTasksPresenterImpl(
  notificationService: ref.watch(notificationServiceProvider),
  weeklyTasksStateNotifier: ref.watch(weeklyTasksStateProvider),
);

// 月単位タスク監視反映ポート
@riverpod
MonthlyTasksPresenter monthlyTasksPresenter(Ref ref) => MonthlyTasksPresenterImpl(
    monthlyTasksStateNotifier: ref.watch(monthlyTasksStateProvider),
    notificationService: ref.watch(notificationServiceProvider),
);

// 年単位タスク監視反映ポート
@riverpod
YearlyTasksPresenter yearlyTasksPresenter(Ref ref) => YearlyTasksPresenterImpl(
  yearlyTasksStateNotifier: ref.watch(yearlyTasksStateProvider),
  notificationService: ref.watch(notificationServiceProvider),
);


// ラベルデータ反映クラス
@riverpod
LabelsPresenter labelsPresenter(Ref ref) => LabelsPresenterImpl(
      labelsStateNotifier: ref.watch(labelsStateProvider),
    );

// 各種設定反映クラス
@riverpod
SettingsPresenter settingsPresenter(Ref ref)=> SettingsPresenterImpl(
  pageSettingsStateNotifier: ref.watch(pageSettingsStateProvider),
);

