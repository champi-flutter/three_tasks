//
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'loading_state.freezed.dart';
//
// @freezed
// abstract class LoadingState with _$LoadingState {
//   const factory LoadingState({
//     @Default(0) int loadingProcess,
//     @Default(<Type, bool>{}) Map<Type, bool> isReadyMap,
//     @Default(false) bool shouldReset,
//   }) = _LoadingState;
//
//   // getter を freezed クラス内に定義するためのカスタムコンストラクタ
//   const LoadingState._();
//
//   /// ローディング表示を有効にするかどうか
//   ///
//   /// ローディングが始まると`true`になる。
//   bool get isLoading => loadingProcess > 0 || !isReady;
//
//   bool get isReady => !isReadyMap.containsValue(false);
// }