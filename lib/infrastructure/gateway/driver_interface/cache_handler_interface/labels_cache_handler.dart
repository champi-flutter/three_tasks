

import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_label/c_label.dart';

/// ラベルキャッシュハンドラ
///
/// ラベルリストを管理し、最終アクセスから一定時間がすぎると、キャッシュが破棄される
/// （custom_core_types の [SlidingTtlCacheHandler]）。
abstract class LabelsCacheHandler implements CacheHandlerBaseInterface<int, List<CLabel>>{

  @override
  @protected
  Future<void> update(Map<int, List<CLabel>> dataMap);

  /// このハンドラの [update] 呼び出し口
  ///
  /// key は `0` の 1 つのみで管理する。
  Future<void> updateLabelList(List<CLabel> dataList);

  /// キャッシュされているラベルリストの中のラベルを 1 つだけ更新する
  ///
  /// キャッシュされていなかった場合、`false` を返す。
  ///
  /// key は `0` の 1 つのみで管理する。
  Future<bool> tryUpdateSingleLabel(CLabel data);
}