
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/labels_cache_handler.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_label/c_label.dart';

class LabelsCacheHandlerImpl extends TtlCacheHandler<int, List<CLabel>> implements LabelsCacheHandler{
  // キャッシュの有効期限は 1000 秒
  LabelsCacheHandlerImpl(): super(timeToLive: 1000);

  @override
  Future<void> output(Map<int, List<CLabel>> dataMap) async{
    // 監視中の更新は無視する
  }
}