

/// 年単位タスクの監視フロー
///
/// [WatchYearlyTasksUseCase.initAt] を誰かが呼び出すことで監視が始まる。
///
/// 【データ受信時の処理フロー】
///   1. データの型を DTO から表示用に変換する
///   2. 変換後のデータを反映させる
abstract class WatchYearlyTasksUseCase {
  /// 監視フローを開始
  void initAt(int targetYear);

  /// todo このクラスの dispose
  void dispose();

}