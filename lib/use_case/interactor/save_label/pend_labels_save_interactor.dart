import 'package:three_tasks/domain/entity/e_label/e_label.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/pend_labels_save_use_case.dart';
import 'package:three_tasks/use_case/input_data/i_label/i_label.dart';
import 'package:three_tasks/use_case/repository_interface/label_draft_repository.dart';

class PendLabelsSaveInteractor implements PendLabelsSaveUseCase {
  PendLabelsSaveInteractor({
    required LabelDraftRepository labelDraftRepository,
  }) : _draftRepository = labelDraftRepository;

  final LabelDraftRepository _draftRepository;

  @override
  Future<void> execute(ILabel iLabel) async {
    // InputData をエンティティに変換する
    final ELabel eLabel = ELabel(
      labelId: iLabel.labelId,
      title: iLabel.title,
      dailyIdList: [...iLabel.dailyIdList],
      weeklyIdList: [...iLabel.weeklyIdList],
      monthlyIdList: [...iLabel.monthlyIdList],
      yearlyIdList: [...iLabel.yearlyIdList],
    );
    // ラベル下書き保管所に保管する
    await _draftRepository.draftWith(eLabel);
  }
}
