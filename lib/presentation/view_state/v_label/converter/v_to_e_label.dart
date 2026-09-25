
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';

/// [VLabel] エンティティから、 [ELabel] への変換ロジッククラス
class VToELabel {
  /// [ELabel] エンティティから、 [ELabel] へ変換する
  static ELabel toELabel(VLabel vLabel)=> ELabel(
    title: vLabel.title,
    labelId: vLabel.labelId,
    dailyIdList: [...vLabel.dailyIdList],
    weeklyIdList: [...vLabel.weeklyIdList],
    monthlyIdList: [...vLabel.monthlyIdList],
    yearlyIdList: [...vLabel.yearlyIdList],
  );
}