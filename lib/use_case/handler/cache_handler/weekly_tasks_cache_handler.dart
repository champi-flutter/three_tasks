import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/base/tasks_cache_handler_base.dart';

/// 週単位タスクのキャッシュを取り扱うクラス
///   - [update]: キャッシュを更新する
///   - [outputCurrentCache]: 更新せずに、現在のキャッシュで [output] を実行する
///   - [getCachedWeeks]: [Date] を指定して、その日を含む [UniqueWeek] のうち、
///   キャッシュに存在する [UniqueWeek] をリストで返す
///   - [containsWeek]: 指定した [UniqueWeek] のデータがキャッシュに存在するかどうか
///   の bool を返す
///
/// キャッシュの型は、`Map<UniqueWeek, List<DWeeklyTask>>` 。
///
/// LFU 方式の容量管理を採用している。
///
/// 　=> 対象日付のキャッシュがなくなった場合、ストリームに対象のデータが流れなくなるが、
/// VM が持つデータが更新されないだけで、元の参照ごと消えるわけではない。元の参照が切れるのは
/// VM の参照が切れた時で、参照を再開するときはもう一度 `initAt` が回って新たなキャッシュが作られる。
///
/// 親クラスの静的解析ツールの機能を引き継ぐためにインターフェースとして設置する。
abstract class WeeklyTasksCacheHandler
    extends TasksCacheHandlerBase<UniqueWeek, DWeeklyTask> {

  /// 指定日付を含む週のうち、すでにキャッシュに存在する週を取得する
  List<UniqueWeek> getCachedWeeks(Date date);

  /// 指定週のデータがキャッシュされているかどうか
  bool containsWeek(UniqueWeek week);
}
