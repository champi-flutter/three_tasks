import 'package:three_tasks/data_foundation/value_object/task_id_list.dart';
import 'package:three_tasks/presentation/controller/dto/label_control_parameter/label_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/use_case/input_data/i_label/i_label.dart';

class LabelInputConverter {
  LabelInputConverter._();

  static ILabel toILabel({
    required VLabel vLabel,
    required LabelControlParameter parameter,
  }) {
    final List<int> appliedDailyIdList = vLabel.dailyIdList.toMutable()
      ..addOr(parameter.newDailyId);

    final List<int> appliedWeeklyIdList = vLabel.weeklyIdList.toMutable()
      ..addOr(parameter.newWeeklyId);
    final List<int> appliedMonthlyIdList = vLabel.monthlyIdList.toMutable()
      ..addOr(parameter.newMonthlyId);
    final List<int> appliedYearlyIdList = vLabel.yearlyIdList.toMutable()
      ..addOr(parameter.newYearlyId);
    return ILabel(
      labelId: vLabel.labelId,
      title: parameter.newTitle ?? vLabel.title,
      dailyIdList: TaskIdList(appliedDailyIdList),
      weeklyIdList: TaskIdList(appliedWeeklyIdList),
      monthlyIdList: TaskIdList(appliedMonthlyIdList),
      yearlyIdList: TaskIdList(appliedYearlyIdList),
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
