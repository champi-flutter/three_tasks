import 'package:three_tasks/presentation/controller/dto/setting_control_parameter/setting_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';
import 'package:three_tasks/use_case/input_data/i_setting/i_page_setting.dart';

class ToISetting {
  static IPageSetting toIPageSetting({
    required VPageSetting vPageSetting,
    required PageSettingControlParameter parameter,
  }) =>
      IPageSetting(
        pageIndex: vPageSetting.controlledIndex,
        primaryAutoSaves:
            parameter.primaryAutoSaves ?? vPageSetting.primaryAutoSaves,
        reviewAutoSaves:
            parameter.reviewAutoSaves ?? vPageSetting.reviewAutoSaves,
      );
}
