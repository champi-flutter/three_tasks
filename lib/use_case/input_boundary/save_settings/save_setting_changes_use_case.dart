

import 'package:three_tasks/use_case/input_data/i_setting/i_page_setting.dart';

/// 設定値変更保存フロー
abstract class SaveSettingChangesUseCase {

  Future<void> execute({
    required IPageSetting iPageSetting,
  });
}