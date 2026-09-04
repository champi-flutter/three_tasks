import 'package:freezed_annotation/freezed_annotation.dart';

part 'v_labeled_task.freezed.dart';

/// ラベル化タスクの表示用
///
/// タスクの各単位ごとの ID のリストを持つ。
///
/// [taskId] はラベル化されたタスクごとの ID 。
@freezed
abstract class VLabel with _$VLabel {
  const factory VLabel({
    required String title,
    required int labelId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _VLabel;

  /// ラベル化タスクの仮データを生成するファクトリ
  factory VLabel.placeholder() => VLabel(
        title: "",
        labelId: 0,
        dailyIdList: [],
        weeklyIdList: [],
        monthlyIdList: [],
        yearlyIdList: [],
      );
}

/// ラベルのリストを走査する拡張メソッド
extension LabelListScanning on List<VLabel> {
  /// 指定タイトル（[title]）と合致するラベルのID
  ///
  /// ない場合は、 `null` を返す。
  int? idWithSameTitleAs(String title) {
    for (VLabel label in this) {
      // 合致するラベルのIDを返す
      if (label.title == title) {
        return label.labelId;
      }
    }
    ;
    return null;
  }
}
