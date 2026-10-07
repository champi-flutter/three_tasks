
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/view/specific_widgets/pages/page_list.dart';

/// 「自動保存オンオフ」スイッチ
class AutoSaveSwitch extends ConsumerWidget {
  const AutoSaveSwitch({super.key, required this.pageIndex});

  /// 現在表示されているページのインデックス
  final int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // fixme 監視のスコープはこのクラスより外（2026/10/07）＞＞
    // PageSettingsViewModel を監視する
    final state = ref.watch(pageSettingsViewModelProvider(pageList));

    return state.when(
      onReceived: (data){
        // 現在指定されている pageIndex における「自動保存オンオフ」
        final bool willAutoSave = data[pageIndex].autoSave;
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
              onChanged: (bool value) {
                // todo （2026/10/07）＞＞
              },
            ),
          ],
        );
      },
      // todo 読み込み時のスイッチ（2026/10/07）＞＞
      onLoading: , onError: ,
    );
  }
}
