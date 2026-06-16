// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// /// [ScreenUtil] を用いた [Text] を `const` で呼び出すためのクラス。
// /// [runApp] で作るクラスを [ScreenUtilInit] でラップする必要がある。
// class UtilizedText extends StatelessWidget {
//
//   /// 文字本体
//   final String data;
//   final double fontSize;
//   final Color? color;
//   final FontWeight? fontWeight;
//
//   /// [FittedBox.fit]。
//   /// 文字サイズが、Widget サイズよりも大きくなる際の、調整のしかた。デフォルトは、
//   /// [BoxFit.scaleDown] 。
//   final BoxFit fit;
//
//   /// テキストの配置。\
//   /// デフォルトでは、左揃え。
//   final AlignmentGeometry alignment;
//
//   const UtilizedText(
//       this.data, {
//         super.key,
//         this.fontSize = 21,
//         this.fit = BoxFit.scaleDown,
//         this.color,
//         this.fontWeight,
//         this.alignment = AlignmentGeometry.centerLeft,
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       fit: fit,
//       alignment: alignment,
//       child: Text(
//         data,
//         style: TextStyle(
//           fontSize: fontSize.sp, // ここで初めて sp を計算する
//           color: color,
//           fontWeight: fontWeight,
//         ),
//       ),
//     );
//   }
// }
