
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// 各ページの設定のエンティティ
class EPageSetting {
  /// このページのインデックス
  final int pageIndex;

  /// 自動保存オンオフ
  bool autoSave;

  EPageSetting({
    required this.pageIndex,
    required this.autoSave,
  });
}

/// 各ページにおける設定のハッシュマップ
///
/// 対象ページのインデックスを key として、[EPageSetting] を参照する。
class ESettingsMap extends MapBase<int, EPageSetting> {
  /// 直接参照していい [Map] から作るコンストラクタ
  ESettingsMap.fromMapCopy(
      Map<int, EPageSetting> map,
      ) : _source = map;

  /// 生の（直接参照してはいけない） [Map] から作るコンストラクタ
  ESettingsMap.fromRawMap(
      Map<int, EPageSetting> rawMap,
      ) : _source = Map.of(rawMap);

  final Map<int, EPageSetting> _source;

  @override
  EPageSetting operator [](Object? key) {
    final EPageSetting? value = _source[key];
    if (value == null) {
      throw UnsupportedError("[ESettingsMap] 無効な key です。");
    } else {
      return value;
    }
  }

  @override
  void operator []=(int key, EPageSetting value) {
    if (key >= _source.length) {
      throw UnsupportedError("[ESettingsMap] 無効な key です。");
    }
    _source[key] = value;
  }

  /// [other] と比べて変わったか
  bool hasChanges(ESettingsMap other) {
    return !MapEquality().equals(_source, other._source);
  }

  @override
  void clear() {
    for (int index = 0; index < _source.length; index++) {
      _source[index] = EPageSetting(pageIndex: index, autoSave: true);
    }
  }

  @override
  Iterable<int> get keys => _source.keys;

  @override
  @protected
  EPageSetting? remove(Object? key) {
    throw UnsupportedError("[ESettingsMap] remove は無効です。");
  }
}