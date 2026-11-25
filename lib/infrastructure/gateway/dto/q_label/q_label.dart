import 'package:data_converter/data_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/label_base.dart';
import 'package:three_tasks/data_foundation/value_object/task_id_list.dart';

part 'q_label.freezed.dart';

/// ラベル化タスクのクエリ用 DTO
///
/// タスクの各単位ごとの ID のリストは、data_converter の [TaskIdBlob] を適用する。
@freezed
abstract class QLabel with _$QLabel {
  const QLabel._();

  const factory QLabel({
    required String title,
    required int labelId,
    required TaskIdBlob dailyId32Blob,
    required TaskIdBlob weeklyId32Blob,
    required TaskIdBlob monthlyId32Blob,
    required TaskIdBlob yearlyId32Blob,
  }) = _QLabel;
}
