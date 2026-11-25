import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';
import 'package:three_tasks/use_case/input_data/task_input_data/task_input_data.dart';

/// タスク情報の変更を下書きとして保有する処理フロー
abstract class DraftTaskChangesUseCase {
  /// タスク情報の変更を下書きとして保有する処理フロー
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  Future<Result<void, Exception>> execute({
    required TaskInputData draftInputData,
  });
}
