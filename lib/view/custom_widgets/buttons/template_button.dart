import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ボタンのテンプレ。
/// 文字の量がボタンサイズに収まらなくなる場合、文字が見切れないように、ボタンサイズに合わせて
/// 小さくなる。長い文字列に合わせてボタンの横幅を広げたい場合は、[TemplateButton.longText]
/// を使用すること。
/// また、screenutil を有効にするために、runApp で作るクラスを [ScreenUtilInit] でラップし、
/// 以下のように設定する必要がある。
/// ``` dart: main.dart
/// @override
/// Widget build(BuildContext context) {
///   return ScreenUtilInit(
///     designSize: Size(411, 914),
///     minTextAdapt: false,
///     splitScreenMode: true,
///     builder: (context, _)=>MaterialApp(
///       title: 'Custom Widgets',
///       theme: ThemeData(
///           colorScheme: .fromSeed(seedColor: Colors.deepPurple),
///     ),
///     home: const HomeScreen(),
///   ),
///   );
/// }
/// ```
class TemplateButton extends StatelessWidget {
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

  // /// ボタンが有効な時の文字の色。デフォルトでは、```Colors.white```
  // final Color? textColor;
  //
  // /// ボタンが無効な時の文字の色。デフォルトでは、```Colors.white```
  // final Color? invalidTextColor;

  /// 枠の色と太さの設定。太さは、1.5 固定。
  /// 色は、[borderColor] と [invalidBorderColor] （[isValid] で変化）。
  ///
  /// [BorderSide.color] は non-nullable なので条件が必要。
  /// [borderColor] が null の場合は、[invalidBorderColor] は設定できず（assert）、
  /// この値は、[BorderSide.none] になる。
  ///
  /// 無効なときに枠線の色も変化させたい場合は、[invalidBorderColor] を指定する。
  final BorderSide borderSide;

  /// 文字の両端の余白。デフォルトは、通常時（[_flexible] == false）は 8.0 、
  /// [TemplateButton.longText] の場合は 16.0 。
  final double sidePadding;

  /// ボタンサイズを固定するか（false）、文字の量によって横幅を拡張するか（true）。
  final bool _flexible;

  TemplateButton({
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
    this.sidePadding = 8.0,
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
  TemplateButton.longText({
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
    this.sidePadding = 16.0 ,
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
        ? Center(child: Text(text, style: textStyle, maxLines: 1))
        : Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: textStyle),
      ),
    );

    final Widget _buttonForm= ConstrainedBox(
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: _content,
            ),
          ),
          borderRadius: _borderRadius,
          onTap: isValid ? onPressed : null,
          onLongPress: isValid ? onLongPress : null,
        ),
      ),
    );

    return _flexible ? IntrinsicWidth(child: _buttonForm):_buttonForm;
  }
}


/// ダイアログのボタンのテンプレ
class TemplateDialogActions extends StatelessWidget {
  /// 決定ボタンの文字。
  final String textOfDecision;

  /// ボタンの文字サイズ [TextStyle.fontSize]。
  /// デフォルトでは、```19.sp```。
  final double? fontSize;

  /// 決定ボタンの文字の太さ [TextStyle.fontWeight]。
  final FontWeight? decisionFontWeight;

  /// 戻るボタンの文字の太さ
  final FontWeight? returningFontWeight;

  /// 決定ボタンが有効かどうか
  final bool canDecide;

  /// 決定ボタンを押したときの処理。
  final VoidCallback? onDecided;

  /// 決定ボタンを長押ししたときの処理。
  final VoidCallback? onLongPressAtDecision;

  /// ボタンの横幅。デフォルトでは、```90.w``` 。
  final double? buttonWidth;

  /// ボタンの縦幅。デフォルトでは、
  /// ``` buttonWidth / 2  // 横幅の半分 ```
  final double? buttonHeight;

  /// ボタンの枠の形。デフォルトでは、``` BorderRadius.circular(35) ```
  final BorderRadius? borderRadius;

  /// ボタンの浮き具合
  final double elevation;

  /// 決定ボタンが有効な時の背景色。デフォルトでは、```Colors.blue```
  final Color decisionBackgroundColor;

  /// 決定ボタンが無効な時の背景色。デフォルトでは、```Colors.blue.shade50```
  final Color invalidColor;

  /// 決定ボタンが有効な時の枠の色。デフォルトでは、```Colors.blue.shade700```
  final Color decisionBorderColor;

  /// 決定ボタンが無効な時の枠の色。デフォルトでは、```Colors.blue.shade400```
  final Color invalidBorderColor;

  /// 決定ボタンが有効な時の文字の色。デフォルトでは、```Colors.white```
  final Color textColorOfDecision;

  /// 決定ボタンが無効な時の文字の色。デフォルトでは、```Colors.white```
  final Color invalidTextColor;

  /// 戻るボタンの文字。
  final String textOfReturning;

  /// 戻るボタンを押したときの処理。デフォルトでは、
  /// ```
  /// Navigator.of(context).pop();
  /// ```
  final VoidCallback? onReturn;

  /// 戻るボタンの背景色。デフォルトでは、null 。
  final Color? returningBackgroundColor;

  /// 戻るボタンの枠の色。デフォルトでは、```Colors.black``` 。
  final Color returningBorderColor;

  /// 戻るボタンの文字の色。デフォルトでは、```Colors.black``` 。
  final Color textColorOfReturning;

  /// 文字の両端の余白。デフォルトは、 8.0 。　文字がデフォルトの、「決定」と「戻る」の場合は、
  /// ここは指定しない方がいいい。
  final double sidePadding;

  TemplateDialogActions({
    super.key,
    this.canDecide = true,
    this.textOfDecision = "決定",
    this.fontSize,
    this.decisionFontWeight,
    this.returningFontWeight,
    // TextStyle? decisionStyle,
    required this.onDecided,
    this.onLongPressAtDecision,
    this.elevation = 0.0,
    this.decisionBackgroundColor = Colors.blue,
    this.invalidColor = const Color(0xFFE3F2FD), // Colors.blue.shade50
    this.decisionBorderColor = const Color(0xFF1976D2), // Colors.blue.shade700
    this.invalidBorderColor = const Color(0xFF42A5F5), // Colors.blue.shade400
    this.textColorOfDecision = Colors.white,
    this.invalidTextColor = Colors.white,
    this.buttonWidth,
    this.buttonHeight,
    this.borderRadius,
    this.textOfReturning = "戻る",
    this.onReturn,
    this.returningBackgroundColor,
    this.returningBorderColor = Colors.black,
    this.textColorOfReturning = Colors.black,
    this.sidePadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // 決定ボタン
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
          child: TemplateButton(
            text: textOfDecision,
            onPressed: onDecided,
            onLongPress: onLongPressAtDecision,
            elevation: elevation,
            fontSize: fontSize,
            fontWeight: decisionFontWeight,
            isValid: canDecide,
            buttonWidth: buttonWidth,
            buttonHeight: buttonHeight,
            borderRadius: borderRadius,
            backgroundColor: decisionBackgroundColor,
            invalidColor: invalidColor,
            borderColor: decisionBorderColor,
            invalidBorderColor: invalidBorderColor,
            textColor: textColorOfDecision,
            invalidTextColor: invalidTextColor,
            sidePadding: sidePadding,
          ),
        ),
        // 戻るボタン
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
          child: TemplateButton(
            text: textOfReturning,
            onPressed: onReturn ?? () => Navigator.of(context).pop(),
            fontSize: fontSize,
            fontWeight: returningFontWeight,
            buttonWidth: buttonWidth,
            buttonHeight: buttonHeight,
            elevation: elevation,
            borderRadius: borderRadius,
            backgroundColor: returningBackgroundColor,
            borderColor: returningBorderColor,
            textColor: textColorOfReturning,
            sidePadding: sidePadding,
          ),
        ),
      ],
    );
  }
}
