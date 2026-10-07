import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// 各ページの設定のクエリ用 DTO
class QPageSetting {
  /// このページの識別子
  final int pageId;

  /// 自動保存オンオフ
  final bool autoSave;

  const QPageSetting({
    required this.pageId,
    required this.autoSave,
  });
}

/// 各ページにおける設定のハッシュマップ
///
/// [PageListType] におけるこのページのインデックスを key として、
/// [QPageSetting] を参照する。
class QSettingsMap extends MapBase<int, QPageSetting> {
  /// 直接参照していい [Map] から作るコンストラクタ
  QSettingsMap.fromMapCopy(
      Map<int, QPageSetting> map,
      ) : _source = map;

  /// 生の（直接参照してはいけない） [Map] から作るコンストラクタ
  QSettingsMap.fromRawMap(
      Map<int, QPageSetting> rawMap,
      ) : _source = Map.of(rawMap);

  final Map<int, QPageSetting> _source;

  @override
  QPageSetting operator [](Object? key) {
    final QPageSetting? value = _source[key];
    if (value == null) {
      throw UnsupportedError("[QSettingsMap] 無効な key です。");
    } else {
      return value;
    }
  }

  @override
  void operator []=(int key, QPageSetting value) {
    if (key >= _source.length) {
      throw UnsupportedError("[QSettingsMap] 無効な key です。");
    }
    _source[key] = value;
  }

  /// [other] と比べて変わったか
  bool hasChanges(QSettingsMap other) {
    return !MapEquality().equals(_source, other._source);
  }

  @override
  void clear() {
    for (int index = 0; index < _source.length; index++) {
      _source[index] = QPageSetting(pageId: index, autoSave: true);
    }
  }

  @override
  Iterable<int> get keys => _source.keys;

  @override
  @protected
  QPageSetting? remove(Object? key) {
    throw UnsupportedError("[QSettingsMap] remove は無効です。");
  }
}
