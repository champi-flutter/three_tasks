
import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/label_base/label_base.dart';

/// ラベルの固定長リスト
///
/// 各要素は、[ListEntry] として、`index` と `value` を持つ。
class LabelList<Label extends LabelBase> extends FixedList<Label> {

  LabelList.fromIterable(Iterable<Label> iterable)
      : super.fromIterable(
    iterable.length,
    iterable,
  );

  @protected
  LabelList._copy(super.list) : super.copy();

  @override
  LabelList<Label> get deepCopy => LabelList<Label>._copy(toList());


  /// 指定タイトル（[title]）と合致するラベルのID
  ///
  /// ない場合は、 `null` を返す。
  ListEntry<Label>? asSameTitleAs(String title) {
    for (ListEntry<Label> labelEntry in toList()) {
      // 合致するラベルのIDを返す
      if (labelEntry.value.title == title) {
        return labelEntry;
      }
    }
    return null;
  }
}