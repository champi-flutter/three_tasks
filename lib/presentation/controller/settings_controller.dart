import 'package:three_tasks/presentation/controller/dto/converter/setting_input_converter.dart';
import 'package:three_tasks/presentation/controller/dto/setting_control_parameter/setting_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_settings/fetch_settings_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_settings/save_setting_changes_use_case.dart';
import 'package:three_tasks/use_case/input_data/i_setting/i_page_setting.dart';

/// View から設定値を制御するためのクラス
class SettingsController {
  // todo コンストラクタ
  SettingsController({
    required FetchSettingsUseCase fetchSettingsUseCase,
    required SaveSettingChangesUseCase saveSettingChangesUseCase,
  })  : _fetchSettingsUseCase = fetchSettingsUseCase,
        _saveSettingChangesUseCase = saveSettingChangesUseCase;

  /// 設定値フェッチフローの呼び出し口
  final FetchSettingsUseCase _fetchSettingsUseCase;

  /// 設定値変更保存フローの呼び出し口
  final SaveSettingChangesUseCase _saveSettingChangesUseCase;

  Future<void> initState() async {}

  /// 指定ページの設定値を制御する
  Future<void> controlPageSettings({
    required VPageSetting targetPageSetting,
    required PageSettingControlParameter parameter,
  })
  // 折りたたみ用
  async {
    // InputData に変換する
    final IPageSetting iPageSetting = SettingInputConverter.toIPageSetting(
      vPageSetting: targetPageSetting,
      parameter: parameter,
    );
    // 設定値変更保存フローを呼び出す
    await _saveSettingChangesUseCase.execute(iPageSetting: iPageSetting);
  }
}
