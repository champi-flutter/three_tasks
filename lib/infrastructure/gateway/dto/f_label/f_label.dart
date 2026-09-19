import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/label_base.dart';

part 'f_label.freezed.dart';

/// データ層からフェッチするラベルの型
@freezed
abstract class FLabel with _$FLabel, LabelBase {

  const FLabel._();

  const factory FLabel({
    required String title,
    required int labelId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _FLabel;

}