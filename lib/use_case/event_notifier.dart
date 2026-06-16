//
// import 'package:flutter/foundation.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:three_tasks/type_definition/notification_typedef.dart';
//
// /// 通知送信クラス
// ///
// /// 生成される Provider のインスタンスの名前は、"Notifier" が削られて、`eventProvider`
// /// になる。
// class EventNotifier {
//   final _eventController = BehaviorSubject<Notified>();
//
//   Stream<Notified> get eventStream => _eventController.stream;
//
//   // region 2026/05/12 コメントアウト: 購読の記述は View に記す
//   // /// リスナーを追加し、クリーンアップ関数（[StreamSubscription.cancel]） を返すメソッド。
//   // VoidCallback addListener(NotifiedCallback listenedCallback) {
//   //   _print("addListener: リスナーを追加");
//   //   final subscription = _notificationStream.listen(listenedCallback);
//   //   return subscription.cancel;
//   // }
//   // endregion
//
//   // todo 内側から通知を受信
//   /// View 層へ通知し、表示させる
//   ///
//   /// 2026/04/24 変更: インターフェースを変更
//   void notifyInfo({
//     required NotificationFrom? layer,
//     required NotificationType type,
//     required String notification,
//   }) {
//     final Notified notifiedInfo = (
//     layer: layer,
//     type: type,
//     notification: notification,
//     );
//     _eventController.add(notifiedInfo);
//     _print("リスナーが発火");
//   }
// }
//
// /// todo printメソッド [通知管理クラス]
// void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
//   if (kDebugMode) {
//     print("");
//     print("[通知管理クラス]　" + s1);
//     if (s2 != null) print("[通知管理クラス]　" + s2);
//     if (s3 != null) print("[通知管理クラス]　" + s3);
//     if (s4 != null) print("[通知管理クラス]　" + s4);
//     if (s5 != null) print("[通知管理クラス]　" + s5);
//     print("");
//   }
// }