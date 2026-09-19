
import 'package:three_tasks/infrastructure/gateway/dto/label_save_parameter/label_save_parameter.dart';
import 'package:three_tasks/use_case/input_parameter/label_update_parameter/label_update_parameter.dart';

class ToLabelSaveParameter {
  static LabelSaveParameter toSaveParameter (LabelUpdateParameter updateParameter){
    return LabelSaveParameter(
      targetLabelId: updateParameter.targetLabelId,
      newTitle: updateParameter.newTitle,
      newDailyId: updateParameter.newDailyId,
      newWeeklyId: updateParameter.newWeeklyId,
      newMonthlyId: updateParameter.newMonthlyId,
      newYearlyId: updateParameter.newYearlyId,
    );
  }
}