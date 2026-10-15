import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/labels_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_label/c_label.dart';

/// ラベルキャッシュハンドラの実装
class LabelsCacheHandlerImpl extends SlidingTtlCacheHandler<int, List<CLabel>>
    implements LabelsCacheHandler {
  // キャッシュの有効期限は 1000 秒
  LabelsCacheHandlerImpl() : super(timeToLive: 1000);

  /// このハンドラの [update] 呼び出し口
  ///
  /// key は `0` の 1 つのみで管理する。
  @override
  Future<void> updateLabelList(List<CLabel> dataList) => update({0: dataList});

  /// キャッシュされているラベルリストの中の一部のラベルを更新する
  ///
  /// キャッシュされていなかった場合、`false` を返す。
  ///
  /// key は `0` の 1 つのみで管理する。
  @override
  Future<bool> tryUpdateLabels(List<CLabel> data) async {
    final currentCacheList = cache[0];
    // キャッシュされている場合
    if (currentCacheList != null) {
      // 現在のキャッシュリストをコピーする
      final List<CLabel> updatingList = List<CLabel>.of(currentCacheList);
      for (final targetData in data) {
        final targetIndex = currentCacheList.indexWhere(
          (item) => item.labelId == targetData.labelId,
        );
        // 現在のラベルリストにあるラベルを変更する場合
        if (targetIndex != -1) {
          // 対象箇所を更新する
            updatingList[targetIndex] = targetData;
        }
        // 現在のラベルリストにないラベル（新規ラベル）の場合
        else {
          // 新規データを追加する
          updatingList.add(targetData);
        }
      }
      // update を呼び出して、処理完了後に true を返す
      await updateLabelList(updatingList);
      return true;
    }
    // キャッシュされていない場合
    else {
      return false;
    }
  }

  @override
  Future<void> output(Map<int, List<CLabel>> dataMap) async {
    // 監視中の更新は無視する
  }
}
