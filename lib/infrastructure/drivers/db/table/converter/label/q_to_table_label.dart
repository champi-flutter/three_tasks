
import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_label/q_label.dart';

class QToTableLabel {

  /// [QLabel] から [Label] への変換
  static Label toLabelRecord(QLabel qLabel) {
    return Label(
      labeledId: qLabel.labelId,
      label: qLabel.title,
      dailyIdList: qLabel.dailyId32Blob.data,
      weeklyIdList: qLabel.weeklyId32Blob.data,
      monthlyIdList: qLabel.monthlyId32Blob.data,
      yearlyIdList: qLabel.yearlyId32Blob.data,
    );
  }
}