
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_tasks/di/presentation_providers/controller_providers.dart';
import 'package:three_tasks/presentation/controller/dto/setting_control_parameter/setting_control_parameter.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';

/// 「自動保存オンオフ」スイッチ
class AutoSaveSwitch extends ConsumerWidget {
  const AutoSaveSwitch({
    super.key,
    required this.pageIndex,
    required this.onSwitched,
  });

  /// 現在表示されているページのインデックス
  final int pageIndex;

  /// 対象ページの自動保存オンオフを変更した際に呼ばれるコールバック
  final Future<void> Function(bool) onSwitched;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PageSettingsViewModel を監視する
    final state = ref.watch(pageSettingsViewModelProvider);

    return state.when(
      onReceived: (data){
        final VPageSetting targetPageSetting = data[pageIndex];
        // 現在指定されている pageIndex における「自動保存オンオフ」
        final bool willAutoSave = targetPageSetting.autoSave;
        return  Row(
          children: [
            const UtilizedText(
              "自動保存",
              fontSize: 18,
            ),
            SizedBox(width: 4.w),
            // オンオフスイッチ本体
            OnOffSwitch.onWhite(
              state: willAutoSave,
              onChanged: (bool value) async {
                // todo （2026/10/12）＞＞
                // 設定値を変更する
                await ref.read(settingsControllerProvider).controlPageSettings(
                  targetPageSetting: targetPageSetting,
                  parameter: PageSettingControlParameter(
                    autoSave: value,
                  ),
                );
                await onSwitched(value);
              },
            ),
          ],
        );
      },
      // todo 読み込み時のスイッチ（2026/10/07）＞＞
      onLoading: ,
      onError: ,
    );
  }
}
