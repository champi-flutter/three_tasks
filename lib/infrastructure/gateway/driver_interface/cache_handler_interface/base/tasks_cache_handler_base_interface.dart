import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_task/c_task.dart';

/// 各単位タスクのキャッシュハンドラの基となるクラス
///   - [update]: キャッシュを更新する
///   - [outputCurrentCache]: 更新せずに、現在のキャッシュで [output] を実行する
abstract class TasksCacheHandlerBaseInterface<K, Task extends CTask>
    implements FloatingListCacheHandlerBaseInterface<K, int, Task> {

  /// キャッシュを更新せずに、現在の状態で [output] を実行する
  Future<void> outputCurrentCache();
}

/// 各単位タスクのキャッシュハンドラの基となるクラス
///   - [update]: キャッシュを更新する
///   - [outputCurrentCache]: 更新せずに、現在のキャッシュで [output] を実行する
abstract class WeeklyTasksCacheHandlerBaseInterface
    implements FloatingListCacheHandlerBaseInterface<Date, UniqueWeek, List<CWeeklyTask>> {

  /// キャッシュを更新せずに、現在の状態で [output] を実行する
  Future<void> outputCurrentCache();
}
