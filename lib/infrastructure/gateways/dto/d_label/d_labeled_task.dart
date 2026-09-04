import 'package:freezed_annotation/freezed_annotation.dart';

part 'd_labeled_task.freezed.dart';

@freezed
abstract class DLabeledTask with _$DLabeledTask {

  const factory DLabeledTask({
    required String label,
    required int labelId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _DLabeledTask;

}