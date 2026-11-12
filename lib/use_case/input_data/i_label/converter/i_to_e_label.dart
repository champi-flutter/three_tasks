import 'package:three_tasks/domain/entity/e_label/e_label.dart';
import 'package:three_tasks/use_case/input_data/i_label/i_label.dart';

class IToELabel {
  static ELabel toELabel(ILabel iLabel) {
    return ELabel(
      labelId: iLabel.labelId,
      title: iLabel.title,
      dailyIdList: [...iLabel.dailyIdList],
      weeklyIdList: [...iLabel.weeklyIdList],
      monthlyIdList: [...iLabel.monthlyIdList],
      yearlyIdList: [...iLabel.yearlyIdList],
    );
  }
}
