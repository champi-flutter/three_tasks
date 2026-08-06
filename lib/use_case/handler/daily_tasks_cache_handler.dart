import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/use_case/handler/daily_tasks_stream_handler.dart';

/// 日単位タスクのキャッシュを取り扱うクラス
class DailyTasksCacheHandler {
  // todo コンストラクタ
  DailyTasksCacheHandler(
      {required DailyTasksStreamHandler dailyTasksStreamHandler})
      : _streamHandler = dailyTasksStreamHandler;

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final DailyTasksStreamHandler _streamHandler;

  /// 日単位タスクのキャッシュ
  Map<Date, List<DDailyTask>> _dailyTasksMap = {};

  /// 指定日付の日単位タスクをまるごと置き換えて、ストリームに流す一連のプロセス
  ///  - [_dailyTasksMap] を更新
  ///  - ストリームに流す
  void update(Map<Date, List<DDailyTask>> dataMap) {
    // 取得したデータをキャッシュの Map に組み込む
    for (var entries in dataMap.entries) {
      _dailyTasksMap[entries.key] = entries.value;
    }
    // キャッシュをストリームに流す
    _streamHandler.add(_dailyTasksMap);
  }
}
