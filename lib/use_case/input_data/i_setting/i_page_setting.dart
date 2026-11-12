
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// 各ページにおける設定
class IPageSetting {
  /// このページのインデックス
  final int pageIndex;

  /// 対象ページの自動保存オンオフ
  final bool primaryAutoSaves;

  /// 対象ページに対応するレビュー画面の自動保存オンオフ
  final bool reviewAutoSaves;

  const IPageSetting({
    required this.pageIndex,
    required this.primaryAutoSaves,
    required this.reviewAutoSaves,
  });
}

/// 各ページにおける設定のハッシュマップ
///
/// ページのインデックスを key として、 [IPageSetting] を参照する。
class ISettingsMap extends MapBase<int, IPageSetting> {

  final Map<int, IPageSetting> _source;

  /// 直接参照していい [Map] から作るコンストラクタ
  ISettingsMap.fromMapCopy(
      Map<int, IPageSetting> map,
      ) : _source = map;

  /// 生の（直接参照してはいけない） [Map] から作るコンストラクタ
  ISettingsMap.fromRawMap(
      Map<int, IPageSetting> rawMap,
      ) : _source = Map.of(rawMap);

  @override
  IPageSetting operator [](Object? key) {
    final IPageSetting? value = _source[key];
    if (value == null) {
      throw UnsupportedError("[ISettingsMap] 無効な key です。");
    } else {
      return value;
    }
  }

  @override
  void operator []=(int key, IPageSetting value) {
    if (key >= _source.length) {
      throw UnsupportedError("[ISettingsMap] 無効な key です。");
    }
    _source[key] = value;
  }

  /// [other] と比べて変わったか
  bool hasChanges(ISettingsMap other) {
    return !MapEquality().equals(_source, other._source);
  }

  @override
  void clear() {
    for (int index = 0; index < _source.length; index++) {
      _source[index] = IPageSetting(
        pageIndex: index,
        primaryAutoSaves: true,
        reviewAutoSaves: false,
      );;
    }
  }

  @override
  Iterable<int> get keys => _source.keys;

  @override
  @protected
  IPageSetting? remove(Object? key) {
    throw UnsupportedError("[ISettingsMap] remove は無効です。");
  }
}