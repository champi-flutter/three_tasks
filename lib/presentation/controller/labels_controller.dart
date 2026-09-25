import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/e_label/e_label.dart';
import 'package:three_tasks/presentation/controller/dto/label_control_parameter/label_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_label/converter/v_to_e_label.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_label/fetch_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_label_changes_use_case.dart';

/// ラベル操作クラス
class LabelsController {
  LabelsController({
    required Token token,
    required FetchLabelUseCase fetchLabelUseCase,
  })  : _token = token,
        _fetchLabelUseCase = fetchLabelUseCase;

  /// このクラスのインスタンス生成時に生成される [Token] 。
  final Token _token;

  /// [FetchLabelUseCase] の呼び出し口
  final FetchLabelUseCase _fetchLabelUseCase;

  /// [SaveLabelChangesUseCase] の呼び出し口
  final SaveLabelChangesUseCase _saveLabelChangesUseCase;

  /// 新しいラベルを登録する
  Future<void> registerNewLabel({
    required String title,
    required VTask firstTask,
  })
  // 折りたたみ用
  async {
    // todo （2026/09/25）＞＞
  }

  /// ラベルの情報の変更を保存する
  Future<void> save({
    required VLabel vLabel,
    required LabelControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // 元のデータをエンティティに当てはめる
    ELabel updatingELabel = VToELabel.toELabel(vLabel);
    // LabelControlParameter を基にエンティティの値を変更する
    updatingELabel.update(
      newTitle: parameter.newTitle,
      newDailyId: parameter.newDailyId,
      newWeeklyId: parameter.newWeeklyId,
      newMonthlyId: parameter.newMonthlyId,
      newYearlyId: parameter.newYearlyId,
    );
    // 更新したエンティティを渡して、 SaveLabelChangesUseCase を起動する
    await _saveLabelChangesUseCase.execute(eLabel: updatingELabel);
  }

  /// ラベルの情報の変更を下書きとして保留する
  Future<void> draft({
    required VLabel vLabel,
    required LabelControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // todo （2026/09/25）＞＞
  }
}
