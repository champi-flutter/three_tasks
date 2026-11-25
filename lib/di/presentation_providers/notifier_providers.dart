
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/presentation/notifier/labels_draft_notifier/labels_draft_notifier.dart';
import 'package:three_tasks/presentation/notifier/labels_state_notifier/labels_state_notifier.dart';
import 'package:three_tasks/presentation/notifier/setting_state_notifier/page_setting_state_notifier.dart';
import 'package:three_tasks/presentation/notifier/tasks_state_notifier/tasks_state_notifier.dart';
import 'package:three_tasks/presentation/view_state_handler/daily_tasks_view_state_notifier/daily_tasks_view_state_notifier.dart';
import 'package:three_tasks/presentation/view_state_handler/labels_draft/labels_draft_handler.dart';
import 'package:three_tasks/presentation/view_state_handler/labels_state_handler/labels_state_handler.dart';
import 'package:three_tasks/presentation/view_state_handler/setting_state_handler/page_settings_state_handler/page_settings_state_handler.dart';

part 'notifier_providers.g.dart';

// @riverpod
// DailyTasksStateNotifier dailyTasksStateNotifier(Ref ref) => DailyTasksStateHandler();

// @riverpod
// WeeklyTasksStateNotifier weeklyTasksStateNotifier(Ref ref) => WeeklyTasksStateHandler();
//
// @riverpod
// MonthlyTasksStateNotifier monthlyTasksStateNotifier(Ref ref) => MonthlyTasksStateHandler();
//
// @riverpod
// YearlyTasksStateNotifier yearlyTasksStateNotifier(Ref ref) => YearlyTasksStateHandler();


@riverpod
LabelsStateNotifier labelsStateNotifier(Ref ref) => LabelsStateHandler();


@riverpod
PageSettingsStateNotifier pageSettingsStateNotifier(Ref ref) => PageSettingsStateHandler();
