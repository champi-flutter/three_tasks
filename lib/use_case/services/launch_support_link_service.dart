// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:three_tasks/di/providers.dart';
// import 'package:three_tasks/entities/result.dart';
// import 'package:three_tasks/use_case/repository_interface/external_launch_repository.dart';
//
// class LaunchSupportLinkService {
//   /// 外部通信リポジトリクラスのインスタンス
//   ///
//   /// 2026/05/09 変更: DI方法をコンストラクタ注入に変更
//   ExternalLaunchRepository get _readRepository =>
//       _ref.read(externalLaunchRepositoryProvider);
//
//   final Ref _ref;
//
//   // todo コンストラクタ
//   LaunchSupportLinkService(this._ref);
//
//   /// URL展開メソッド
//   Future<void> openUrl({String? strUrl, Uri? uri}) async {
//     assert(strUrl != null || uri != null, "エラー: URL展開メソッドで、引数が指定されていない");
//     _print("URL展開メソッド");
//     final Uri targetUri = uri ?? Uri.parse(strUrl!);
//     // デバッグ
//     if (kDebugMode) {
//       // メタ情報のみにアクセス
//       final bool isValid = await _readRepository.debugUriValidation(targetUri);
//       final String result = isValid ? "URLは有効です" : "URLが無効です";
//       _print(result, "[targetUri] $targetUri");
//     }
//     // 本番環境
//     else {
//       await _readRepository.openUrl(uri: targetUri);
//     }
//   }
//
//   /// Email送信メソッド
//   ///
//   /// 戻り値は、送信結果。
//   Future<Result<void, Exception>> sendEmail({
//     required String subject,
//     required String body,
//     required String developersEmail,
//   }) async {
//     _print("Email送信メソッド");
//     final Uri emailLaunchUri = Uri(
//       scheme: "mailto",
//       // 開発者のアドレス
//       path: developersEmail,
//       queryParameters: {
//         // 件名
//         "subject": subject,
//         // 本文
//         "body": body,
//       },
//     );
//     final Result<void, Exception> result = switch (kDebugMode) {
//       // デバッグ
//       true => await _readRepository.debugEmail(emailLaunchUri: emailLaunchUri),
//       // 本番環境
//       false => await _readRepository.sendEmail(emailLaunchUri: emailLaunchUri),
//     };
//     return result;
//   }
// }
//
// /// printメソッド [外部通信サービス]
// void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
//   if (kDebugMode) {
//     print("");
//     print("[外部通信サービス]　" + s1);
//     if (s2 != null) print("[外部通信サービス]　" + s2);
//     if (s3 != null) print("[外部通信サービス]　" + s3);
//     if (s4 != null) print("[外部通信サービス]　" + s4);
//     if (s5 != null) print("[外部通信サービス]　" + s5);
//     print("");
//   }
// }
