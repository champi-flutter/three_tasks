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

  /// キャッシュされているラベルリストの中のラベルを 1 つだけ更新する
  ///
  /// キャッシュされていなかった場合、`false` を返す。
  ///
  /// key は `0` の 1 つのみで管理する。
  @override
  Future<bool> tryUpdateSingleLabel(CLabel data) async {
    final currentCacheList = cache[0];
    final targetIndex =
        currentCacheList?.indexWhere((item) => item.labelId == data.labelId);
    // キャッシュされている場合
    // targetIndex != null なら、 currentCacheList != null
    if (targetIndex != null && currentCacheList != null) {
      // 現在のラベルリストにあるラベルを変更する場合
      if (targetIndex != -1) {
        final List<CLabel> updatedList = List<CLabel>.of(currentCacheList)
          ..[targetIndex] = data;
        await updateLabelList(updatedList);
        return true;
      }
      // 現在のラベルリストにないラベル（新規ラベル）の場合
      else{
        // 追加して更新する
        currentCacheList.add(data);
        await updateLabelList(currentCacheList);
        return true;
      }
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
