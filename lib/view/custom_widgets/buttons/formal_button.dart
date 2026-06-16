// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// /// Windowsのアプリケーションエラーダイアログの「OK」ボタンのような、
// /// フォーマルで堅実な高重要度ボタン。
// ///
// /// 長押しは非対応。
// class FormalButton extends HookWidget {
//   /// ボタンのテキスト。
//   final String text;
//
//   /// ボタンの文字スタイル。デフォルトのフォントサイズは `14.sp` 相当（システムフォント風）。
//   final TextStyle textStyle;
//
//   /// ボタンが有効かどうか。
//   final bool isValid;
//
//   /// ボタンが押されたときの処理。
//   final Future<void> Function() onPressed;
//
//   /// ボタンの横幅。デフォルトは `100.w` 相当。
//   final double _buttonWidth;
//
//   /// ボタンの縦幅。デフォルトは `32.h` 相当（Windowsダイアログの標準的な高さに合わせる）。
//   final double _buttonHeight;
//
//   /// ボタンの角の丸み。デフォルトは極めてわずかな丸み（`BorderRadius.circular(2)`）。
//   final BorderRadius _borderRadius;
//
//   /// ボタンの影の高さ。Windowsのクラシック/モダンダイアログ仕様に合わせ、立体感は控えめ、またはフラットにします。
//   final double elevation;
//
//   /// ボタンが有効な時の背景色。デフォルトはWindowsの標準ボタン風のシックな色合い。
//   final Color backgroundColor;
//
//   /// ボタンが無効な時の背景色。
//   final Color invalidColor;
//
//   /// ボタンが有効な時の枠線の色。
//   final Color? borderColor;
//
//   /// ボタンが無効な時の枠線の色。
//   final Color? invalidBorderColor;
//
//   /// 枠線の太さと色の設定。
//   final BorderSide borderSide;
//
//   /// 左右の余白。
//   final double sidePadding;
//
//   FormalButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.isValid = true,
//     double? fontSize,
//     FontWeight? fontWeight,
//     String? fontFamily,
//     double? buttonWidth,
//     double? buttonHeight,
//     BorderRadius? borderRadius,
//     this.elevation = 0.5, // 控えめな立体感
//     this.backgroundColor = const Color(0xFFE1E1E1),
//     this.invalidColor = const Color(0xFFF0F0F0),
//     this.borderColor = Colors.black38,
//     this.invalidBorderColor = const Color(0xFFD3D3D3),
//     Color textColor = const Color(0xFF000000),
//     Color invalidTextColor = const Color(0xFF838383),
//     this.sidePadding = 16.0,
//   }) :
//         _buttonWidth = buttonWidth ?? 100.w,
//         _buttonHeight = buttonHeight ?? 32.h,
//         _borderRadius = borderRadius ?? BorderRadius.circular(2),
//         textStyle = TextStyle(
//         fontSize: fontSize ?? 12.5.sp,
//         fontWeight: fontWeight ?? FontWeight.normal,
//         color: isValid ? textColor : invalidTextColor,
//         fontFamily: fontFamily,
//       ),
//         borderSide = BorderSide(
//           color: isValid
//               ? (borderColor ?? Colors.black87)
//               : (invalidBorderColor ?? const Color(0xFFD3D3D3)),
//           width: 1.0, // アクティブ時は枠線を強調してフォーカスを示す
//         );
//
//   @override
//   Widget build(BuildContext context) {
//     // 押下状態を管理
//     final _isPressed = useState<bool>(false);
//
//     final _isOnProcess = useState<bool>(false);
//
//     final isPressDown = _isPressed.value || _isOnProcess.value;
//
//     // 形の設定（シャープな角と明瞭なボーダー）
//     final BoxDecoration decoration = BoxDecoration(
//       borderRadius: _borderRadius,
//       border: Border.fromBorderSide(borderSide),
//       color: isValid ? backgroundColor : invalidColor,
//       // ボタンの浮き具合
//       boxShadow: [
//         isPressDown
//             ? const BoxShadow(
//           color: Colors.black26,
//           spreadRadius: 0,
//           // 地面に近づくため、ぼかしをシャープにする
//           blurRadius: 0.1,
//           offset: Offset(0.1, 0.1),
//         )
//             : const BoxShadow(
//           // color: Colors.brown.shade200,
//           color: Colors.black,
//           spreadRadius: 0,
//           blurRadius: 0.5,
//           offset: Offset(1, 1),
//         ),
//       ],
//     );
//
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 50),
//       transform: isPressDown && isValid
//           ? Matrix4.translationValues(0.8, 0.8, 0)
//           : Matrix4.translationValues(0, 0, 0),
//       constraints: BoxConstraints(
//         minWidth: _buttonWidth,
//         minHeight: _buttonHeight,
//       ),
//       decoration: decoration,
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: _borderRadius,
//           // ホバー・押下時のフィードバックをWindowsっぽく少しだけ暗くする
//           hoverColor: Colors.black.withValues(alpha: 0.03),
//           highlightColor: Colors.black.withValues(alpha: 0.08),
//           // スプラッシュエフェクトはなし
//           splashColor: Colors.transparent,
//           onTap: isValid ? () async {
//             // タップによる処理中は、ボタンは沈みっぱなし
//             _isOnProcess.value = true;
//             await onPressed();
//             _isOnProcess.value = false;
//           } : null,
//           // 以下3つは、押下アクション
//           onTapDown: isValid ? (_) {
//             _print("onTapDown");
//             _isPressed.value = true;
//           } : null,
//           onTapUp: isValid ? (_) async {
//             _print("onTapUp");
//             // 3秒間処理をストップ
//             await Future.delayed(const Duration(milliseconds: 50));
//             _isPressed.value = false;
//           } : null,
//           onTapCancel: isValid ? () {
//             _print("onTapCancel");
//             _isPressed.value = false;
//           } : null,
//           onLongPress: (){},
//           child: SizedBox(
//             width: _buttonWidth,
//             height: _buttonHeight,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: sidePadding),
//               child: Center(
//                 child: FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(text, style: textStyle),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// todo printメソッド [formal_button.dart]
// void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
//   if (kDebugMode) {
//     print("");
//     print("[formal_button.dart]　" + s1);
//     if (s2 != null) print("[formal_button.dart]　" + s2);
//     if (s3 != null) print("[formal_button.dart]　" + s3);
//     if (s4 != null) print("[formal_button.dart]　" + s4);
//     if (s5 != null) print("[formal_button.dart]　" + s5);
//     print("");
//   }
// }