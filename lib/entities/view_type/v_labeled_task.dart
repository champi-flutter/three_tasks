import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/entities/date_time_options.dart';

part 'v_labeled_task.freezed.dart';

/// ラベル化タスクの表示用
///
/// タスクの各単位ごとの ID のリストを持つ。
///
/// [taskId] はラベル化されたタスクごとの ID 。
@freezed
abstract class VLabeledTask with _$VLabeledTask {

  const factory VLabeledTask({
    required String label,
    required int taskId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _VLabeledTask;

}