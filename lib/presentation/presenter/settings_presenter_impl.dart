
import 'package:three_tasks/domain/application_config.dart';
import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';
import 'package:three_tasks/presentation/notifier/setting_state_notifier/page_setting_state_notifier.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';
import 'package:three_tasks/use_case/output_boundary/settings_presenter.dart';

/// 各種設定値を Presentation 層に反映させるクラスの中身を実装
class SettingsPresenterImpl implements SettingsPresenter{

  SettingsPresenterImpl({required PageSettingsStateNotifier pageSettingsStateNotifier,
  }): _state = pageSettingsStateNotifier;

  /// 設定 ViewState 更新呼び出し口
  final PageSettingsStateNotifier _state;

  @override
  Future<void> presentWith(EPageSetting newPageSetting)async{
    // Presentation 用の値に変換する
    final VPageSetting vPageSetting = VPageSetting(
      controlledIndex: newPageSetting.pageIndex,
      primaryAutoSaves: newPageSetting.primaryAutoSaves,
      reviewAutoSaves: newPageSetting.reviewAutoSaves,
    );
    // VM に反映する
    _state.updateWith(vPageSetting);
  }

  @override
  Future<void> presentAll(ESettingsMap newData) async {
    // VM に渡すデータの枠を生成する
    final VSettingsMap vData = VSettingsMap.initFromPageList(
      numberOfPages: pageConfig.numberOfPages,
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
        primaryAutoSaves: ePageSetting.primaryAutoSaves,
        reviewAutoSaves: ePageSetting.reviewAutoSaves,
      );
    }
    _state.updateAll(vData);
  }
}