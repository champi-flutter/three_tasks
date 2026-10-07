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

// todo エンティティを作る（2026/10/05）＞＞

/// 各ページにおける設定のハッシュマップ
///
/// [PageListType] におけるこのページのインデックスを key として、
/// [VPageSetting] を参照する。
class VSettingsMap<PageListType extends FixedList>
    extends MapBase<int, VPageSetting> {
  VSettingsMap.initFromPageList({
    required PageListType pageList,
  }) : _source = {
          for (final p in pageList) p.index: VPageSetting.placeholder(p.index),
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
