
import 'package:custom_core_types/custom_core_types.dart';

/// 日単位タスクの監視フロー
///
/// [WatchDailyTasksUseCase.initAt] を誰かが呼び出すことで監視が始まる。
///
/// 【データ受信時の処理フロー】
///   1. データの型を DTO から表示用に変換する
///   2. 変換後のデータを反映させる
abstract class WatchDailyTasksUseCase {
  /// 監視フローを開始
  void initAt(List<Date> dateList);

  /// todo このクラスの dispose
  void dispose();

}