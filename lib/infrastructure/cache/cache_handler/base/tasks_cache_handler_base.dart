import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';

/// 各単位タスクのキャッシュハンドラの基となるクラス
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
abstract class TasksCacheHandlerBase<K, Task extends ETask>
    extends LfuListCacheHandler<K, int, Task> {
  /// `super.capacity` を親に渡すための内部的なコンストラクタ
  /// （抽象クラスなので呼び出し不可）
  TasksCacheHandlerBase(): super(capacity: 30);

  Future<void> outputCurrentCache()=>output(cacheMap.base);
}
