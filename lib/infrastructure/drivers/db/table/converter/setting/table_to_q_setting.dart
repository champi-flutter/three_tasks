
import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/dto/q_setting/q_page_setting.dart';

class TableToQSetting {
  /// [PageSetting] から [QPageSetting] への変更
  static QPageSetting toQPageSetting(PageSetting pageSetting) {
    return QPageSetting(
      pageId: pageSetting.pageId,
      primaryAutoSaves: pageSetting.primaryAutoSaves,
      reviewAutoSaves: pageSetting.reviewAutoSaves,
    );
  }

  /// `List<PageSetting>` から [QSettingsMap] への変更
  static QSettingsMap toQSettingMap(List<PageSetting> pageSettingList) {
    final Map<int, QPageSetting> map = {};
    // pageId を key として map に QPageSetting を組み込んでいく
    for (final pageSetting in pageSettingList) {
      map[pageSetting.pageId] = toQPageSetting(pageSetting);
    }
    return QSettingsMap.fromMapCopy(map);
  }
}