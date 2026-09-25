import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';

/// [VTask] に、 [VLabel] を当てはめるコールバックの型定義
typedef AddTaskIdInLabelCallback = Future<void> Function({
  required VLabel vLabel,
  required VTask vTask,
});
