
import 'package:custom_core_types/custom_core_types.dart';

/// 週単位タスクの監視フロー
///
/// [WatchWeeklyTasksUseCase.initAt] を誰かが呼び出すことで監視が始まる。
///
/// 【データ受信時の処理フロー】
///   1. データの型を DTO から表示用に変換する
///   2. 変換後のデータを反映させる
abstract class WatchWeeklyTasksUseCase {
  /// 監視フローを開始
  void initAt(Date date);

  /// todo このクラスの dispose
  void dispose();

}