
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';

/// [ELabel] エンティティから、 [VLabel] への変換ロジッククラス
class EToVLabel {
  /// [ELabel] エンティティから、 [VLabel] へ変換する
  static VLabel toVLabel(ELabel eLabel)=> VLabel(
    title: eLabel.title,
    labelId: eLabel.labelId,
    dailyIdList: [...eLabel.dailyIdList],
    weeklyIdList: [...eLabel.weeklyIdList],
    monthlyIdList: [...eLabel.monthlyIdList],
    yearlyIdList: [...eLabel.yearlyIdList],
  );
}