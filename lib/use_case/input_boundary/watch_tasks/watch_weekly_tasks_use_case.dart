
import 'package:custom_core_types/custom_core_types.dart';

/// 週単位タスクの監視フロー
///
/// [WatchWeeklyTasksUseCase.initAt] を誰かが呼び出すことで監視が始まる。
abstract class WatchWeeklyTasksUseCase {
  /// 監視フローを開始
  void initAt(List<Date> dateList);

  /// todo このクラスの dispose
  void dispose();

}