import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 重要度の高いアクションを行うボタン
class ImpressiveButton extends StatelessWidget {
  /// ボタンの文字。
  final String text;

  /// ボタンの文字のスタイル [Text.style]。
  /// [TextStyle.fontSize] のデフォルトは、```19.sp```。
  /// [TextStyle.color] は、```isValid ? Colors.white : Colors.white ```。
  final TextStyle textStyle;

  /// ボタンが有効かどうか。
  final bool isValid;

  /// ボタンを押されたときの処理（[ButtonStyleButton.onPressed]）。
  final VoidCallback? onPressed;

  /// ボタンを長押ししたときの処理（[ButtonStyleButton.onLongPress]）。
  final VoidCallback? onLongPress;

  /// ボタンの横幅。デフォルトでは、```90.w```
  final double _buttonWidth;

  /// ボタンの縦幅。デフォルトでは、
  /// ``` _buttonWidth / 2  // 横幅の半分 ```
  final double _buttonHeight;

  /// ボタンの枠の形。デフォルトでは、``` BorderRadius.circular(35) ```
  final BorderRadius _borderRadius;

  /// ボタンの浮き具合
  final double elevation;

  /// ボタンが有効な時の背景色。デフォルトでは、```Colors.blue```
  final Color? backgroundColor;

  /// ボタンが無効な時の背景色。デフォルトでは、```Colors.blue.shade50```
  final Color? invalidColor;

  /// ボタンが有効な時の枠の色。デフォルトでは、```Colors.blue.shade700```
  final Color? borderColor;

  /// ボタンが無効な時の枠の色。デフォルトでは、```Colors.blue.shade400```
  final Color? invalidBorderColor;

  /// 枠の色と太さの設定。太さは、1.5 固定。
  /// 色は、[borderColor] と [invalidBorderColor] （[isValid] で変化）。
  ///
  /// [BorderSide.color] は non-nullable なので条件が必要。
  /// [borderColor] が null の場合は、[invalidBorderColor] は設定できず（assert）、
  /// この値は、[BorderSide.none] になる。
  ///
  /// 無効なときに枠線の色も変化させたい場合は、[invalidBorderColor] を指定する。
  final BorderSide borderSide;

  final bool _flexible;

  ImpressiveButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
    double? fontSize,
    FontWeight? fontWeight,
    this.isValid = true,
    double? buttonWidth,
    double? buttonHeight,
    BorderRadius? borderRadius,
    this.elevation = 0.0,
    this.backgroundColor = Colors.blue,
    this.invalidColor = const Color(0xFFE3F2FD), // Colors.blue.shade50
    this.borderColor = const Color(0xFF1976D2), // Colors.blue.shade700
    this.invalidBorderColor = const Color(0xFF42A5F5), // Colors.blue.shade400
    Color textColor = Colors.white,
    Color invalidTextColor = Colors.white,
  }) : textStyle = TextStyle(
         fontSize: fontSize ?? 19.sp,
         fontWeight: fontWeight,
         color: isValid ? textColor : invalidTextColor,
       ),
       _buttonWidth = buttonWidth ?? 90.w,
       _buttonHeight =
           buttonHeight ?? (buttonWidth != null ? buttonWidth / 2 : 45.h),
       _borderRadius = borderRadius ?? BorderRadius.circular(35),
       // borderColor が指定されていなければ、BorderSide.none
       borderSide = (borderColor != null)
           ? BorderSide(
               // 無効なときに枠線の色も変化させたい場合は、invalidBorderColor を指定する
               color: isValid
                   ? borderColor
                   : (invalidBorderColor ?? borderColor),
               width: 1.5,
             )
           : BorderSide.none,
       _flexible = false,
       // 無効なときの枠線だけを設定している場合は assert
       assert(!(borderColor == null && invalidBorderColor != null), "枠線の設定");

  /// 文字が長い場合に、文字を小さくするのではなく、ボタンの横幅を広げる
  ImpressiveButton.longText({
    super.key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
    double? fontSize,
    FontWeight? fontWeight,
    this.isValid = true,
    double? buttonWidth,
    double? buttonHeight,
    BorderRadius? borderRadius,
    this.elevation = 0.0,
    this.backgroundColor = Colors.blue,
    this.invalidColor = const Color(0xFFE3F2FD), // Colors.blue.shade50
    this.borderColor = const Color(0xFF1976D2), // Colors.blue.shade700
    this.invalidBorderColor = const Color(0xFF42A5F5), // Colors.blue.shade400
    Color textColor = Colors.white,
    Color invalidTextColor = Colors.white,
  }) : textStyle = TextStyle(
         fontSize: fontSize ?? 19.sp,
         fontWeight: fontWeight,
         color: isValid ? textColor : invalidTextColor,
       ),
       _buttonWidth = buttonWidth ?? 90.w,
       _buttonHeight =
           buttonHeight ?? (buttonWidth != null ? buttonWidth / 2 : 45.h),
       _borderRadius = borderRadius ?? BorderRadius.circular(35),
       // borderColor が指定されていなければ、BorderSide.none
       borderSide = (borderColor != null)
           ? BorderSide(
               // 無効なときに枠線の色も変化させたい場合は、invalidBorderColor を指定する
               color: isValid
                   ? borderColor
                   : (invalidBorderColor ?? borderColor),
               width: 1.5,
             )
           : BorderSide.none,
       _flexible = true,
       // 無効なときの枠線だけを設定している場合は assert
       assert(!(borderColor == null && invalidBorderColor != null), "枠線の設定");

  @override
  Widget build(BuildContext context) {
    // ボタンの中身。通常（_flexible == false）は、後者（ボタンサイズが固定で文字がはみ
    // 出る場合はボタンサイズが横に大きくなる）。.longText の場合（_flexible == true）は
    // 、前者（文字サイズが固定で文字がはみ出る場合は文字を小さくする）。
    final Widget _content = _flexible
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Center(child: Text(text, style: textStyle, maxLines: 1)),
          )
        : Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(text, style: textStyle),
            ),
          );

    if (kDebugMode) {
      // 無効時は厚みをなくして「押し込まれた」状態を表現
      final double depth = isValid ? 4.0 : 0.0;
      return SizedBox(
        width: _flexible ? null : _buttonWidth,
        height: _buttonHeight + 4.0, // 厚みの分だけ高さを確保
        child: Stack(
          children: [
            // 1. 底面（ボタンの「厚み／側面」の部分）
            Positioned(
              bottom: 0,
              child: Container(
                width: _flexible ? null : _buttonWidth,
                height: _buttonHeight,
                decoration: BoxDecoration(
                  color: isValid ? borderColor : invalidBorderColor,
                  // 濃い色を側面にする
                  borderRadius: _borderRadius,
                ),
                child: _flexible
                    ? IntrinsicWidth(
                        child: SizedBox(
                          height: _buttonHeight,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            // 2. 表面（実際にタップする部分）
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              bottom: depth, // 有効時は上に浮かせ、無効時は下に下げる
              child: Material(
                color: isValid ? backgroundColor : invalidColor,
                borderRadius: _borderRadius,
                child: InkWell(
                  onTap: isValid ? onPressed : null,
                  onLongPress: isValid ? onLongPress : null,
                  borderRadius: _borderRadius,
                  child: Container(
                    width: _flexible ? null : _buttonWidth,
                    height: _buttonHeight,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: (isValid ? borderColor : invalidBorderColor)!,
                        width: 1.5,
                      ),
                      borderRadius: _borderRadius,
                    ),
                    child: _content,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: _buttonWidth,
        minHeight: _buttonHeight,
        // .longText の場合（_flexible == true）は、横幅が広がる
        // maxWidth: _flexible ? double.infinity : _buttonWidth,
      ),
      child: Material(
        elevation: elevation,
        color: isValid ? backgroundColor : invalidColor,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius,
          side: borderSide,
        ),
        child: InkWell(
          child: SizedBox(
            width: _flexible ? null : _buttonWidth,
            height: _buttonHeight,
            child: _content,
          ),
          borderRadius: _borderRadius,
          onTap: isValid ? onPressed : null,
          onLongPress: isValid ? onLongPress : null,
        ),
      ),
    );
  }
}
