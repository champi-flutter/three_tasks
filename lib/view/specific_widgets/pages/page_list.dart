import 'dart:collection';

import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_page_base.dart';
import 'package:three_tasks/view/specific_widgets/pages/todays_page.dart';

final ControlledPageList<TaskPageBase> pageList = ControlledPageList([
  TodaysPage(),
]);
