

import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/result.dart';

/// 外部通信リポジトリクラス
abstract class ExternalLaunchRepository {
  /// URL展開メソッド
  Future<void> openUrl({required Uri uri});

  /// Email送信メソッド
  ///
  /// 2026/05/16 変更: 戻り値を、entities の [Result] に変更
  Future<Result<void, Exception>> sendEmail({required Uri emailLaunchUri});

  Future<bool> debugUriValidation(Uri uri);

  /// Emailデバッグメソッド
  ///
  /// 2026/05/16 変更: 戻り値を、entities の [Result] に変更
  Future<Result<void, Exception>> debugEmail({required Uri emailLaunchUri});
}