import 'package:custom_core_types/custom_core_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/base_label_updater.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';

part 'label_save_parameter.freezed.dart';

/// 保存されるタスクの変更を示すパラメータ
@freezed
abstract class LabelSaveParameter
    with _$LabelSaveParameter , BaseLabelUpdater{
  const LabelSaveParameter._();

  const factory LabelSaveParameter({
    required int targetLabelId,
    String? newTitle,
    int? newDailyId,
    int? newWeeklyId,
    int? newMonthlyId,
    int? newYearlyId,
  }) = _LabelSaveParameter;
}