
import 'package:three_tasks/use_case/input_boundary/save_label/discard_pending_label_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/label_draft_repository.dart';

class DiscardPendingLabelInteractor implements DiscardPendingLabelUseCase{

  DiscardPendingLabelInteractor({
    required LabelDraftRepository labelDraftRepository,
  }) : _draftRepository = labelDraftRepository;

  final LabelDraftRepository _draftRepository;

  @override
  void execute() {
    _draftRepository.dispose();
  }

}