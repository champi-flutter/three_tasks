import 'package:data_converter/data_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_tasks/data_foundation/label_base/label_base.dart';

part 'q_label.freezed.dart';

/// ラベル化タスクのクエリ用 DTO
///
/// タスクの各単位ごとの ID のリストは、data_converter の [Int32Blob] を適用する。
@freezed
abstract class QLabel with _$QLabel {
  const QLabel._();

  // todo データソース用の形（2026/09/21）＞＞
  const factory QLabel({
    required String title,
    required int labelId,
    required Int32Blob dailyId32Blob,
    required Int32Blob weeklyId32Blob,
    required Int32Blob monthlyId32Blob,
    required Int32Blob yearlyId32Blob,
  }) = _QLabel;
}
