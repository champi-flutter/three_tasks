import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
import 'package:three_tasks/presentation/controller/labels_controller.dart';
import 'package:three_tasks/presentation/controller/settings_controller.dart';
import 'package:three_tasks/presentation/controller/tasks_controller.dart';
import 'package:three_tasks/presentation/view_model/labels_draft/labels_draft_handler.dart';

part 'controller_providers.g.dart';


/// 週単位タスク操作クラス
///
/// 第2引数の [token] は、 [EditController] の Token 。
@riverpod
TasksController tasksController(Ref ref, Token token) => TasksController(
  saveTaskChangesUseCase: ref.watch(saveTaskChangesUseCaseProvider),
  draftTaskChangesUseCase: ref.watch(draftTaskChangesUseCaseProvider),
  discardDraftUseCase: ref.watch(discardDraftUseCaseProvider),
  saveWeeklyTaskChangesUseCase:
  ref.watch(saveWeeklyTaskChangesUseCaseProvider),
  editController: ref.watch(editControllerProvider(token)),
);

/// ラベルのコントローラ
///
/// 第2引数の [token] は、 [EditController] の Token 。
@riverpod
LabelsController labelsController(Ref ref, Token token) => LabelsController(
      saveLabelChangesUseCase: ref.watch(saveLabelChangesUseCaseProvider),
      editController: ref.watch(editControllerProvider(token)),
      notificationService: ref.watch(notificationServiceProvider),
  registerNewLabelUseCase: ref.watch(registerNewLabelUseCaseProvider),
  labelsDraftHandler: ref.watch(labelsDraftHandlerProvider),
    );

// 設定値のコントローラ
@riverpod
SettingsController settingsController(Ref ref) => SettingsController(
      saveSettingChangesUseCase: ref.watch(saveSettingChangesUseCaseProvider),
    );

// ラベル変更の下書きのハンドラ
@riverpod
LabelsDraftHandler labelsDraftHandler(Ref ref) => LabelsDraftHandler();
