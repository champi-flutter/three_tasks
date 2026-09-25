
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/label_base.dart';

part 'c_label.freezed.dart';

/// ラベル化タスクのキャッシュ用 DTO
///
/// タスクの各単位ごとの ID のリストを持つ。
@freezed
abstract class CLabel with LabelBase, _$CLabel {

  const CLabel._();

  const factory CLabel({
    required String title,
    required int labelId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _CLabel;
}
