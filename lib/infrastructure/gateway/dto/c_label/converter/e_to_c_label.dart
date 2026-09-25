import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/infrastructure/gateway/dto/c_label/c_label.dart';

class EToCLabel {
  static CLabel toCLabel(ELabel eLabel) {
    return CLabel(
      labelId: eLabel.labelId,
      title: eLabel.title,
      dailyIdList: eLabel.dailyIdList,
      weeklyIdList: eLabel.weeklyIdList,
      monthlyIdList: eLabel.monthlyIdList,
      yearlyIdList: eLabel.yearlyIdList,
    );
  }
}
