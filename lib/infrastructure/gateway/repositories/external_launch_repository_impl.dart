// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:three_tasks/di/providers.dart';
// import 'package:three_tasks/entities/result.dart';
// import 'package:three_tasks/type_definition/notification_typedef.dart';
// import 'package:three_tasks/use_case/event_notifier.dart';
// import 'package:three_tasks/use_case/repository_interface/external_launch_repository.dart';
//
// import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;
//
// /// 外部通信リポジトリの実装クラス
// class ExternalLaunchRepositoryImpl implements ExternalLaunchRepository {
//   /// 2026/05/13 追加: 通知送信クラスのインスタンス
//   final Ref _ref;
//
//   // todo コンストラクタ
//   ExternalLaunchRepositoryImpl(this._ref);
//
//   // todo 依存先
//   EventNotifier get _readEventNotifier => _ref.read(eventProvider);
//
//   /// 2026/05/13 追加: エラーハンドリング
//   void _notifyError(String error) {
//     _readEventNotifier.notifyInfo(
//       layer: NotificationFrom.gateway,
//       type: NotificationType.error,
//       notification: "[外部通信リポジトリ] " + error,
//     );
//   }
//
//   /// URL展開メソッド
//   @override
//   Future<void> openUrl({required Uri uri}) async {
//     try {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       // 2026/05/13 追加: エラーハンドリング
//       _notifyError("リンクを開けませんでした。（$e）");
//     }
//   }
//
//   /// Email送信メソッド
//   ///
//   /// 2026/05/16 変更: 戻り値を、entities の [Result] に変更
//   @override
//   Future<Result<void, Exception>> sendEmail({required Uri emailLaunchUri})
//   //
//   async {
//     _print("Email送信メソッド");
//     try {
//       // 送信
//       await launchUrl(emailLaunchUri);
//       return Success(null);
//     }
//     // 2026/02/14 変更: canLaunchUrl では全てのエラーを拾えない
//     catch (e) {
//       // 2026/05/13 追加: エラーハンドリング
//       _notifyError("送信に失敗しました。（$e）");
//       return Failure(Exception("送信に失敗しました。\n[error] $e"));
//     }
//   }
//
//   /// URL有効性確認メソッド
//   @override
//   Future<bool> debugUriValidation(Uri uri) async {
//     try {
//       final response = await http.head(uri);
//       return response.statusCode >= 200 && response.statusCode < 300;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   /// Emailデバッグメソッド
//   ///
//   /// 2026/05/16 変更: 戻り値を、entities の [Result] に変更
//   @override
//   Future<Result<void, Exception>> debugEmail({required Uri emailLaunchUri})
//   //
//   async {
//     _print("Emailデバッグメソッド");
//     try {
//       final bool canLaunch = await canLaunchUrl(emailLaunchUri);
//       if(canLaunch){
//         return Success(null);
//       } else {
//         // 2026/05/13 追加: エラーハンドリング
//         _notifyError("送信に失敗しました。\ncanLaunch = false");
//         return Failure(Exception("送信に失敗しました。\ncanLaunch = false"));
//       }
//     } catch (e) {
//       // 2026/05/13 追加: エラーハンドリング
//       _notifyError("送信に失敗しました。（$e）");
//       return Failure(Exception("送信に失敗しました。\n[error] $e"));
//     }
//   }
// }
//
// /// printメソッド [外部通信レポジトリ]
// void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
//   if (kDebugMode) {
//     print("");
//     print("[外部通信レポジトリ]　" + s1);
//     if (s2 != null) print("[外部通信レポジトリ]　" + s2);
//     if (s3 != null) print("[外部通信レポジトリ]　" + s3);
//     if (s4 != null) print("[外部通信レポジトリ]　" + s4);
//     if (s5 != null) print("[外部通信レポジトリ]　" + s5);
//     print("");
//   }
// }
