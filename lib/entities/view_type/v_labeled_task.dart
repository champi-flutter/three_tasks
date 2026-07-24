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
    required int labelId,
    required List<int> dailyIdList,
    required List<int> weeklyIdList,
    required List<int> monthlyIdList,
    required List<int> yearlyIdList,
  }) = _VLabeledTask;
}

/// ラベルのリストを走査する拡張メソッド
extension LabelListScanning on List<VLabeledTask> {
  /// 指定タイトル（[title]）と合致するラベルのID
  /// 
  /// ない場合は、 `null` を返す。
  int? idWithSameTitleAs(String title) {
    for(VLabeledTask labeledTask in this){
      // 合致するラベルのIDを返す
      if(labeledTask.label == title){
        return labeledTask.labelId;
      }
    };
    return null;
  }
}
