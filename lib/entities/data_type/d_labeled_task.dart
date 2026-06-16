import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/entities/date_time_options.dart';

part 'd_labeled_task.freezed.dart';

@freezed
abstract class DLabeledTask with _$DLabeledTask {

  const factory DLabeledTask({
    required String label,
    required int taskId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _DLabeledTask;

}