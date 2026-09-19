import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/base_label_updater.dart';

part 'label_control_parameter.freezed.dart';

/// ラベル更新用パラメータ
@freezed
abstract class LabelControlParameter with _$LabelControlParameter, BaseLabelUpdater{

  const LabelControlParameter._();

  const factory LabelControlParameter({
    required int targetLabelId,
    String? newTitle,
    int? newDailyId,
    int? newWeeklyId,
    int? newMonthlyId,
    int? newYearlyId,
  }) = _LabelControlParameter;
}