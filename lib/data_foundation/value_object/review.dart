

import 'package:flutter/foundation.dart';

/// タスクが持つレビューの情報
@immutable
class Review {
  /// 「結果」
  final String? result;

  /// 「次回の方針」
  final String? next;

  const Review({
    required this.result,
    required this.next,
  });
}