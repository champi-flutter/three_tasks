// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'i_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IDailyTask {
  String get title;
  Date get date;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;

  /// Create a copy of IDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IDailyTaskCopyWith<IDailyTask> get copyWith =>
      _$IDailyTaskCopyWithImpl<IDailyTask>(this as IDailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, date, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class $IDailyTaskCopyWith<$Res> {
  factory $IDailyTaskCopyWith(
          IDailyTask value, $Res Function(IDailyTask) _then) =
      _$IDailyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      Date date,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class _$IDailyTaskCopyWithImpl<$Res> implements $IDailyTaskCopyWith<$Res> {
  _$IDailyTaskCopyWithImpl(this._self, this._then);

  final IDailyTask _self;
  final $Res Function(IDailyTask) _then;

  /// Create a copy of IDailyTask
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
    ));
  }
}

/// Adds pattern-matching-related methods to [IDailyTask].
extension IDailyTaskPatterns on IDailyTask {
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
    TResult Function(_IDailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IDailyTask() when $default != null:
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
    TResult Function(_IDailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IDailyTask():
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
    TResult? Function(_IDailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IDailyTask() when $default != null:
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
            int labelId, Review review)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IDailyTask() when $default != null:
        return $default(_that.title, _that.date, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
            int labelId, Review review)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IDailyTask():
        return $default(_that.title, _that.date, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
            int labelId, Review review)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IDailyTask() when $default != null:
        return $default(_that.title, _that.date, _that.id, _that.isChecked,
            _that.labelId, _that.review);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IDailyTask extends IDailyTask {
  const _IDailyTask(
      {required this.title,
      required this.date,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review})
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

  /// Create a copy of IDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IDailyTaskCopyWith<_IDailyTask> get copyWith =>
      __$IDailyTaskCopyWithImpl<_IDailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, date, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class _$IDailyTaskCopyWith<$Res>
    implements $IDailyTaskCopyWith<$Res> {
  factory _$IDailyTaskCopyWith(
          _IDailyTask value, $Res Function(_IDailyTask) _then) =
      __$IDailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      Date date,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class __$IDailyTaskCopyWithImpl<$Res> implements _$IDailyTaskCopyWith<$Res> {
  __$IDailyTaskCopyWithImpl(this._self, this._then);

  final _IDailyTask _self;
  final $Res Function(_IDailyTask) _then;

  /// Create a copy of IDailyTask
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
  }) {
    return _then(_IDailyTask(
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
    ));
  }
}

/// @nodoc
mixin _$IWeeklyTask {
  String get title;
  UniqueWeek get week;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;

  /// Create a copy of IWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IWeeklyTaskCopyWith<IWeeklyTask> get copyWith =>
      _$IWeeklyTaskCopyWithImpl<IWeeklyTask>(this as IWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, week, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class $IWeeklyTaskCopyWith<$Res> {
  factory $IWeeklyTaskCopyWith(
          IWeeklyTask value, $Res Function(IWeeklyTask) _then) =
      _$IWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      UniqueWeek week,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class _$IWeeklyTaskCopyWithImpl<$Res> implements $IWeeklyTaskCopyWith<$Res> {
  _$IWeeklyTaskCopyWithImpl(this._self, this._then);

  final IWeeklyTask _self;
  final $Res Function(IWeeklyTask) _then;

  /// Create a copy of IWeeklyTask
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
    ));
  }
}

/// Adds pattern-matching-related methods to [IWeeklyTask].
extension IWeeklyTaskPatterns on IWeeklyTask {
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
    TResult Function(_IWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IWeeklyTask() when $default != null:
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
    TResult Function(_IWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IWeeklyTask():
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
    TResult? Function(_IWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IWeeklyTask() when $default != null:
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
    TResult Function(String title, UniqueWeek week, int id, bool isChecked,
            int labelId, Review review)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IWeeklyTask() when $default != null:
        return $default(_that.title, _that.week, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
    TResult Function(String title, UniqueWeek week, int id, bool isChecked,
            int labelId, Review review)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IWeeklyTask():
        return $default(_that.title, _that.week, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
    TResult? Function(String title, UniqueWeek week, int id, bool isChecked,
            int labelId, Review review)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IWeeklyTask() when $default != null:
        return $default(_that.title, _that.week, _that.id, _that.isChecked,
            _that.labelId, _that.review);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IWeeklyTask extends IWeeklyTask {
  const _IWeeklyTask(
      {required this.title,
      required this.week,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review})
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

  /// Create a copy of IWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IWeeklyTaskCopyWith<_IWeeklyTask> get copyWith =>
      __$IWeeklyTaskCopyWithImpl<_IWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, week, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class _$IWeeklyTaskCopyWith<$Res>
    implements $IWeeklyTaskCopyWith<$Res> {
  factory _$IWeeklyTaskCopyWith(
          _IWeeklyTask value, $Res Function(_IWeeklyTask) _then) =
      __$IWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      UniqueWeek week,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class __$IWeeklyTaskCopyWithImpl<$Res> implements _$IWeeklyTaskCopyWith<$Res> {
  __$IWeeklyTaskCopyWithImpl(this._self, this._then);

  final _IWeeklyTask _self;
  final $Res Function(_IWeeklyTask) _then;

  /// Create a copy of IWeeklyTask
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
  }) {
    return _then(_IWeeklyTask(
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
    ));
  }
}

/// @nodoc
mixin _$IMonthlyTask {
  String get title;
  Month get month;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;

  /// Create a copy of IMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IMonthlyTaskCopyWith<IMonthlyTask> get copyWith =>
      _$IMonthlyTaskCopyWithImpl<IMonthlyTask>(
          this as IMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, month, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class $IMonthlyTaskCopyWith<$Res> {
  factory $IMonthlyTaskCopyWith(
          IMonthlyTask value, $Res Function(IMonthlyTask) _then) =
      _$IMonthlyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      Month month,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class _$IMonthlyTaskCopyWithImpl<$Res> implements $IMonthlyTaskCopyWith<$Res> {
  _$IMonthlyTaskCopyWithImpl(this._self, this._then);

  final IMonthlyTask _self;
  final $Res Function(IMonthlyTask) _then;

  /// Create a copy of IMonthlyTask
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
    ));
  }
}

/// Adds pattern-matching-related methods to [IMonthlyTask].
extension IMonthlyTaskPatterns on IMonthlyTask {
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
    TResult Function(_IMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IMonthlyTask() when $default != null:
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
    TResult Function(_IMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IMonthlyTask():
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
    TResult? Function(_IMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IMonthlyTask() when $default != null:
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
            int labelId, Review review)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IMonthlyTask() when $default != null:
        return $default(_that.title, _that.month, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
            int labelId, Review review)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IMonthlyTask():
        return $default(_that.title, _that.month, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
            int labelId, Review review)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IMonthlyTask() when $default != null:
        return $default(_that.title, _that.month, _that.id, _that.isChecked,
            _that.labelId, _that.review);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IMonthlyTask extends IMonthlyTask {
  const _IMonthlyTask(
      {required this.title,
      required this.month,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review})
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

  /// Create a copy of IMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IMonthlyTaskCopyWith<_IMonthlyTask> get copyWith =>
      __$IMonthlyTaskCopyWithImpl<_IMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, month, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class _$IMonthlyTaskCopyWith<$Res>
    implements $IMonthlyTaskCopyWith<$Res> {
  factory _$IMonthlyTaskCopyWith(
          _IMonthlyTask value, $Res Function(_IMonthlyTask) _then) =
      __$IMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      Month month,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class __$IMonthlyTaskCopyWithImpl<$Res>
    implements _$IMonthlyTaskCopyWith<$Res> {
  __$IMonthlyTaskCopyWithImpl(this._self, this._then);

  final _IMonthlyTask _self;
  final $Res Function(_IMonthlyTask) _then;

  /// Create a copy of IMonthlyTask
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
  }) {
    return _then(_IMonthlyTask(
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
    ));
  }
}

/// @nodoc
mixin _$IYearlyTask {
  String get title;
  int get year;
  int get id;
  bool get isChecked;
  int get labelId;
  Review get review;

  /// Create a copy of IYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IYearlyTaskCopyWith<IYearlyTask> get copyWith =>
      _$IYearlyTaskCopyWithImpl<IYearlyTask>(this as IYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IYearlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, year, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class $IYearlyTaskCopyWith<$Res> {
  factory $IYearlyTaskCopyWith(
          IYearlyTask value, $Res Function(IYearlyTask) _then) =
      _$IYearlyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int year,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class _$IYearlyTaskCopyWithImpl<$Res> implements $IYearlyTaskCopyWith<$Res> {
  _$IYearlyTaskCopyWithImpl(this._self, this._then);

  final IYearlyTask _self;
  final $Res Function(IYearlyTask) _then;

  /// Create a copy of IYearlyTask
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
    ));
  }
}

/// Adds pattern-matching-related methods to [IYearlyTask].
extension IYearlyTaskPatterns on IYearlyTask {
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
    TResult Function(_IYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IYearlyTask() when $default != null:
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
    TResult Function(_IYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IYearlyTask():
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
    TResult? Function(_IYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IYearlyTask() when $default != null:
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
            int labelId, Review review)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IYearlyTask() when $default != null:
        return $default(_that.title, _that.year, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
            int labelId, Review review)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IYearlyTask():
        return $default(_that.title, _that.year, _that.id, _that.isChecked,
            _that.labelId, _that.review);
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
            int labelId, Review review)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IYearlyTask() when $default != null:
        return $default(_that.title, _that.year, _that.id, _that.isChecked,
            _that.labelId, _that.review);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IYearlyTask extends IYearlyTask {
  const _IYearlyTask(
      {required this.title,
      required this.year,
      required this.id,
      required this.isChecked,
      required this.labelId,
      required this.review})
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

  /// Create a copy of IYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IYearlyTaskCopyWith<_IYearlyTask> get copyWith =>
      __$IYearlyTaskCopyWithImpl<_IYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IYearlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, year, id, isChecked, labelId, review);

  @override
  String toString() {
    return 'IYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId, review: $review)';
  }
}

/// @nodoc
abstract mixin class _$IYearlyTaskCopyWith<$Res>
    implements $IYearlyTaskCopyWith<$Res> {
  factory _$IYearlyTaskCopyWith(
          _IYearlyTask value, $Res Function(_IYearlyTask) _then) =
      __$IYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int year,
      int id,
      bool isChecked,
      int labelId,
      Review review});
}

/// @nodoc
class __$IYearlyTaskCopyWithImpl<$Res> implements _$IYearlyTaskCopyWith<$Res> {
  __$IYearlyTaskCopyWithImpl(this._self, this._then);

  final _IYearlyTask _self;
  final $Res Function(_IYearlyTask) _then;

  /// Create a copy of IYearlyTask
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
  }) {
    return _then(_IYearlyTask(
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
    ));
  }
}

// dart format on
