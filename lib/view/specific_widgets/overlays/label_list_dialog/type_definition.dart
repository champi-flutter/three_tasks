import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';

/// [VTask] に、 [VLabel] を当てはめるコールバックの型定義
typedef AddTaskIdInLabelCallback = Future<void> Function({
  required ListEntry<VLabel> vLabelEntry,
  required ListEntry<VTask> vTaskEntry,
});
