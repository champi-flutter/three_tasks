import 'package:three_tasks/presentation/controller/dto/label_control_parameter/label_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/use_case/input_data/i_label/i_label.dart';

class LabelInputConverter {

  LabelInputConverter._();

  static ILabel toILabel({
    required VLabel vLabel,
    required LabelControlParameter parameter,
  }) {
    final List<int> dailyIdList = vLabel.dailyIdList
      ..addOr(parameter.newDailyId);
    final List<int> weeklyIdList = vLabel.weeklyIdList
      ..addOr(parameter.newWeeklyId);
    final List<int> monthlyIdList = vLabel.monthlyIdList
      ..addOr(parameter.newMonthlyId);
    final List<int> yearlyIdList = vLabel.yearlyIdList
      ..addOr(parameter.newYearlyId);
    return ILabel(
      labelId: vLabel.labelId,
      title: parameter.newTitle ?? vLabel.title,
      dailyIdList: dailyIdList,
      weeklyIdList: weeklyIdList,
      monthlyIdList: monthlyIdList,
      yearlyIdList: yearlyIdList,
    );
  }
}

extension _AddNullableInt on List<int> {
  void addOr(int? value) {
    if (value != null) {
      add(value);
    }
  }
}
