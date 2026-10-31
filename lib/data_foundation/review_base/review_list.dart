import 'package:custom_core_types/custom_core_types.dart';
import 'package:flutter/foundation.dart';
import 'package:three_tasks/data_foundation/review_base/review_base.dart';
import 'package:three_tasks/enum/task_recurrence.dart';

sealed class ReviewListBase<Review extends ReviewBase> extends FixedList<Review> {

  /// タスクの種別
  TaskRec get rec;

  ReviewListBase.fill(super.length, super.fill) : super.fill();

  ReviewListBase.fromIterable(super.length, super.iterable)
      : super.fromIterable();

  @protected
  ReviewListBase.copy(super.list) : super.copy();

  @override
  ReviewListBase<Review> get deepCopy;
}

/// レビューのリスト
///
/// 要素数を 3 つに固定する。
class ReviewList<Review extends ReviewBase> extends ReviewListBase<Review> {

  /// タスクの種別
  @override
  final TaskRec rec;

  ReviewList(
      Review review1,
      Review review2,
      Review review3,
      ) : rec = review1.rec, super.fill(
    3,
        (i) => switch (i) {
      0 => review1,
      1 => review2,
      2 => review3,
    // length を 3 で指定しているため例外はないが、網羅性のために記載
      _ => throw RangeError('[ReviewListBase] インデックス $i は範囲外です。'),
    },
  );

  /// [Iterable] から [ReviewList] を生成するコンストラクタ
  ReviewList.fromIterable(Iterable<Review> iterable)
      : assert(
  iterable.length == 3,
  "[ReviewList.fromIterable] 要素数が不適当です",
  ),
        rec = iterable.first.rec,
        super.fromIterable(
        3,
        iterable,
      );

  @override
  @protected
  ListEntry<Review> get single => throw UnsupportedError(
    "[ReviewList] single にアクセスされました。",
  );

  /// [deepCopy] の実装のための内部的なコンストラクタ
  ReviewList._copy(super.list) : rec = list.first.value.rec, super.copy();

  /// 同じ情報を持つ別の新しい [ReviewList]  のインスタンスを生成する
  @override
  ReviewList<Review> get deepCopy => ReviewList._copy(toEntryList());
}

/// 週タスクのレビューのリスト
///
/// 週タスクのみ、要素数を 3 つに固定しない。
class WeeklyReviewList<Review extends ReviewBase> extends ReviewListBase<Review> {

  /// タスクの種別
  @override
  final TaskRec rec = TaskRec.week;

  WeeklyReviewList(
      List<Review> ReviewList,
      ) : super.fill(
    ReviewList.length,
        (index) => ReviewList[index],
  );

  /// [Iterable] から [ReviewList] を生成するコンストラクタ
  WeeklyReviewList.fromIterable(Iterable<Review> iterable)
      : super.fromIterable(
    iterable.length,
    iterable,
  );

  /// [deepCopy] の実装のための内部的なコンストラクタ
  WeeklyReviewList._copy(super.list) : super.copy();

  /// 同じ情報を持つ別の新しい [WeeklyReviewList]  のインスタンスを生成する
  @override
  WeeklyReviewList<Review> get deepCopy => WeeklyReviewList._copy(toEntryList());
}
