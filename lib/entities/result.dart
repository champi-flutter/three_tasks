// /// 2026/05/16 追加: 処理結果を呼び出し元に渡すためのクラス
// sealed class Result<S, E extends Exception> {
//   final String? methodName;
//   const Result({this.methodName});
// }
//
// // final で継承をストップ
// /// 成功時のクラス
// final class Success<S, E extends Exception> extends Result<S, E> {
//   final S value;
//   const Success(this.value, {super.methodName});
// }
//
// /// 失敗時のクラス
// final class Failure<S, E extends Exception> extends Result<S, E> {
//   final E exception;
//   const Failure(this.exception, {super.methodName});
// }