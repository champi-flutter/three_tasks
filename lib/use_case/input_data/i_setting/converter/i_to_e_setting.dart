import 'package:three_tasks/domain/entity/e_setting/e_page_setting.dart';
import 'package:three_tasks/use_case/input_data/i_setting/i_page_setting.dart';

class IToESetting {
  static EPageSetting toEPageSetting(IPageSetting iPageSetting) => EPageSetting(
        pageIndex: iPageSetting.pageIndex,
        primaryAutoSaves: iPageSetting.primaryAutoSaves,
        reviewAutoSaves: iPageSetting.reviewAutoSaves,
      );
}
