import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// 各ページの設定のエンティティ
class EPageSetting {
  /// このページのインデックス
  final int pageIndex;

  /// 対象ページの自動保存オンオフ
  bool _primaryAutoSaves;

  /// 対象ページの自動保存オンオフ
  bool get primaryAutoSaves => _primaryAutoSaves;

  /// 対象ページに対応するレビュー画面の自動保存オンオフ
  bool _reviewAutoSaves;

  /// 対象ページに対応するレビュー画面の自動保存オンオフ
  bool get reviewAutoSaves => _reviewAutoSaves;

  EPageSetting({
    required this.pageIndex,
    required bool primaryAutoSaves,
    required bool reviewAutoSaves,
  })  : _primaryAutoSaves = primaryAutoSaves,
        _reviewAutoSaves = reviewAutoSaves;

  /// パラメータを更新する
  void update({
    bool? primaryAutoSaves,
    bool? reviewAutoSaves,
  })
  // 折りたたみ用
  {
    if (primaryAutoSaves != null) {
      _primaryAutoSaves = primaryAutoSaves;
    }
    if (reviewAutoSaves != null) {
      _reviewAutoSaves = reviewAutoSaves;
    }
  }
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
      _source[index] = EPageSetting(
        pageIndex: index,
        primaryAutoSaves: true,
        reviewAutoSaves: false,
      );
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
