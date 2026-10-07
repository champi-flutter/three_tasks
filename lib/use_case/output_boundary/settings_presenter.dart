
import 'package:three_tasks/entities/e_setting/e_page_setting.dart';

/// 各種設定値を Presentation 層に反映させるクラス
abstract class SettingsPresenter {

  Future<void> present(ESettingsMap newData);
}