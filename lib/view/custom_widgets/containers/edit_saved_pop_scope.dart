// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:three_tasks/view/extensions/navigator_extensions.dart';
//
// /// 編集未保存確認クラス
// ///
// /// 対象の画面 Widget （[child]）に編集を加えた状態で pop する際に、保存されずに戻るのを
// /// ダイアログで確認して防ぐ。
// class EditSavedPopScope extends HookWidget {
//   const EditSavedPopScope({super.key, required this.child});
//
//   final Widget child;
//
//   // todo build
//   @override
//   Widget build(BuildContext context) {
//     // この画面で編集作業を行ったかどうか（行ったのに保存せずに戻ってしまうのを防ぐ）
//     final isEdited = useState<bool>(false);
//
//     return SafeArea(
//       child: PopScope(
//         canPop: false,
//         onPopInvokedWithResult: (
//             bool didPop,
//             result,
//             ) async {
//           if (didPop) return;
//           // 編集されていた場合は、ダイアログで確認を促す
//           if (isEdited.value) {
//             // ダイアログで戻ることを確認
//             final bool willPop = await _willDefinitelyPop(context);
//             if(willPop && context.mounted){
//               // TextField 等にフォーカスを残さない
//               Navigator.of(context).popWithUnfocus();
//             }
//           }
//           // 何も編集しなかった場合は、普通に戻る
//           else {
//             // TextField 等にフォーカスを残さない
//             Navigator.of(context).popWithUnfocus();
//           }
//         },
//         // 画面本体
//         child: child,
//       ),
//     );
//   }
//
//   /// 編集してが保存せずに戻ろうとしている時の確認メソッド
//   Future<bool> _willDefinitelyPop(BuildContext context) async {
//     bool _willPop = false;
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text("現在の編集を破棄しますか？"),
//           actions: [
//             // 編集を続ける（戻らない）
//             TextButton(
//               onPressed: () {
//                 _willPop = false;
//                 // TextField 等にフォーカスを残さない
//                 Navigator.of(context).popWithUnfocus();
//               },
//               child: Text("編集を続ける"),
//             ),
//             // 破棄（戻る）
//             TextButton(
//               onPressed: () {
//                 _willPop = true;
//                 // TextField 等にフォーカスを残さない
//                 Navigator.of(context).popWithUnfocus();
//               },
//               child: Text("破棄"),
//             ),
//           ],
//         );
//       },
//     );
//     return _willPop;
//   }
// }
