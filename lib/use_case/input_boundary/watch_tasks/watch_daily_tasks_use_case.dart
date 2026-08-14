
import 'package:custom_core_types/custom_core_types.dart';

/// 日単位タスクの監視フロー
///
/// [WatchDailyTasksUseCase.initAt] を誰かが呼び出すことで監視が始まる。
abstract class WatchDailyTasksUseCase {
  /// 監視フローを開始
  void initAt(List<Date> dateList);

  /// todo このクラスの dispose
  void dispose();

}