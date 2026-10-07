
import 'package:three_tasks/entities/e_setting/e_page_setting.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';
import 'package:three_tasks/use_case/output_boundary/settings_presenter.dart';

/// 各種設定値を Presentation 層に反映させるクラスの中身を実装
class SettingsPresenterImpl implements SettingsPresenter{

  SettingsPresenterImpl({required PageSettingsViewModel pageSettingsViewModelNotifier,
  }): _viewModel = pageSettingsViewModelNotifier;

  final PageSettingsViewModel _viewModel;

  @override
  Future<void> present(ESettingsMap newData) async {
    // VM に渡すデータの枠を生成する
    final VSettingsMap vData = VSettingsMap.initFromPageList(
      pageList: _viewModel.pageList,
    );
    // newData と vData の length が一致しない場合は実装エラー
    if(newData.length != vData.length){
      throw RangeError(
        "[SettingsPresenter.present] 無効なデータです。\nnewData.length != vData.length",
      );
    }
    // 受け取ったデータを探索し、VM に渡す形に整えていく
    for(final eEntry in newData.entries){
      final int pageIndex = eEntry.key;
      final EPageSetting ePageSetting = eEntry.value;
      vData[pageIndex] = VPageSetting(
        controlledIndex: pageIndex,
        autoSave: ePageSetting.autoSave,
      );
    }
    _viewModel.update(vData);
  }
}