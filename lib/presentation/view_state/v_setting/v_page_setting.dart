import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';

/// 各ページにおける設定
class VPageSetting {
  /// このページのインデックス
  final int controlledIndex;

  /// 自動保存オンオフ
  final bool autoSave;

  const VPageSetting({
    required this.controlledIndex,
    required this.autoSave,
  });

  /// 仮データ
  const VPageSetting.placeholder(this.controlledIndex) : autoSave = true;
}

/// 各ページにおける設定のハッシュマップ
///
/// ページのインデックスを key として、 [VPageSetting] を参照する。
class VSettingsMap
    extends MapBase<int, VPageSetting> {
  /// 設定の対象となるページの総数を引数にとり（[numberOfPages]）、空の枠
  /// （[VPageSetting.placeholder]）を確保するコンストラクタ
  VSettingsMap.initFromPageList({
    required int numberOfPages,
  }) : _source = {
          for (int index= 0; index < numberOfPages; index++) index: VPageSetting.placeholder(index),
        };

  final Map<int, VPageSetting> _source;

  @override
  VPageSetting operator [](Object? key) {
    final VPageSetting? value = _source[key];
    if (value == null) {
      throw UnsupportedError("[VSettingsMap] 無効な key です。");
    } else {
      return value;
    }
  }

  @override
  void operator []=(int key, VPageSetting value) {
    if (key >= _source.length) {
      throw UnsupportedError("[VSettingsMap] 無効な key です。");
    }
    _source[key] = value;
  }

  /// [other] と比べて変わったか
  bool hasChanges(VSettingsMap other) {
    return !MapEquality().equals(_source, other._source);
  }

  @override
  void clear() {
    for (int index = 0; index < _source.length; index++) {
      _source[index] = VPageSetting.placeholder(index);
    }
  }

  @override
  Iterable<int> get keys => _source.keys;

  @override
  @protected
  VPageSetting? remove(Object? key) {
    throw UnsupportedError("[VSettingsMap] remove は無効です。");
  }
}
