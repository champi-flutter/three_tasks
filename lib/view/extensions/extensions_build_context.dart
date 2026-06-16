// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
//
// /// 2026/04/18 追加: [BuildContext] の汎用的な拡張プロパティを内包
// extension GenericExtensions on BuildContext {
//   /// デバイスのスクリーンサイズ
//   Size get screenSize => MediaQuery.sizeOf(this);
//
//   /// デバイスのスクリーンの横幅
//   double get screenWidth => screenSize.width;
//
//   /// デバイスのスクリーンの縦幅
//   double get screenHeight => screenSize.height;
//
//   /// デバイスの端のタップ不可部分
//   EdgeInsets get obscuredArea => MediaQuery.paddingOf(this);
// }
//
// /// todo printメソッド [extensions_build_context.dart]
// void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
//   if (kDebugMode) {
//     print("");
//     print("[extensions_build_context.dart]　" + s1);
//     if (s2 != null) print("[extensions_build_context.dart]　" + s2);
//     if (s3 != null) print("[extensions_build_context.dart]　" + s3);
//     if (s4 != null) print("[extensions_build_context.dart]　" + s4);
//     if (s5 != null) print("[extensions_build_context.dart]　" + s5);
//     print("");
//   }
// }