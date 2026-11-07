
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/presentation/notifier/labels_state_notifier/labels_state_notifier.dart';
import 'package:three_tasks/presentation/notifier/setting_state_notifier/page_setting_state_notifier.dart';
import 'package:three_tasks/presentation/notifier/tasks_state_notifier/tasks_state_notifier.dart';
import 'package:three_tasks/presentation/view_model/daily_tasks_view_model/daily_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/labels_view_model/labels_view_model.dart';
import 'package:three_tasks/presentation/view_model/monthly_tasks_view_model/monthly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/presentation/view_model/weekly_tasks_view_model/weekly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/yearly_tasks_view_model/yearly_tasks_view_model.dart';

part 'notifier_providers.g.dart';

@riverpod
DailyTasksStateNotifier dailyTasksStateNotifier(Ref ref) => DailyTasksViewModel();

@riverpod
WeeklyTasksStateNotifier weeklyTasksStateNotifier(Ref ref) => WeeklyTasksViewModel();

@riverpod
MonthlyTasksStateNotifier monthlyTasksStateNotifier(Ref ref) => MonthlyTasksViewModel();

@riverpod
YearlyTasksStateNotifier yearlyTasksStateNotifier(Ref ref) => YearlyTasksViewModel();


@riverpod
LabelsStateNotifier labelsStateNotifier(Ref ref) => LabelsViewModel();


@riverpod
PageSettingsStateNotifier pageSettingsStateNotifier(Ref ref) => PageSettingsViewModel();
