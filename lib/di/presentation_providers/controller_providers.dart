import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
import 'package:three_tasks/presentation/controller/labels_controller.dart';

part 'controller_providers.g.dart';

/// ラベルのコントローラ
///
/// 第2引数の [token] は、 [EditController] の Token 。
@riverpod
LabelsController labelsController(Ref ref, Token token) => LabelsController(
      saveLabelChangesUseCase: ref.watch(saveLabelChangesUseCaseProvider),
      editController: ref.watch(editControllerProvider(token)),
      draftLabelChangesUseCase: ref.watch(draftLabelChangesUseCaseProvider),
      notificationService: ref.watch(notificationServiceProvider),
    );
