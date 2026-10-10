import 'dart:collection';

import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/domain/application_config.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_page_base.dart';
import 'package:three_tasks/view/specific_widgets/pages/todays_page.dart';

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
      PageKey("tomorrow"):,
      PageKey("weekly"):,
      PageKey("monthly"):,
      PageKey("yearly"):,
    });

// final ControlledPageList<TaskPageBase> pageList = ControlledPageList([
//   TodaysPage(),
// ]);
