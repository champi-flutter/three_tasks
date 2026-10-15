

import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';

/// 設定値変更保存フロー
abstract class SaveSettingChangesUseCase {

  Future<void> execute({
    required EPageSetting ePageSetting,
  });
}