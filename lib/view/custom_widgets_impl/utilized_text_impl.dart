import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// [ScreenUtil] と [FittedBox] を用いた [Text] クラス
class UtilizedText extends CustomTextUtilizer {
  const UtilizedText(
      super.data, {
        super.key,
        super.fontSize = 21,
        super.fit = BoxFit.scaleDown,
        super.color,
        super.fontWeight,
        super.alignment = Alignment.centerLeft,
      });

  /// Google Pixel 8 の横幅（dp）
  @override
  double get designSide => 412;
}