
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/infrastructure_providers/cache_handler_providers.dart';
import 'package:three_tasks/di/infrastructure_providers/data_source_providers.dart';
import 'package:three_tasks/infrastructure/gateway/repositories/data_repository_impl.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

part 'repository_providers.g.dart';


@riverpod
DataRepository dataRepository(Ref ref) => DataRepositoryImpl(
  dataSource: ref.watch(dataSourceProvider),
  notificationService: ref.watch(notificationServiceProvider),
  dailyTasksCacheHandler: ref.watch(dailyTasksCacheHandlerProvider),
  weeklyTasksCacheHandler: ref.watch(weeklyTasksCacheHandlerProvider),
  monthlyTasksCacheHandler: ref.watch(monthlyTasksCacheHandlerProvider),
  yearlyTasksCacheHandler: ref.watch(yearlyTasksCacheHandlerProvider),
  labelsCacheHandler: ref.watch(labelsCacheHandlerProvider),
);