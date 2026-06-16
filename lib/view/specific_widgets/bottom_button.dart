import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 画面下部ボタンの形を統一するクラス
///
/// [backgroundColor] を指定しない場合、色は [Theme] を参照する。
class BottomButton extends StatelessWidget {
  const BottomButton.sync({
    super.key,
    required this.text,
    required this.onPressedSync,
    this.backgroundColor,
  }) : onPressedAsync = null, _processType = ProcessType.sync;

  const BottomButton.async({
    super.key,
    required this.text,
    required this.onPressedAsync,
    this.backgroundColor,
  }) : onPressedSync = null, _processType = ProcessType.async;

  /// ボタンの文字
  final String text;

  /// ボタンタップ時の処理。
  ///
  /// 同じスレッドで処理を進める場合は、ここに設定し、[onPressedAsync] を `null` にする。
  final VoidCallback? onPressedSync;

  /// ボタンタップ時の処理。
  ///
  /// 非同期で処理を進める場合は、ここに設定し、[onPressedSync] を `null` にする。
  final Future<void> Function()? onPressedAsync;

  final Color? backgroundColor;

  /// ボタンタップ時の処理を同じスレッドで行うか、非同期で行うか
  final ProcessType _processType;

  @override
  Widget build(BuildContext context) {
    switch(_processType){
      case ProcessType.sync:
        return FlatRaisedButton.sync(
          text: text,
          fontSize: 25,
          onPressedSync: onPressedSync,
          height: 90.h,
          width: double.infinity,
          backgroundColor: backgroundColor,
          isValid: true,
        );
      case ProcessType.async:
        return FlatRaisedButton.async(
          text: text,
          fontSize: 25,
          onPressedAsync: onPressedAsync,
          height: 90.h,
          width: double.infinity,
          backgroundColor: backgroundColor,
          isValid: true,
        );
    }
  }
}