import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/input_parameter/task_update_parameter.dart';

/// タスク情報の変更を下書きとして保有する処理フロー
abstract class KeepAsDraftUseCase {
  /// タスク情報の変更を下書きとして保有する処理フロー
  ///   1. パラメータの [VTask] を [DTask] に変換する
  ///   2. リポジトリにテータの保存を依頼する
  ///   3. キャッシュハンドラの `update` を実行する
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  Future<Result<void, Exception>> execute({
    required List<TaskUpdateParameter> taskInfo,
  });
}
