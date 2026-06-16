//
//
// import 'dart:async';
//
// import 'package:flutter/foundation.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:three_tasks/di/providers.dart';
// import 'package:three_tasks/type_definition/notification_typedef.dart';
// import 'package:three_tasks/use_case/event_notifier.dart';
//
// /// 各クラスから何らかの通知を受け取り、画面に知らせるクラス
// class NotificationViewModel {
//   // todo コンストラクタ
//   NotificationViewModel(this._ref){
//     // 購読を開始
//     _subscription = _readEventNotifier.eventStream.listen((Notified event){
//       _notificationController.add(event);
//     });
//   }
//
//   final Ref _ref;
//
//   /// 通知送信クラスのインスタンス
//   EventNotifier get _readEventNotifier => _ref.read(eventProvider);
//
//   final _notificationController = BehaviorSubject<Notified>();
//
//   /// 通知を受信するストリーム
//   Stream<Notified> get notificationStream => _notificationController.stream;
//
//   StreamSubscription<Notified>? _subscription;
//
//   /// コントローラを破棄。
//   void dispose() {
//     _subscription?.cancel();
//     _notificationController.close();
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