// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:three_tasks/view/custom_widgets/utilized_text.dart';
//
// class FullWidthButton extends StatelessWidget {
//   const FullWidthButton({
//     super.key,
//     required this.text,
//     double fontSize = 25,
//     bool isBoldText = false,
//     this.textColor,
//     this.backgroundColor,
//     this.height,
//     required this.onPressed,
//   })
//       : _fontSize = fontSize,
//         _fontWeight = isBoldText ? FontWeight.bold : null;
//
//   final String text;
//
//   final double _fontSize;
//
//   final FontWeight? _fontWeight;
//
//   final Color? textColor;
//
//   final Color? backgroundColor;
//
//   final double? height;
//
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     // final double screenWidth = context.screenWidth;
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           minimumSize: Size(double.infinity, height ?? 90.h),
//           backgroundColor: backgroundColor ?? Theme
//               .of(context)
//               .colorScheme
//               .primary,
//         ),
//         onPressed: onPressed,
//         child: UtilizedText(
//           text,
//           fontSize: _fontSize,
//           fontWeight: _fontWeight,
//           color: textColor ?? Theme
//               .of(context)
//               .colorScheme
//               .onPrimary,
//         ),
//       ),
//     );
//   }
// }