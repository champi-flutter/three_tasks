
import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';

/// 各種設定値を Presentation 層に反映させるクラス
abstract class SettingsPresenter {

  Future<void> presentWith(EPageSetting newPageSetting);

  Future<void> presentAll(ESettingsMap newData);
}