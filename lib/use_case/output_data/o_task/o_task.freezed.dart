// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'o_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ODailyTask {
  String get title;
  Date get date;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;
  bool get isFetched;

  /// Create a copy of ODailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ODailyTaskCopyWith<ODailyTask> get copyWith =>
      _$ODailyTaskCopyWithImpl<ODailyTask>(this as ODailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ODailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, date, id, isChecked, labelId, review, isFetched);

  @override
  String toString() {
    return 'ODailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched)';
  }
}

/// @nodoc
abstract mixin class $ODailyTaskCopyWith<$Res> {
  factory $ODailyTaskCopyWith(
          ODailyTask value, $Res Function(ODailyTask) _then) =
      _$ODailyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      Date date,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched});
}

/// @nodoc
class _$ODailyTaskCopyWithImpl<$Res> implements $ODailyTaskCopyWith<$Res> {
  _$ODailyTaskCopyWithImpl(this._self, this._then);

  final ODailyTask _self;
  final $Res Function(ODailyTask) _then;

  /// Create a copy of ODailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ODailyTask].
extension ODailyTaskPatterns on ODailyTask {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ODailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ODailyTask() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ODailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ODailyTask():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ODailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ODailyTask() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String title, Date date, int id, bool isChecked,
            int labelId, Review review, bool isFetched)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ODailyTask() when $default != null:
        return $default(_that.title, _that.date, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String title, Date date, int id, bool isChecked,
            int labelId, Review review, bool isFetched)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ODailyTask():
        return $default(_that.title, _that.date, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String title, Date date, int id, bool isChecked,
            int labelId, Review review, bool isFetched)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ODailyTask() when $default != null:
        return $default(_that.title, _that.date, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ODailyTask extends ODailyTask {
  const _ODailyTask(
      {required this.title,
      required this.date,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review,
      required this.isFetched})
      : super._();

  @override
  final String title;
  @override
  final Date date;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;
  @override
  final Review review;
  @override
  final bool isFetched;

  /// Create a copy of ODailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ODailyTaskCopyWith<_ODailyTask> get copyWith =>
      __$ODailyTaskCopyWithImpl<_ODailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ODailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, date, id, isChecked, labelId, review, isFetched);

  @override
  String toString() {
    return 'ODailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched)';
  }
}

/// @nodoc
abstract mixin class _$ODailyTaskCopyWith<$Res>
    implements $ODailyTaskCopyWith<$Res> {
  factory _$ODailyTaskCopyWith(
          _ODailyTask value, $Res Function(_ODailyTask) _then) =
      __$ODailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      Date date,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched});
}

/// @nodoc
class __$ODailyTaskCopyWithImpl<$Res> implements _$ODailyTaskCopyWith<$Res> {
  __$ODailyTaskCopyWithImpl(this._self, this._then);

  final _ODailyTask _self;
  final $Res Function(_ODailyTask) _then;

  /// Create a copy of ODailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
  }) {
    return _then(_ODailyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$OWeeklyTask {
  String get title;
  UniqueWeek get week;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;
  bool get isFetched;
  bool get isPlaceholder2;
  bool get shouldIdentify;
  bool get willRemainPlaceholder2;

  /// Create a copy of OWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OWeeklyTaskCopyWith<OWeeklyTask> get copyWith =>
      _$OWeeklyTaskCopyWithImpl<OWeeklyTask>(this as OWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched) &&
            (identical(other.isPlaceholder2, isPlaceholder2) ||
                other.isPlaceholder2 == isPlaceholder2) &&
            (identical(other.shouldIdentify, shouldIdentify) ||
                other.shouldIdentify == shouldIdentify) &&
            (identical(other.willRemainPlaceholder2, willRemainPlaceholder2) ||
                other.willRemainPlaceholder2 == willRemainPlaceholder2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      week,
      id,
      isChecked,
      labelId,
      review,
      isFetched,
      isPlaceholder2,
      shouldIdentify,
      willRemainPlaceholder2);

  @override
  String toString() {
    return 'OWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched, isPlaceholder2: $isPlaceholder2, shouldIdentify: $shouldIdentify, willRemainPlaceholder2: $willRemainPlaceholder2)';
  }
}

/// @nodoc
abstract mixin class $OWeeklyTaskCopyWith<$Res> {
  factory $OWeeklyTaskCopyWith(
          OWeeklyTask value, $Res Function(OWeeklyTask) _then) =
      _$OWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      UniqueWeek week,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched,
      bool isPlaceholder2,
      bool shouldIdentify,
      bool willRemainPlaceholder2});
}

/// @nodoc
class _$OWeeklyTaskCopyWithImpl<$Res> implements $OWeeklyTaskCopyWith<$Res> {
  _$OWeeklyTaskCopyWithImpl(this._self, this._then);

  final OWeeklyTask _self;
  final $Res Function(OWeeklyTask) _then;

  /// Create a copy of OWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
    Object? isPlaceholder2 = null,
    Object? shouldIdentify = null,
    Object? willRemainPlaceholder2 = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      week: null == week
          ? _self.week
          : week // ignore: cast_nullable_to_non_nullable
              as UniqueWeek,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaceholder2: null == isPlaceholder2
          ? _self.isPlaceholder2
          : isPlaceholder2 // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldIdentify: null == shouldIdentify
          ? _self.shouldIdentify
          : shouldIdentify // ignore: cast_nullable_to_non_nullable
              as bool,
      willRemainPlaceholder2: null == willRemainPlaceholder2
          ? _self.willRemainPlaceholder2
          : willRemainPlaceholder2 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [OWeeklyTask].
extension OWeeklyTaskPatterns on OWeeklyTask {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OWeeklyTask() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OWeeklyTask():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OWeeklyTask() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String title,
            UniqueWeek week,
            int id,
            bool isChecked,
            int labelId,
            Review review,
            bool isFetched,
            bool isPlaceholder2,
            bool shouldIdentify,
            bool willRemainPlaceholder2)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OWeeklyTask() when $default != null:
        return $default(
            _that.title,
            _that.week,
            _that.id,
            _that.isChecked,
            _that.labelId,
            _that.review,
            _that.isFetched,
            _that.isPlaceholder2,
            _that.shouldIdentify,
            _that.willRemainPlaceholder2);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String title,
            UniqueWeek week,
            int id,
            bool isChecked,
            int labelId,
            Review review,
            bool isFetched,
            bool isPlaceholder2,
            bool shouldIdentify,
            bool willRemainPlaceholder2)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OWeeklyTask():
        return $default(
            _that.title,
            _that.week,
            _that.id,
            _that.isChecked,
            _that.labelId,
            _that.review,
            _that.isFetched,
            _that.isPlaceholder2,
            _that.shouldIdentify,
            _that.willRemainPlaceholder2);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String title,
            UniqueWeek week,
            int id,
            bool isChecked,
            int labelId,
            Review review,
            bool isFetched,
            bool isPlaceholder2,
            bool shouldIdentify,
            bool willRemainPlaceholder2)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OWeeklyTask() when $default != null:
        return $default(
            _that.title,
            _that.week,
            _that.id,
            _that.isChecked,
            _that.labelId,
            _that.review,
            _that.isFetched,
            _that.isPlaceholder2,
            _that.shouldIdentify,
            _that.willRemainPlaceholder2);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OWeeklyTask extends OWeeklyTask {
  const _OWeeklyTask(
      {required this.title,
      required this.week,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review,
      required this.isFetched,
      required this.isPlaceholder2,
      required this.shouldIdentify,
      required this.willRemainPlaceholder2})
      : super._();

  @override
  final String title;
  @override
  final UniqueWeek week;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;
  @override
  final Review review;
  @override
  final bool isFetched;
  @override
  final bool isPlaceholder2;
  @override
  final bool shouldIdentify;
  @override
  final bool willRemainPlaceholder2;

  /// Create a copy of OWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OWeeklyTaskCopyWith<_OWeeklyTask> get copyWith =>
      __$OWeeklyTaskCopyWithImpl<_OWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched) &&
            (identical(other.isPlaceholder2, isPlaceholder2) ||
                other.isPlaceholder2 == isPlaceholder2) &&
            (identical(other.shouldIdentify, shouldIdentify) ||
                other.shouldIdentify == shouldIdentify) &&
            (identical(other.willRemainPlaceholder2, willRemainPlaceholder2) ||
                other.willRemainPlaceholder2 == willRemainPlaceholder2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      week,
      id,
      isChecked,
      labelId,
      review,
      isFetched,
      isPlaceholder2,
      shouldIdentify,
      willRemainPlaceholder2);

  @override
  String toString() {
    return 'OWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched, isPlaceholder2: $isPlaceholder2, shouldIdentify: $shouldIdentify, willRemainPlaceholder2: $willRemainPlaceholder2)';
  }
}

/// @nodoc
abstract mixin class _$OWeeklyTaskCopyWith<$Res>
    implements $OWeeklyTaskCopyWith<$Res> {
  factory _$OWeeklyTaskCopyWith(
          _OWeeklyTask value, $Res Function(_OWeeklyTask) _then) =
      __$OWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      UniqueWeek week,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched,
      bool isPlaceholder2,
      bool shouldIdentify,
      bool willRemainPlaceholder2});
}

/// @nodoc
class __$OWeeklyTaskCopyWithImpl<$Res> implements _$OWeeklyTaskCopyWith<$Res> {
  __$OWeeklyTaskCopyWithImpl(this._self, this._then);

  final _OWeeklyTask _self;
  final $Res Function(_OWeeklyTask) _then;

  /// Create a copy of OWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
    Object? isPlaceholder2 = null,
    Object? shouldIdentify = null,
    Object? willRemainPlaceholder2 = null,
  }) {
    return _then(_OWeeklyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      week: null == week
          ? _self.week
          : week // ignore: cast_nullable_to_non_nullable
              as UniqueWeek,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaceholder2: null == isPlaceholder2
          ? _self.isPlaceholder2
          : isPlaceholder2 // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldIdentify: null == shouldIdentify
          ? _self.shouldIdentify
          : shouldIdentify // ignore: cast_nullable_to_non_nullable
              as bool,
      willRemainPlaceholder2: null == willRemainPlaceholder2
          ? _self.willRemainPlaceholder2
          : willRemainPlaceholder2 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$OMonthlyTask {
  String get title;
  Month get month;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;
  bool get isFetched;

  /// Create a copy of OMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OMonthlyTaskCopyWith<OMonthlyTask> get copyWith =>
      _$OMonthlyTaskCopyWithImpl<OMonthlyTask>(
          this as OMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, month, id, isChecked, labelId, review, isFetched);

  @override
  String toString() {
    return 'OMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched)';
  }
}

/// @nodoc
abstract mixin class $OMonthlyTaskCopyWith<$Res> {
  factory $OMonthlyTaskCopyWith(
          OMonthlyTask value, $Res Function(OMonthlyTask) _then) =
      _$OMonthlyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      Month month,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched});
}

/// @nodoc
class _$OMonthlyTaskCopyWithImpl<$Res> implements $OMonthlyTaskCopyWith<$Res> {
  _$OMonthlyTaskCopyWithImpl(this._self, this._then);

  final OMonthlyTask _self;
  final $Res Function(OMonthlyTask) _then;

  /// Create a copy of OMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as Month,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [OMonthlyTask].
extension OMonthlyTaskPatterns on OMonthlyTask {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OMonthlyTask() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OMonthlyTask():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OMonthlyTask() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String title, Month month, int id, bool isChecked,
            int labelId, Review review, bool isFetched)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OMonthlyTask() when $default != null:
        return $default(_that.title, _that.month, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String title, Month month, int id, bool isChecked,
            int labelId, Review review, bool isFetched)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OMonthlyTask():
        return $default(_that.title, _that.month, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String title, Month month, int id, bool isChecked,
            int labelId, Review review, bool isFetched)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OMonthlyTask() when $default != null:
        return $default(_that.title, _that.month, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OMonthlyTask extends OMonthlyTask {
  const _OMonthlyTask(
      {required this.title,
      required this.month,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review,
      required this.isFetched})
      : super._();

  @override
  final String title;
  @override
  final Month month;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;
  @override
  final Review review;
  @override
  final bool isFetched;

  /// Create a copy of OMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OMonthlyTaskCopyWith<_OMonthlyTask> get copyWith =>
      __$OMonthlyTaskCopyWithImpl<_OMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, month, id, isChecked, labelId, review, isFetched);

  @override
  String toString() {
    return 'OMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched)';
  }
}

/// @nodoc
abstract mixin class _$OMonthlyTaskCopyWith<$Res>
    implements $OMonthlyTaskCopyWith<$Res> {
  factory _$OMonthlyTaskCopyWith(
          _OMonthlyTask value, $Res Function(_OMonthlyTask) _then) =
      __$OMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      Month month,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched});
}

/// @nodoc
class __$OMonthlyTaskCopyWithImpl<$Res>
    implements _$OMonthlyTaskCopyWith<$Res> {
  __$OMonthlyTaskCopyWithImpl(this._self, this._then);

  final _OMonthlyTask _self;
  final $Res Function(_OMonthlyTask) _then;

  /// Create a copy of OMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
  }) {
    return _then(_OMonthlyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as Month,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$OYearlyTask {
  String get title;
  int get year;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;
  bool get isFetched;

  /// Create a copy of OYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OYearlyTaskCopyWith<OYearlyTask> get copyWith =>
      _$OYearlyTaskCopyWithImpl<OYearlyTask>(this as OYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OYearlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, year, id, isChecked, labelId, review, isFetched);

  @override
  String toString() {
    return 'OYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched)';
  }
}

/// @nodoc
abstract mixin class $OYearlyTaskCopyWith<$Res> {
  factory $OYearlyTaskCopyWith(
          OYearlyTask value, $Res Function(OYearlyTask) _then) =
      _$OYearlyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int year,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched});
}

/// @nodoc
class _$OYearlyTaskCopyWithImpl<$Res> implements $OYearlyTaskCopyWith<$Res> {
  _$OYearlyTaskCopyWithImpl(this._self, this._then);

  final OYearlyTask _self;
  final $Res Function(OYearlyTask) _then;

  /// Create a copy of OYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [OYearlyTask].
extension OYearlyTaskPatterns on OYearlyTask {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OYearlyTask() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OYearlyTask():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OYearlyTask() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String title, int year, int id, bool isChecked,
            int labelId, Review review, bool isFetched)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OYearlyTask() when $default != null:
        return $default(_that.title, _that.year, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String title, int year, int id, bool isChecked,
            int labelId, Review review, bool isFetched)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OYearlyTask():
        return $default(_that.title, _that.year, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String title, int year, int id, bool isChecked,
            int labelId, Review review, bool isFetched)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OYearlyTask() when $default != null:
        return $default(_that.title, _that.year, _that.id, _that.isChecked,
            _that.labelId, _that.review, _that.isFetched);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OYearlyTask extends OYearlyTask {
  const _OYearlyTask(
      {required this.title,
      required this.year,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review,
      required this.isFetched})
      : super._();

  @override
  final String title;
  @override
  final int year;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;
  @override
  final Review review;
  @override
  final bool isFetched;

  /// Create a copy of OYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OYearlyTaskCopyWith<_OYearlyTask> get copyWith =>
      __$OYearlyTaskCopyWithImpl<_OYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OYearlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isFetched, isFetched) ||
                other.isFetched == isFetched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, year, id, isChecked, labelId, review, isFetched);

  @override
  String toString() {
    return 'OYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review, isFetched: $isFetched)';
  }
}

/// @nodoc
abstract mixin class _$OYearlyTaskCopyWith<$Res>
    implements $OYearlyTaskCopyWith<$Res> {
  factory _$OYearlyTaskCopyWith(
          _OYearlyTask value, $Res Function(_OYearlyTask) _then) =
      __$OYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int year,
      int id,
      bool isChecked,
      int labelId,
      Review review,
      bool isFetched});
}

/// @nodoc
class __$OYearlyTaskCopyWithImpl<$Res> implements _$OYearlyTaskCopyWith<$Res> {
  __$OYearlyTaskCopyWithImpl(this._self, this._then);

  final _OYearlyTask _self;
  final $Res Function(_OYearlyTask) _then;

  /// Create a copy of OYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
    Object? review = null,
    Object? isFetched = null,
  }) {
    return _then(_OYearlyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      isFetched: null == isFetched
          ? _self.isFetched
          : isFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
