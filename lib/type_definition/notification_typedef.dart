// /// 2026/04/01 追加: Stateクラスからの通知の種類と内容のセット
// ///
// /// 2026/04/24 変更: 全ての層からの通知を管理し、どの層からの通知か（[NotificationFrom]）を追加
// typedef Notified = ({
//   NotificationFrom? layer,
//   NotificationType type,
//   String notification,
// });
//
// typedef NotifiedCallback = void Function(Notified);
//
// /// 2026/04/01 追加: 通知の種類
// enum NotificationType {
//   confirm,
//   test,
//   error,
//   toast,
// }
//
// /// 2026/04/24 追加: どの層のエラーかを識別する
// enum NotificationFrom {
//   viewModel,
//   useCase,
//   gateway,
//   native,
// }
