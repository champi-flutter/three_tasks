import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_label/c_label.dart';

class CToELabel {
  static ELabel toELabel(CLabel cLabel) {
    return ELabel(
      labelId: cLabel.labelId,
      title: cLabel.title,
      dailyIdList: cLabel.dailyIdList,
      weeklyIdList: cLabel.weeklyIdList,
      monthlyIdList: cLabel.monthlyIdList,
      yearlyIdList: cLabel.yearlyIdList,
    );
  }
}
