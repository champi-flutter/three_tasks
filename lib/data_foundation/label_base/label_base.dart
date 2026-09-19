
abstract mixin class LabelBase {
  /// ラベルタイトル
  String get title;

  /// ラベルの ID
  int get labelId;

  /// 日単位タスクの登録リスト
  List<int> get dailyIdList;

  /// 週単位タスクの登録リスト
  List<int> get weeklyIdList;

  /// 月単位タスクの登録リスト
  List<int> get monthlyIdList;

  /// 年単位タスクの登録リスト
  List<int> get yearlyIdList;
}

/// ラベルのリストを走査する拡張メソッド
extension LabelListScanning<Label extends LabelBase> on List<Label> {
  /// 指定タイトル（[title]）と合致するラベルのID
  ///
  /// ない場合は、 `null` を返す。
  int? idWithSameTitleAs(String title) {
    for (Label label in this) {
      // 合致するラベルのIDを返す
      if (label.title == title) {
        return label.labelId;
      }
    }
    return null;
  }
}
