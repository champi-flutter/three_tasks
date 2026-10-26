import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';
import 'package:three_tasks/presentation/controller/dto/setting_control_parameter/setting_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';
import 'package:three_tasks/use_case/input_boundary/save_settings/save_setting_changes_use_case.dart';

/// View から設定値を制御するためのクラス
class SettingsController {

  // todo コンストラクタ
  SettingsController({
    required SaveSettingChangesUseCase saveSettingChangesUseCase,
  })
      : _saveSettingChangesUseCase = saveSettingChangesUseCase;

  /// 設定値変更保存フローの呼び出し口
  final SaveSettingChangesUseCase _saveSettingChangesUseCase;

  /// 指定ページの設定値を制御する
  Future<void> controlPageSettings({
    required VPageSetting targetPageSetting,
    required PageSettingControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // 元のデータ（targetPageSetting）を元にエンティティの枠を用意する
    EPageSetting ePageSetting = EPageSetting(
      pageIndex: targetPageSetting.controlledIndex,
      primaryAutoSaves: targetPageSetting.primaryAutoSaves,
      reviewAutoSaves: targetPageSetting.reviewAutoSaves,
    );
    // parameter に更新情報があった場合は、エンティティを書き換える
    ePageSetting.update(
      primaryAutoSaves: parameter.primaryAutoSaves,
      reviewAutoSaves: parameter.reviewAutoSaves,
    );
    // 設定値変更保存フローを呼び出す
    await _saveSettingChangesUseCase.execute(ePageSetting: ePageSetting);
  }
}