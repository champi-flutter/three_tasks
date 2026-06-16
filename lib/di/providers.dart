import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/gateways/data_source_interface/data_source.dart';
import 'package:three_tasks/gateways/repositories/data_repository_impl.dart';
import 'package:three_tasks/gateways/repositories/external_launch_repository_impl.dart';
import 'package:three_tasks/use_case/event_notifier.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';
import 'package:three_tasks/use_case/repository_interface/external_launch_repository.dart';
import 'package:three_tasks/use_case/services/launch_support_link_service.dart';
import 'package:three_tasks/use_case/services/labeled_tasks_service.dart';
import 'package:three_tasks/use_case/services/day_tasks_service.dart';
import 'package:three_tasks/use_case/services/weekly_tasks_service.dart';
import 'package:three_tasks/use_case/toast_count.dart';
import 'package:three_tasks/view_models/drawer_view_model.dart';
import 'package:three_tasks/view_models/loading_view_model.dart';
import 'package:three_tasks/view_models/notification_view_model.dart';

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

// todo ViewModel（状態なし）
// /// 通知管理クラス
// @riverpod
// NotificationViewModel notificationViewModel(Ref ref) =>
//     NotificationViewModel(ref);
//
// /// サイドメニューVM
// @riverpod
// DrawerViewModel drawerViewModel(Ref ref) => DrawerViewModel(ref);
