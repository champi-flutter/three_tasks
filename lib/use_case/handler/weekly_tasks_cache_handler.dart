
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';
import 'package:three_tasks/use_case/handler/weekly_tasks_stream_handler.dart';

/// 週単位タスクのキャッシュを取り扱うクラス
class WeeklyTasksCacheHandler {
  // todo コンストラクタ
  WeeklyTasksCacheHandler(
      {required WeeklyTasksStreamHandler weeklyTasksStreamHandler})
      : _streamHandler = weeklyTasksStreamHandler;

  // todo 依存先
  /// ストリームハンドラのインスタンス
  final WeeklyTasksStreamHandler _streamHandler;

  /// 週単位タスクのキャッシュ
  ///
  /// 他と異なり、3つのタスクが個別の週プロパティを持っているので、キャッシュの型は
  /// `Map<T, List<DTask>>` ではなく、`List<DTask>` 。
  Map<Date, List<DWeeklyTask>> _weeklyTasksMap = {};

  /// 指定日付の週単位タスクをまるごと置き換えて、ストリームに流す一連のプロセス
  ///  - [_weeklyTasks] を更新
  ///  - ストリームに流す
  void update(Map<Date, List<DWeeklyTask>> dataMap) {
    // 取得したデータをキャッシュの Map に組み込む
    for (var entries in dataMap.entries) {
      _weeklyTasksMap[entries.key] = entries.value;
    }
    // キャッシュをストリームに流す
    _streamHandler.add(_weeklyTasksMap);
  }
}
