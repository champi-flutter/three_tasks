import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';

/// タスクごとの変更パラメータを表す型定義
typedef TaskUpdateParameter = ({
  VTask targetVTask,
  String? newTitle,
  bool? newChecked,
  int? newLabelId,
});

/// タスク情報の変更を保存する処理フロー
abstract class SaveTaskChangesUseCase {
  /// タスク情報の変更を保存する処理フロー
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  Future<Result<void, Exception>> execute({
    required List<TaskUpdateParameter> taskInfo,
  });
}
