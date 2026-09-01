import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/handler/cache_handler/daily_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/handler/cache_handler/weekly_tasks_cache_handler.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/discard_draft_use_case.dart';

/// 下書き破棄フローを実装するクラス
class DiscardDraftInteractor implements DiscardDraftUseCase {
  /// 日単位タスクのキャッシュハンドラ
  final DailyTasksCacheHandler _dailyTasksCacheHandler;

  /// 週単位タスクのキャッシュハンドラ
  final WeeklyTasksCacheHandler _weeklyTasksCacheHandler;

  /// 月単位タスクのキャッシュハンドラ
  final MonthlyTasksCacheHandler _monthlyTasksCacheHandler;

  /// 年単位タスクのキャッシュハンドラ
  final YearlyTasksCacheHandler _yearlyTasksCacheHandler;

  /// ローディングの呼び出し口
  final LoadingService _loadingService;

  /// 下書き破棄フローを実装
  @override
  Future<void> execute({required VTask task}) =>
      _loadingService.loadAsync(() async {
        // 渡された VTask に対応するキャッシュハンドラに、現在のキャッシュを流してもらう
        switch (task) {
          case VDailyTask():
            await _dailyTasksCacheHandler.outputCurrentCache();

          case VWeeklyTask():
            await _weeklyTasksCacheHandler.outputCurrentCache();

          case VMonthlyTask():
            await _monthlyTasksCacheHandler.outputCurrentCache();

          case VYearlyTask():
            await _yearlyTasksCacheHandler.outputCurrentCache();
        }
      });
}
