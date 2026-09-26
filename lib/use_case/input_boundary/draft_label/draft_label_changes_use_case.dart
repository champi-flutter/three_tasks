
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';

/// タスク情報の変更を下書きとして保有する処理フロー
abstract class DraftLabelChangesUseCase {
  /// ラベル情報変更下書きフロー
  Future<Result<void, Exception>> execute({
    required ELabel  draft,
  });
}
