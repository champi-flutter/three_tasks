import 'package:data_converter/data_converter.dart';
import 'package:three_tasks/data_foundation/review_base/review_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

/// レビューのエンティティ
class EReview extends ReviewBase{
  /// レビューのID
  ///  - 上位32ビット: タスク ID
  ///  - 下位32ビット: タスクの種別
  final int reviewId;

  /// タスク ID
  int get taskId => Int32Packer.unpackHigh(reviewId);

  /// タスクの種別
  TaskRec get rec {
    // 下位32ビットを抽出する
    final int recInt = Int32Packer.unpackLow(reviewId);
    return switch (recInt) {
      0 => TaskRec.day,
      1 => TaskRec.week,
      2 => TaskRec.month,
      3 => TaskRec.year,
      _ => throw ArgumentError(
          "[EReview] レビュー ID が不正です。\nInt32Packer.unpackLow(reviewId) = $recInt",
        )
    };
  }

  /// ラベルの ID
  final int labelId;

  /// 結果
  String _result;

  /// 結果
  String get result => _result;

  /// 次回の方針
  String _next;

  /// 次回の方針
  String get next => _next;

  EReview({
    required this.reviewId,
    required this.labelId,
    required String result,
    required String next,
  })  : _result = result,
        _next = next;

  factory EReview.fromTaskInfo({
    required int taskId,
    required TaskRec rec,
    required int labelId,
    required String result,
    required String next,
  }) {
    final recInt = switch (rec) {
      TaskRec.day => 0,
      TaskRec.week => 1,
      TaskRec.month => 2,
      TaskRec.year => 3,
    };
    final packedId = Int32Packer.pack(taskId, recInt);
    return EReview(
      reviewId: packedId,
      labelId: labelId,
      result: result,
      next: next,
    );
  }

  void update({
    String? result,
    String? next,
  }) {
    if (result != null) {
      _result = result;
    }
    if (next != null) {
      _next = next;
    }
  }
}
