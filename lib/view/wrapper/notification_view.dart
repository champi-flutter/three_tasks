// import 'dart:async';
//
// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:custom_widgets/custom_widgets.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:three_tasks/di/providers.dart';
// import 'package:three_tasks/type_definition/notification_typedef.dart';
// import 'package:three_tasks/view/custom_widgets/overlays/dialogs/alert_dialog_template.dart';
// import 'package:three_tasks/view/overlays/dialogs/report_dialog.dart';
//
// /// 2026/04/01 追加: Stateクラスから送られてきた何らかの通知を画面で表示するラッパークラス。
// class NotificationView extends HookConsumerWidget {
//   final Widget child;
//
//   const NotificationView({super.key, required this.child});
//
//   static const int _testDuration = 3;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 最初の画面描画後に購読
//     useEffect(() {
//       final usedContext = useContext();
//       final readNotificationVM = ref.read(notificationViewModelProvider);
//       // 購読を開始
//       final subscription = readNotificationVM.notificationStream.listen((
//         Notified notifiedInfo,
//       ) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (usedContext.mounted) {
//             switch (notifiedInfo.type) {
//               case NotificationType.confirm:
//                 final layer = switch (notifiedInfo.layer) {
//                   NotificationFrom.viewModel => "ViewModelConfirmation\n",
//                   NotificationFrom.useCase => "UseCaseConfirmation\n",
//                   NotificationFrom.gateway => "GatewayConfirmation\n",
//                   NotificationFrom.native => "NativeConfirmation\n",
//                 null => "",
//                 };
//                 // 通知を表示
//                 usedContext.showNotification(
//                   title: "確認",
//                   titleColor: Colors.white,
//                   notifiedInfo: notifiedInfo,
//                   duration: const Duration(minutes: 30),
//                   layer: layer,
//                   isError: false,
//                 );
//
//               case NotificationType.test:
//                 final layer = switch (notifiedInfo.layer) {
//                   NotificationFrom.viewModel => "ViewModelResult\n",
//                   NotificationFrom.useCase => "UseCaseResult\n",
//                   NotificationFrom.gateway => "GatewayResult\n",
//                   NotificationFrom.native => "NativeResult\n",
//                 null =>"",
//                 };
//                 // 通知を表示
//                 usedContext.showNotification(
//                   title: "テスト",
//                   titleColor: Colors.blueAccent.shade100,
//                   notifiedInfo: notifiedInfo,
//                   duration: const Duration(minutes: _testDuration),
//                   layer: layer,
//                   isError: false,
//                 );
//
//               case NotificationType.error:
//                 final layer = switch (notifiedInfo.layer) {
//                   NotificationFrom.viewModel => "ViewModelException\n",
//                   NotificationFrom.useCase => "UseCaseException\n",
//                   NotificationFrom.gateway => "GatewayException\n",
//                   NotificationFrom.native => "NativeException\n",
//                 null => "",
//                 };
//                 // スナックバーで表示
//                 usedContext.showNotification(
//                   title: "エラー",
//                   titleColor: Colors.redAccent,
//                   notifiedInfo: notifiedInfo,
//                   duration: const Duration(minutes: 60),
//                   layer: layer,
//                   isError: true,
//                 );
//
//               case NotificationType.toast:
//                 // トーストで表示
//                 Fluttertoast.showToast(
//                   msg: notifiedInfo.notification,
//                   toastLength: Toast.LENGTH_LONG,
//                   gravity: ToastGravity.TOP,
//                   textColor: Theme.of(context).colorScheme.secondary,
//                   backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                 );
//             }
//           }
//         });
//       });
//
//       // クリーンアップ関数で購読を解除
//       return () => subscription.cancel();
//     }, []);
//
//     return child;
//   }
// }
//
// extension NotificationExtensions on BuildContext{
//
//   /// 通知を表示するメソッド
//   Future<void> showNotification({
//     required String title,
//     required Color titleColor,
//     required Notified notifiedInfo,
//     required Duration duration,
//     // 2026/04/24 追加:
//     required String layer,
//     // 2026/05/19 追加:
//     required bool isError,
//   })
//   // 折りたたみ用
//   async {
//     await showGeneralDialog(
//       context: this,
//       // 背景（バリア）部分をタップした時に、ダイアログを閉じる
//       barrierDismissible: true,
//       barrierLabel: "Dismiss Notification",
//       // 背景色
//       barrierColor: Colors.black45,
//       // 表示/非表示アニメーションの時間
//       transitionDuration: const Duration(milliseconds: 300),
//
//       // 表示・非表示時の、システム主導のアニメーション
//       transitionBuilder: (context, animation, _, child) {
//         // SlideTransition を用いて、ウィジェットを下から上にスライドさせながら出現させる
//         return SlideTransition(
//           position:
//           Tween<Offset>(
//             // スタート位置：画面のすぐ外側（真下：y座標が 1）
//             begin: const Offset(0, 1),
//             // 終了位置：本来配置される位置（y座標が 0）
//             end: Offset.zero,
//           ).animate(
//             CurvedAnimation(
//               parent: animation, // アニメーションのコントローラー
//               curve: Curves.easeOutQuad, // スムーズな減速（滑らかに止まる）アニメーションカーブを適用
//             ),
//           ),
//           child: child, // pageBuilder で構築された中身（ダイアログウィジェット）
//         );
//       },
//
//       // 本体を構築
//       pageBuilder: (context, animation, _) {
//         // ユーザ主導のアニメーション機能を含むダイアログ
//         return _NotificationOverlayBody(
//           title: title,
//           titleColor: titleColor,
//           notifiedInfo: notifiedInfo,
//           layer: layer,
//           isError: isError,
//           screenWidth: screenWidth,
//           screenHeight: screenHeight,
//         );
//       },
//     );
//   }
// }
//
// /// 通知オーバーレイの本体
// ///
// /// ユーザ主導のアニメーション機能を含むダイアログクラス
// class _NotificationOverlayBody extends HookWidget {
//   final String title;
//   final Color titleColor;
//   final Notified notifiedInfo;
//   final String layer;
//   final bool isError;
//   final double screenWidth;
//   final double screenHeight;
//
//   const _NotificationOverlayBody({
//     super.key,
//     required this.title,
//     required this.titleColor,
//     required this.notifiedInfo,
//     required this.layer,
//     required this.isError,
//     required this.screenWidth,
//     required this.screenHeight,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // ドラッグによる移動量を管理
//     final dragOffset = useState<double>(0.0);
//
//     return GestureDetector(
//       // 縦方向のドラッグを検知してスライドダウンで閉じられるようにする
//       onVerticalDragUpdate: (details) {
//         if (details.primaryDelta! > 0) {
//           // ドラッグの移動量を加算
//           dragOffset.value += details.primaryDelta!;
//         }
//       },
//       onVerticalDragEnd: (details) {
//         // 一定以上スライドされたか、ドラッグの速度が一定以上の場合は閉じる
//         if (dragOffset.value > 100 || details.primaryVelocity! > 500) {
//           Navigator.of(context).pop();
//         } else {
//           // 閾値未満の場合は元の位置に戻す
//           dragOffset.value = 0.0;
//         }
//       },
//       child: AnimatedContainer(
//         duration: Duration.zero,
//         // ドラッグの移動に合わせてウィジェットをY座標が移動
//         transform: Matrix4.translationValues(0, dragOffset.value, 0),
//         child: Material(
//           color: Colors.transparent,
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: SizedBox(
//               // 画面のほとんどをスライド可能領域にする
//               width: screenWidth,
//               height: screenHeight * 0.9,
//               child: Column(
//                 children: [
//                   // 1. スライド可能かつタップで閉じられる透明な領域 (およそ半分)
//                   Expanded(
//                     child: GestureDetector(
//                       behavior: HitTestBehavior.translucent,
//                       onTap: () => Navigator.of(context).pop(),
//                       child: Container(
//                         color: Colors.transparent,
//                       ),
//                     ),
//                   ),
//                   // 2. 実際の表示領域 (通知コンテンツ)
//                   Container(
//                     // 高さは、子Widget の高さの合計（↓ Column.mainAxisSize で設定）
//                     width: screenWidth * 0.9,
//                     // この Container の下側
//                     margin: EdgeInsets.only(
//                       bottom: context.obscuredArea.bottom + 16.h,
//                     ),
//                     // この Container の内側と、子Widget との間隔
//                     padding: EdgeInsets.all(16.r),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade300,
//                       borderRadius: BorderRadius.circular(24),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 10,
//                           offset: Offset(0, 5.h),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       // Column の高さを、children の高さの合計に制限
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // タイトル
//                         Text(
//                           title,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24.sp,
//                             color: titleColor,
//                           ),
//                         ),
//                         SizedBox(height: 16.h),
//                         // 通知内容
//                         Center(
//                           child: UtilizedText(
//                             layer + "${notifiedInfo.notification}\n$nowWithTime",
//                             color: Colors.black,
//                             fontSize: 18,
//                           ),
//                         ),
//                         // 「報告する」ボタン
//                         if (isError) ...[
//                           SizedBox(height: 16.h),
//                           Align(
//                             alignment: AlignmentGeometry.bottomRight,
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                 bottom: 16.h,
//                                 right:8.w,
//                               ),
//                               child: FormalButton(
//                                 text: "報告する",
//                                 onPressed: () async {
//                                   // 不具合報告ダイアログ表示メソッドを起動し、そのプロセスが完了
//                                   // した後に、スナックバーを閉じる
//                                   await _showReportDialog(
//                                     context,
//                                     // 送信内容
//                                     body:
//                                     layer + "${notifiedInfo.notification}\n$nowWithTime",
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// 不具合報告ダイアログ表示メソッド
//   ///
//   /// 確認ダイアログと不具合報告ダイアログの両方を同じ非同期プロセスに組み込む
//   Future<void> _showReportDialog(BuildContext context, {required String? body})
//   // 折りたたみ用
//   async {
//     // 確認ダイアログを表示
//     // この変数に入れる値は、`Navigator.of(context).pop(<ここ>)` に当てはめられる
//     final bool isConfirmed = await showDialog(
//       context: context,
//       // ダイアログ枠外タップを無効化
//       barrierDismissible: false,
//       builder: (dialogContext1) {
//         return AlertDialogTemplate(
//           title: "確認",
//           content: "開発者にレポートを送信しますか？",
//           actionStyle: ActionStyle.yesNo,
//           yesAction: () {
//             // 次のダイアログの表示を許可する
//             Navigator.of(context).pop(true);
//           },
//           noAction: () {
//             // 次のダイアログの表示を拒否し、早期リターン
//             Navigator.of(context).pop(false);
//           },
//         );
//       },
//     );
//     // 「はい」の場合のみ不具合報告ダイアログを表示
//     if (isConfirmed) {
//       await showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (dialogContext1) {
//           return ReportDialog(
//             initialSubject: "習慣トラッカーカードアプリの不具合の報告",
//             initialBody: body,
//           );
//         },
//       );
//     }
//   }
// }
//
// /// todo printメソッド [notification_view.dart]
// void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
//   if (kDebugMode) {
//     print("");
//     print("[notification_view.dart]　" + s1);
//     if (s2 != null) print("[notification_view.dart]　" + s2);
//     if (s3 != null) print("[notification_view.dart]　" + s3);
//     if (s4 != null) print("[notification_view.dart]　" + s4);
//     if (s5 != null) print("[notification_view.dart]　" + s5);
//     print("");
//   }
// }
