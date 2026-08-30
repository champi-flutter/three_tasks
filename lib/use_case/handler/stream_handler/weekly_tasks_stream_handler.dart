import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_core_types/custom_core_types/custom_stream/stream_handler/stream_handler_with_initial_loading.dart';
import 'package:three_tasks/entities/data_type/d_task.dart';

/// 週単位タスクのキャッシュストリームを扱うクラス
///  - [listen]: ストリームを指定して購読を開始する。
///  - [cancel]: 購読を破棄する。
///  - [pause]: 購読を一時停止する。
///  - [resume]: 一時停止中の購読を再開する。
///  - [dispose]: 購読の取り扱いを明示的に終了する。
///  - [add]: データをストリームに流す。
abstract class WeeklyTasksStreamHandler
    extends StreamHandlerWithInitialLoading<Map<UniqueWeek, List<DWeeklyTask>>> {
}
