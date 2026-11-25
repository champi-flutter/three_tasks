import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/label_base.dart';
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/data_foundation/value_object/task_id_list.dart';

part 'i_label.freezed.dart';

/// ラベルインプット用 DTO
///
/// タスクの各単位ごとの ID のリストを持つ。
///
/// [taskId] はラベル化されたタスクごとの ID 。
@freezed
abstract class ILabel with LabelBase, _$ILabel {

  const ILabel._();

  const factory ILabel({
    required String title,
    required int labelId,
    required TaskIdList dailyIdList,
    required TaskIdList weeklyIdList,
    required TaskIdList monthlyIdList,
    required TaskIdList yearlyIdList,
  }) = _ILabel;
}
