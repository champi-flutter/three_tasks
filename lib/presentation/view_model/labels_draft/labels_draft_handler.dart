

import 'package:custom_core_types/custom_core_types/cache_handler/disposable_cache/disposable_cache_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/domain/entity/e_label/e_label.dart';

/// 下書きを [ELabel] で保有する
class LabelsDraftHandler extends DisposableCacheHandler<int, List<ELabel>>{
  @override
  Future<void> output(Map<int, List<ELabel>> dataMap) async{
    // 出力処理はなし
  }

  /// 下書きを追加する
  Future<void> draftWith(ELabel eLabel)async{
    if(cache[0] == null){
      cache[0] = [eLabel];
    } else {
      cache[0]!.add(eLabel);
    }
  }

  /// 下書きを取得する
  ///
  /// 下書きがない場合は、空のリストを返す。
  List<ELabel> getDraft ()=>getAt(0)??<ELabel>[];

  // 外部からの呼び出しを制限する

  @override
  @nonVirtual
  @protected
  Future<void> update(Map<int, List<ELabel>> dataMap) =>super.update(dataMap);

  @override
  @nonVirtual
  @protected
  List<ELabel>? getAt(int key)=>super.getAt(key);

  @override
  @nonVirtual
  @protected
  Map<int, List<ELabel>> getAll()=> super.getAll();
}