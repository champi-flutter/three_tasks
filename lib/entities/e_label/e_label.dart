
import 'package:three_tasks/data_foundation/label_base/label_base.dart';

/// ラベルエンティティ
///
/// タスクの各単位ごとの ID のリストを持つ。
///
/// [taskId] はラベル化されたタスクごとの ID 。
class ELabel with LabelBase {
  final int labelId;
  String title;
  final List<int> dailyIdList;
  final List<int> weeklyIdList;
  final List<int> monthlyIdList;
  final List<int> yearlyIdList;

  ELabel({
    required this.labelId,
    required this.title,
    required this.dailyIdList,
    required this.weeklyIdList,
    required this.monthlyIdList,
    required this.yearlyIdList,
  });
}
