import 'dart:collection';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/application_config.dart';
import 'package:three_tasks/presentation/view_model/daily_tasks_view_model/daily_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/monthly_tasks_view_model/monthly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/weekly_tasks_view_model/weekly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_model/yearly_tasks_view_model/yearly_tasks_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/task_page_base.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/this_months_page.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/this_weeks_page.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/this_years_page.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/todays_page.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_pages/tomorrows_page.dart';

/// [ControlledPageView] が表示するページのリストを返す
///
/// このページリストの参照元の [Token] を当てはめる。
ControlledPageList<TaskPageBase> pageList({
  required Token scopeToken,
}) =>
    ControlledPageList.fromPageConfig(
      pageConfig: pageConfig,
      pageMap: _pageMap(scopeToken: scopeToken,),
    );

/// ドメイン層で定義されたページの key と実際のページクラスを紐づける Map
PageMap<TaskPageBase> _pageMap({
  required Token scopeToken,
}) =>
    PageMap<TaskPageBase>({
      PageKey("today"): TodaysPage(
        pageIndex: 0,
        scopeToken: scopeToken,
      ),
      PageKey("tomorrow"): TomorrowsPage(
        pageIndex: 1,
        scopeToken: scopeToken,
      ),
      PageKey("weekly"): ThisWeeksPage(
        pageIndex: 2,
        scopeToken: scopeToken,
      ),
      PageKey("monthly"): ThisMonthsPage(
        pageIndex: 3,
        scopeToken: scopeToken,
      ),
      PageKey("yearly"): ThisYearsPage(
        pageIndex: 4,
        scopeToken: scopeToken,
      ),
    });

/// 現在のページが参照しているタスク VM の `state` を `ref.read` で一度だけ取得する
TaskList<VTask> getTaskStateOnCurrentPage(WidgetRef ref, {
  required int pageIndex,
})
// 折りたたみ用
{
  switch (pageIndex) {
    case 0:
      return ref.read(dailyTasksViewModelProvider.notifier).getCurrentStateAt(
        today,
      );
    case 1:
      return ref.read(dailyTasksViewModelProvider.notifier).getCurrentStateAt(
        tomorrow,
      );
    case 2:
      return ref.read(weeklyTasksViewModelProvider.notifier).getCurrentStateAt(
        today,
      );
    case 3:
      return ref.read(monthlyTasksViewModelProvider.notifier).getCurrentStateAt(
        thisMonth,
      );
    case 4:
      return ref.read(yearlyTasksViewModelProvider.notifier).getCurrentStateAt(
        thisYear,
      );
    default:
      throw RangeError(
        "[currentTaskState] 無効なインデックスです。\n（pageIndex = $pageIndex）",
      );
  }
}

// final ControlledPageList<TaskPageBase> pageList = ControlledPageList([
//   TodaysPage(),
// ]);
