

import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';

/// ラベル化時に同じ名前のラベルがすでにあった場合に、そこに登録するかを確認するダイアログ
///  - 「はい」: `pop` して `true` を返す
///  - 「いいえ」: `pop` して `false` を返す
class ConfirmingExistingLabelDialog extends StatelessWidget {
  const ConfirmingExistingLabelDialog({super.key, required this.labelTitle});

  final String labelTitle;

  @override
  Widget build(BuildContext context) {
    return SizedSimpleDialog.confirm(
      title: UtilizedText(
        "確認",
        fontSize: 21,
      ),
      contentsList: [
        UtilizedText(
          "「$labelTitle」 はすでに存在します。",
          fontSize: 18,
        ),
        UtilizedText(
          "「$labelTitle」 に登録しますか？",
          fontSize: 18,
        ),
        // todo 「以降表示しない」のチェックボックス（2026/07/01）＞＞
      ],
      onDecided: () {
        // pop 時に true を返す
        Navigator.of(context).popWithUnfocus(true);
      },
      onReturn: () {
        // pop 時に false を返す
        Navigator.of(context).popWithUnfocus(false);
      },
    );
  }
}

/// printメソッド [confirming_existing_label_dialog.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[confirming_existing_label_dialog.dart]　" + s1);
    if (s2 != null) print("[confirming_existing_label_dialog.dart]　" + s2);
    if (s3 != null) print("[confirming_existing_label_dialog.dart]　" + s3);
    if (s4 != null) print("[confirming_existing_label_dialog.dart]　" + s4);
    if (s5 != null) print("[confirming_existing_label_dialog.dart]　" + s5);
    print("");
  }
}