import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/domain/entity/e_label/e_label.dart';
import 'package:three_tasks/presentation/controller/dto/label_control_parameter/label_control_parameter.dart';
import 'package:three_tasks/presentation/view_model/labels_draft/labels_draft_handler.dart';
import 'package:three_tasks/presentation/view_state/v_label/converter/v_to_e_label.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/v_to_e_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/register_new_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_label_changes_use_case.dart';

/// ラベル操作クラス
class LabelsController with NotificationFromViewModel {
  LabelsController({
    required SaveLabelChangesUseCase saveLabelChangesUseCase,
    required RegisterNewLabelUseCase registerNewLabelUseCase,
    required LabelsDraftHandler labelsDraftHandler,
    required EditController editController,
    required NotificationService notificationService,
  })  : _saveLabelChangesUseCase = saveLabelChangesUseCase,
        _registerNewLabelUseCase = registerNewLabelUseCase,
        _draftHandler = labelsDraftHandler,
        _editController = editController,
        notificationService = notificationService;

  /// [SaveLabelChangesUseCase] の呼び出し口
  final SaveLabelChangesUseCase _saveLabelChangesUseCase;

  // /// [DraftLabelChangesUseCase] の呼び出し口
  // final DraftLabelChangesUseCase _draftLabelChangesUseCase;

  /// [RegisterNewLabelUseCase] の呼び出し口
  final RegisterNewLabelUseCase _registerNewLabelUseCase;

  /// ラベルの変更の下書きへのアクセス
  final LabelsDraftHandler _draftHandler;

  /// 編集状態変更の呼び出し口
  final EditController _editController;

  @override
  final NotificationService notificationService;

  /// ラベル操作時のコールバック
  Future<void> controlLabel({
    required bool willAutoSave,
    required ListEntry<VLabel> vLabelEntry,
    required LabelControlParameter parameter,
  })
      // 折りたたみ用
      =>
      willAutoSave
          ? _saveAt(vLabelEntry: vLabelEntry, parameter: parameter)
          : _draftAt(vLabelEntry: vLabelEntry, parameter: parameter);

  /// 新しいラベルを登録する
  Future<void> registerNewLabel({
    required String title,
    required VTask firstTask,
  })
  // 折りたたみ用
  async {
    await _registerNewLabelUseCase.execute(
      title: title,
      firstETask: VToETask.toETask(firstTask),
    );
  }

  /// ラベルの情報の変更を保存する
  Future<void> _saveAt({
    required ListEntry<VLabel> vLabelEntry,
    required LabelControlParameter parameter,
  })
  // 折りたたみ用
  async {
    try {
      // 編集未保存フラグをおろす
      _editController.notifySaved();
      final VLabel targetVLabel = vLabelEntry.value;
      // 元のデータをエンティティに当てはめる
      ELabel updatingELabel = VToELabel.toELabel(targetVLabel);
      // LabelControlParameter を基にエンティティの値を変更する
      updatingELabel.update(
        newTitle: parameter.newTitle,
        newDailyId: parameter.newDailyId,
        newWeeklyId: parameter.newWeeklyId,
        newMonthlyId: parameter.newMonthlyId,
        newYearlyId: parameter.newYearlyId,
      );
      // 更新したエンティティを渡して、 SaveLabelChangesUseCase を起動する
      await _saveLabelChangesUseCase.execute(updatedELabels: [updatingELabel]);
    } catch (e, st) {
      notifyError(content: "[LabelsController._saveAt] $e\n$st");
    }
  }

  /// ラベルの情報の変更を下書きとして保留する
  Future<void> _draftAt({
    required ListEntry<VLabel> vLabelEntry,
    required LabelControlParameter parameter,
  })
  // 折りたたみ用
  async {
    try {
      // 編集未保存フラグを立てる
      _editController.notifyEdited();
      final VLabel targetVLabel = vLabelEntry.value;
      // 元のデータをエンティティに当てはめる
      ELabel updatingELabel = VToELabel.toELabel(targetVLabel);
      // LabelControlParameter を基にエンティティの値を変更する
      updatingELabel.update(
        newTitle: parameter.newTitle,
        newDailyId: parameter.newDailyId,
        newWeeklyId: parameter.newWeeklyId,
        newMonthlyId: parameter.newMonthlyId,
        newYearlyId: parameter.newYearlyId,
      );
      // 下書きを更新する
      _draftHandler.draftWith(updatingELabel);
      // await _draftLabelChangesUseCase.execute(draft: updatingELabel);
    } catch (e, st) {
      notifyError(content: "[LabelsController._draftAt] $e\n$st");
    }
  }

  /// 下書きを保存する
  Future<void> saveDraft() async {
    // 編集未保存フラグをおろす
    _editController.notifyDiscarded();
    // 下書きを取得する
    final List<ELabel> currentDraft = _draftHandler.getDraft();
    // ハンドラが保有していた下書きを破棄する
    _draftHandler.dispose();
    // 取得した下書きで、 SaveLabelChangesUseCase を起動する
    await _saveLabelChangesUseCase.execute(updatedELabels: currentDraft);
  }

  /// 下書きを破棄する
  Future<void> discardDraft() async {
    // 編集未保存フラグをおろす
    _editController.notifyDiscarded();
    _draftHandler.dispose();
  }
}
