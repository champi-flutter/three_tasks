
/// 日単位タスクの監視フロー
///
/// [WatchDailyTasksUseCase.init] を誰かが呼び出すことで監視が始まる。
abstract class WatchDailyTasksUseCase {
  /// 監視を開始
  void init();

  /// todo このクラスの dispose
  void dispose();

}