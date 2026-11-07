

import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';

/// 設定 VM の [state] 更新インターフェース
abstract class PageSettingsStateNotifier{

  /// 設定 VM の [state] の一部を更新する
  void updateWith(VPageSetting newSetting);

  /// 設定 VM の [state] を Map で更新する
  void updateAll(VSettingsMap newMapState);
}