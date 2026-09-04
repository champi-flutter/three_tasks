import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/cache/cache_handler/base/tasks_cache_handler_base.dart';

/// 日単位タスクのキャッシュを取り扱うクラス
///   - [update]: キャッシュを更新する
///   - [outputCurrentCache]: 更新せずに、現在のキャッシュで [output] を実行する
///
/// LFU 方式の容量管理を採用している。
///
/// 　=> 対象日付のキャッシュがなくなった場合、ストリームに対象のデータが流れなくなるが、
/// VM が持つデータが更新されないだけで、元の参照ごと消えるわけではない。元の参照が切れるのは
/// VM の参照が切れた時で、参照を再開するときはもう一度 `initAt` が回って新たなキャッシュが作られる。
///
/// 親クラスの静的解析ツールの機能を引き継ぐためにインターフェースとして設置する。
abstract class DailyTasksCacheHandler
    extends TasksCacheHandlerBase<Date, EDailyTask> {
}
