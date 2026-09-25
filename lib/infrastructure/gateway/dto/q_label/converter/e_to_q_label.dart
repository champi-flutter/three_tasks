

import 'package:data_converter/data_converter.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_label/q_label.dart';

/// [ELabel] を継承した DS から、[QLabel] への変換
class EToQLabel {
  /// [ELabel] を継承した DS から [QLabel] へ変換する
  static QLabel toQLabel(ELabel eLabel) {
    return QLabel(
      title: eLabel.title,
      labelId: eLabel.labelId,
      dailyId32Blob: eLabel.dailyIdList._toQList(),
      weeklyId32Blob: eLabel.weeklyIdList._toQList(),
      monthlyId32Blob: eLabel.monthlyIdList._toQList(),
      yearlyId32Blob: eLabel.yearlyIdList._toQList(),
    );
  }
}

extension LoadTaskIdListInQLabel on List<int>{
  Int32Blob _toQList(){
    return Int32Blob.fromIntList(this);
  }
}