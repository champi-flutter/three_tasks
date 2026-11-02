
import 'package:data_converter/data_converter.dart';
import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_label/q_label.dart';

class TableToQLabel {
  /// [Label]（テーブルクラス）から [QLabel]（クエリ用DTO）へ変換
  static QLabel toQLabel(Label rawData) {
    return QLabel(
      title: rawData.label,
      labelId: rawData.labeledId,
      dailyId32Blob: Int32Blob.fromUint8List(rawData.dailyIdList),
      weeklyId32Blob: Int32Blob.fromUint8List(rawData.weeklyIdList),
      monthlyId32Blob: Int32Blob.fromUint8List(rawData.monthlyIdList),
      yearlyId32Blob: Int32Blob.fromUint8List(rawData.yearlyIdList),
    );
  }

  /// [Label]（テーブルクラス）の List から [QLabel]（クエリ用DTO）の
  /// List へ変換
  static List<QLabel> toQLabelList(List<Label> rawDataList) {
    return rawDataList.map(toQLabel).toList();
  }
}