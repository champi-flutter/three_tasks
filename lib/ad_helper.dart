// import 'dart:io';
//
// class AdHelper {
//
//   // バナー広告
//   static String get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       // テスト用
//       return "ca-app-pub-3940256099942544/6300978111";
//       // 新：本番用return 'ca-app-pub-9064320488673982/3248920761';
//       // 旧：本番用return 'ca-app-pub-9064320488673982/2952305279';
//     } else if (Platform.isIOS) {
//       // テスト用
//       return 'ca-app-pub-3940256099942544/2934735716';
//       // 本番用return 'ca-app-pub-9064320488673982/7114911566';
//     }
//     throw UnsupportedError("Unsupported platform");
//   }
//
//   // インタースティシャル広告
//   static String get interstitialAdUnitId {
//     if (Platform.isAndroid) {
//       // テスト用
//       return 'ca-app-pub-3940256099942544/1033173712';
//       // 新：本番用return 'ca-app-pub-9064320488673982/5867329339';
//       // 旧：本番用return 'ca-app-pub-9064320488673982/3503788820';
//     } else if (Platform.isIOS) {
//       // テスト用
//       return 'ca-app-pub-3940256099942544/4411468910';
//       // 本番用return 'ca-app-pub-9064320488673982/5651262402';
//     }
//     throw UnsupportedError("Unsupported platform");
//   }
//
//   // static String get rewardedAdUnitId {
//   //   if (Platform.isAndroid) {
//   //     return 'ca-app-pub-3940256099942544/5224354917';
//   //   } else if (Platform.isIOS) {
//   //     return 'ca-app-pub-3940256099942544/1712485313';
//   //   }
//   //   throw UnsupportedError("Unsupported platform");
//   // }
//
//   // static String get nativeAdUnitId {
//   //   if (Platform.isAndroid) {
//   //     return 'ca-app-pub-3940256099942544/2247696110';
//   //   } else if (Platform.isIOS) {
//   //     return 'ca-app-pub-3940256099942544/3986624511';
//   //   }
//   //   throw UnsupportedError("Unsupported platform");
//   // }
// }