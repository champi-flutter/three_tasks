//
// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:three_tasks/config/private_config.dart';
// import 'package:three_tasks/di/providers.dart';
// import 'package:three_tasks/entities/result.dart';
// import 'package:three_tasks/type_definition/notification_typedef.dart';
// import 'package:three_tasks/use_case/event_notifier.dart';
// import 'package:three_tasks/use_case/services/launch_support_link_service.dart';
// import 'package:three_tasks/view_models/loading_view_model.dart';
//
// /// サイドメニューVMクラス
// ///
// /// 描画には関わらないので ChangeNotifier である必要はない。
// ///
// /// 2026/05/12 変更: [LoadingHandler] を mixin 。
// class DrawerViewModel with LoadingHandler {
//
//   final Ref _ref;
//
//   // todo コンストラクタ
//   DrawerViewModel(this._ref);
//
//   // todo 依存先
//   EventNotifier get _readEventNotifier => _ref.read(eventProvider);
//
//   /// 外部通信サービスクラスのインスタンス
//   ///
//   /// 2026/05/10 変更: DIをコンストラクタ注入に変更
//   LaunchSupportLinkService get _readService => _ref.read(launchSupportLinkServiceProvider);
//
//   // todo ローディング関連
//   /// 2026/05/12 追加: ローディング管理クラスのインスタンス
//   @override
//   LoadingViewModel get loadingVM => _ref.read(loadingViewModelProvider.notifier);
//
//   // todo 通知関連
//   /// レポート送信完了通知メソッド
//   void _notifySuccess() {
//     _readEventNotifier.notifyInfo(
//       layer: NotificationFrom.gateway,
//       type: NotificationType.confirm,
//       notification: "不具合を送信しました。\nご協力ありがとうございます。",
//     );
//   }
//
//   /// 利用規約タップメソッド
//   Future<void> onTermsTapped() => loadAsync(() async {
//     await _readService.openUrl(strUrl: PrivateConfig.termsUrl);
//   });
//
//   /// 利用規約タップメソッド
//   Future<void> onPrivacyPolicyTapped() => loadAsync(() async {
//     await _readService.openUrl(strUrl: PrivateConfig.privacyPolicyUrl);
//   });
//
//   /// レポート送信メソッド
//   Future<void> reportIssues({
//     required String subject,
//     required String body,
//   }) async {
//     Result<void, Exception>? _result;
//     await loadAsync(() async {
//       _result = await _readService.sendEmail(
//         subject: subject,
//         body: body,
//         developersEmail: "",
//         // PrivateConfig.developersEmail,
//       );
//     });
//     switch(_result){
//     // 送信完了の結果が帰ってきたら、View層に通知
//       case Success():
//         _notifySuccess();
//         break;
//     // エラーが発生した場合は、発生した場所で通知される
//       case Failure():
//         break;
//       case null:
//         break;
//     }
//   }
// }