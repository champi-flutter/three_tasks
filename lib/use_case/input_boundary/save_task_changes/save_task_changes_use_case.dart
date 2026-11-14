import 'dart:collection';

import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/task_base/task_list.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';
import 'package:three_tasks/use_case/input_data/task_input_data/task_input_data.dart';

/// タスク情報の変更を保存する処理フロー
abstract class SaveTaskChangesUseCase {
  /// タスク情報の変更を保存する処理フロー
  ///   1. パラメータの [VTask] を [DTask] に変換する
  ///   2. リポジトリにテータの保存を依頼する
  ///   3. キャッシュハンドラの `update` を実行する
  ///
  /// [newTitle]、[newChecked]、[newLabelId] のいずれかと、
  /// 変更を受けるタスク（[targetVTask]）を指定する。
  Future<void> execute({
    required TaskInputData taskListInputData,
  });
}
