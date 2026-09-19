
import 'package:three_tasks/use_case/input_parameter/label_update_parameter/label_update_parameter.dart';
import 'package:three_tasks/view_models/controller/dto/label_control_parameter/label_control_parameter.dart';

/// [LabelUpdateParameter] への変換器
class ToLabelUpdateParameter {
  /// [LabelControlParameter] から [LabelUpdateParameter] に変換するメソッド
  static LabelUpdateParameter toUpdateParameter(
      LabelControlParameter controlParameter,
      )
  // 折りたたみ用
  {
    return LabelUpdateParameter(
        targetLabelId: controlParameter.targetLabelId,
      newTitle: controlParameter.newTitle,
      newDailyId: controlParameter.newDailyId,
      newWeeklyId: controlParameter.newWeeklyId,
      newMonthlyId: controlParameter.newMonthlyId,
      newYearlyId: controlParameter.newYearlyId,
    );
  }
}