import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ActionStyle { yesNo, ok, kakunin }

/// AlertDialog のテンプレート。
/// showDialog の builder の引数の BuildContext は、必ず画面のものと違う名前にすること。
class AlertDialogTemplate extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget>? customActions;

  /// アクションボタンの形式
  ///  - [ActionStyle.yesNo]: 「はい」「いいえ」ボタン
  ///  - [ActionStyle.ok]: 「OK」ボタン
  ///  - [ActionStyle.kakunin]: 「確認」ボタン
  final ActionStyle actionStyle;
  final bool yesNo;
  final bool ok;
  final bool kakunin;
  final VoidCallback? yesAction;
  final VoidCallback? noAction;
  final VoidCallback? okAction;

  /// タイトルの TextStyle 。デフォルトは TextStyle(fontSize: 21.sp)
  late final TextStyle? _titleStyle;

  /// タイトルの TextStyle 。デフォルトは TextStyle(fontSize: 18.sp)
  late final TextStyle? _contentStyle;

  AlertDialogTemplate({
    super.key,
    required this.title,
    required this.content,
    this.customActions,
    required this.actionStyle,
    this.yesAction,
    this.noAction,
    this.okAction,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
  }) : yesNo = actionStyle == ActionStyle.yesNo,
       ok = actionStyle == ActionStyle.ok,
       kakunin = actionStyle == ActionStyle.kakunin {
    _titleStyle =
        titleStyle ?? TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);
    _contentStyle = contentStyle ?? TextStyle(fontSize: 18.sp);
  }

  @override
  Widget build(BuildContext dialogContext) {
    return AlertDialog(
      title: Text(title, style: _titleStyle),
      content: Text(content, style: _contentStyle),
      actions: [
        if (yesNo)
          TextButton(
            child: Text(
              "はい",
              style: TextStyle(fontSize: 18.sp, color: Colors.blue),
            ),
            onPressed: yesAction,
          ),
        if (yesNo)
          TextButton(
            child: Text(
              "いいえ",
              style: TextStyle(fontSize: 18.sp, color: Colors.black87),
            ),
            // 処理を指定していればそちらを、指定していなければ、ダイアログを閉じる処理を実行
            onPressed:
                noAction ??
                () {
                  // このダイアログを閉じるのみ
                  // ダイアログの BuildContext を参照
                  Navigator.of(dialogContext).pop();
                },
          ),
        if (ok)
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(fontSize: 18.sp, color: Colors.black87),
            ),
            // 処理を指定していればそちらを、指定していなければ、ダイアログを閉じる処理を実行
            onPressed:
                okAction ??
                () {
                  // このダイアログを閉じるのみ
                  // ダイアログの BuildContext を参照
                  Navigator.of(dialogContext).pop();
                },
          ),

        /// デフォルトの「確認」ボタン
        if (kakunin)
          TextButton(
            child: Text(
              "確認",
              style: TextStyle(fontSize: 18.sp, color: Colors.blue),
            ),
            onPressed: () {
              // このダイアログを閉じるのみ
              // ダイアログの BuildContext を参照
              Navigator.of(dialogContext).pop();
            },
          ),
      ],
    );
  }
}
