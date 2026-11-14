import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/presentation/controller/dto/converter/label_input_converter.dart';
import 'package:three_tasks/presentation/controller/dto/label_control_parameter/label_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/presentation/view_state/v_task/converter/v_to_e_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/discard_pending_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/pend_labels_save_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/register_new_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_label_changes_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_pending_label_use_case.dart';
import 'package:three_tasks/use_case/input_data/i_label/i_label.dart';

/// ラベル操作クラス
class LabelsController with NotificationFromViewModel {
  LabelsController({
    required SaveLabelChangesUseCase saveLabelChangesUseCase,
    required RegisterNewLabelUseCase registerNewLabelUseCase,
    required PendLabelsSaveUseCase pendLabelsSaveUseCase,
    required SavePendingLabelUseCase savePendingLabelUseCase,
    required DiscardPendingLabelUseCase discardPendingLabelUseCase,
    required EditController editController,
    required NotificationService notificationService,
  })  : _saveLabelChangesUseCase = saveLabelChangesUseCase,
        _registerNewLabelUseCase = registerNewLabelUseCase,
        _pendLabelsSaveUseCase = pendLabelsSaveUseCase,
        _savePendingLabelUseCase = savePendingLabelUseCase,
        _discardPendingLabelUseCase = discardPendingLabelUseCase,
        _editController = editController,
        notificationService = notificationService;

  /// [SaveLabelChangesUseCase] の呼び出し口
  final SaveLabelChangesUseCase _saveLabelChangesUseCase;

  // /// [DraftLabelChangesUseCase] の呼び出し口
  // final DraftLabelChangesUseCase _draftLabelChangesUseCase;

  /// [RegisterNewLabelUseCase] の呼び出し口
  final RegisterNewLabelUseCase _registerNewLabelUseCase;

  /// ラベル変更保留フロー
  final PendLabelsSaveUseCase _pendLabelsSaveUseCase;

  /// 保留されているラベルの変更の保存を確定するフロー
  final SavePendingLabelUseCase _savePendingLabelUseCase;

  /// 保留されているラベルの変更を破棄するフロー
  final DiscardPendingLabelUseCase _discardPendingLabelUseCase;

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
      // inputData に変換する
      final ILabel inputData = LabelInputConverter.toILabel(
        vLabel: targetVLabel,
        parameter: parameter,
      );
      // 更新したエンティティを渡して、 SaveLabelChangesUseCase を起動する
      await _saveLabelChangesUseCase.execute(labelInputDataList: [inputData]);
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
      // inputData に変換する
      final ILabel inputData = LabelInputConverter.toILabel(
        vLabel: targetVLabel,
        parameter: parameter,
      );
      // 下書きを更新する
      _pendLabelsSaveUseCase.execute(inputData);
      // await _draftLabelChangesUseCase.execute(draft: updatingELabel);
    } catch (e, st) {
      notifyError(content: "[LabelsController._draftAt] $e\n$st");
    }
  }

  /// 下書きを保存する
  Future<void> saveDraft() async {
    // 編集未保存フラグをおろす
    _editController.notifyDiscarded();
    // 保留されているラベルの変更の保存を確定する
    await _savePendingLabelUseCase.execute();
  }

  /// 下書きを破棄する
  Future<void> discardDraft() async {
    // 編集未保存フラグをおろす
    _editController.notifyDiscarded();
    // 保留されているラベルの変更を破棄する
    _discardPendingLabelUseCase.execute();
  }
}
