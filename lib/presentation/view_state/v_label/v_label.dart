import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/label_base.dart';

part 'v_label.freezed.dart';

/// ラベル化タスクの表示用 DTO
///
/// タスクの各単位ごとの ID のリストを持つ。
///
/// [taskId] はラベル化されたタスクごとの ID 。
@freezed
abstract class VLabel with LabelBase, _$VLabel {

  const VLabel._();

  const factory VLabel({
    required String title,
    required int labelId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _VLabel;

  /// ラベル化タスクの仮データを生成するファクトリ
  factory VLabel.placeholder() => VLabel(
        title: "",
        labelId: 0,
        dailyIdList: [],
        weeklyIdList: [],
        monthlyIdList: [],
        yearlyIdList: [],
      );
}

// /// ラベルのリストを走査する拡張メソッド
// extension LabelListScanning on List<VLabel> {
// }
