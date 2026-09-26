import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
import 'package:three_tasks/presentation/controller/labels_controller.dart';

part 'controller_providers.g.dart';

/// ラベルのコントローラ
@riverpod
LabelsController labelsController(Ref ref) => LabelsController(
      saveLabelChangesUseCase: ref.watch(saveLabelChangesUseCaseProvider),
      editController: ref.watch(editControllerProvider),
      draftLabelChangesUseCase: ref.watch(draftLabelChangesUseCaseProvider),
      notificationService: ref.watch(notificationServiceProvider),
    );
