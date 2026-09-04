// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'f_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FDailyTask {
  String get title;
  Date get date;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of FDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FDailyTaskCopyWith<FDailyTask> get copyWith =>
      _$FDailyTaskCopyWithImpl<FDailyTask>(this as FDailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, date, id, isChecked, labelId);

  @override
  String toString() {
    return 'FDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $FDailyTaskCopyWith<$Res> {
  factory $FDailyTaskCopyWith(
          FDailyTask value, $Res Function(FDailyTask) _then) =
      _$FDailyTaskCopyWithImpl;
  @useResult
  $Res call({String title, Date date, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$FDailyTaskCopyWithImpl<$Res> implements $FDailyTaskCopyWith<$Res> {
  _$FDailyTaskCopyWithImpl(this._self, this._then);

  final FDailyTask _self;
  final $Res Function(FDailyTask) _then;

  /// Create a copy of FDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [FDailyTask].
extension FDailyTaskPatterns on FDailyTask {
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
    TResult Function(_FDailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FDailyTask() when $default != null:
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
    TResult Function(_FDailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FDailyTask():
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
    TResult? Function(_FDailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FDailyTask() when $default != null:
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
            String title, Date date, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FDailyTask() when $default != null:
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
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
            String title, Date date, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FDailyTask():
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
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
            String title, Date date, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FDailyTask() when $default != null:
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FDailyTask extends FDailyTask {
  const _FDailyTask(
      {required this.title,
      required this.date,
      required this.id,
      required this.isChecked,
      required this.labelId})
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

  /// Create a copy of FDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FDailyTaskCopyWith<_FDailyTask> get copyWith =>
      __$FDailyTaskCopyWithImpl<_FDailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, date, id, isChecked, labelId);

  @override
  String toString() {
    return 'FDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$FDailyTaskCopyWith<$Res>
    implements $FDailyTaskCopyWith<$Res> {
  factory _$FDailyTaskCopyWith(
          _FDailyTask value, $Res Function(_FDailyTask) _then) =
      __$FDailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, Date date, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$FDailyTaskCopyWithImpl<$Res> implements _$FDailyTaskCopyWith<$Res> {
  __$FDailyTaskCopyWithImpl(this._self, this._then);

  final _FDailyTask _self;
  final $Res Function(_FDailyTask) _then;

  /// Create a copy of FDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_FDailyTask(
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
    ));
  }
}

/// @nodoc
mixin _$FWeeklyTask {
  String get title;
  UniqueWeek get week;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of FWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FWeeklyTaskCopyWith<FWeeklyTask> get copyWith =>
      _$FWeeklyTaskCopyWithImpl<FWeeklyTask>(this as FWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, week, id, isChecked, labelId);

  @override
  String toString() {
    return 'FWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $FWeeklyTaskCopyWith<$Res> {
  factory $FWeeklyTaskCopyWith(
          FWeeklyTask value, $Res Function(FWeeklyTask) _then) =
      _$FWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title, UniqueWeek week, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$FWeeklyTaskCopyWithImpl<$Res> implements $FWeeklyTaskCopyWith<$Res> {
  _$FWeeklyTaskCopyWithImpl(this._self, this._then);

  final FWeeklyTask _self;
  final $Res Function(FWeeklyTask) _then;

  /// Create a copy of FWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [FWeeklyTask].
extension FWeeklyTaskPatterns on FWeeklyTask {
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
    TResult Function(_FWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FWeeklyTask() when $default != null:
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
    TResult Function(_FWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FWeeklyTask():
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
    TResult? Function(_FWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FWeeklyTask() when $default != null:
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
            String title, UniqueWeek week, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FWeeklyTask() when $default != null:
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
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
            String title, UniqueWeek week, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FWeeklyTask():
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
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
            String title, UniqueWeek week, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FWeeklyTask() when $default != null:
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FWeeklyTask extends FWeeklyTask {
  const _FWeeklyTask(
      {required this.title,
      required this.week,
      required this.id,
      required this.isChecked,
      required this.labelId})
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

  /// Create a copy of FWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FWeeklyTaskCopyWith<_FWeeklyTask> get copyWith =>
      __$FWeeklyTaskCopyWithImpl<_FWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, week, id, isChecked, labelId);

  @override
  String toString() {
    return 'FWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$FWeeklyTaskCopyWith<$Res>
    implements $FWeeklyTaskCopyWith<$Res> {
  factory _$FWeeklyTaskCopyWith(
          _FWeeklyTask value, $Res Function(_FWeeklyTask) _then) =
      __$FWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title, UniqueWeek week, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$FWeeklyTaskCopyWithImpl<$Res> implements _$FWeeklyTaskCopyWith<$Res> {
  __$FWeeklyTaskCopyWithImpl(this._self, this._then);

  final _FWeeklyTask _self;
  final $Res Function(_FWeeklyTask) _then;

  /// Create a copy of FWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_FWeeklyTask(
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
    ));
  }
}

/// @nodoc
mixin _$FMonthlyTask {
  String get title;
  Month get month;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of FMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FMonthlyTaskCopyWith<FMonthlyTask> get copyWith =>
      _$FMonthlyTaskCopyWithImpl<FMonthlyTask>(
          this as FMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, month, id, isChecked, labelId);

  @override
  String toString() {
    return 'FMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $FMonthlyTaskCopyWith<$Res> {
  factory $FMonthlyTaskCopyWith(
          FMonthlyTask value, $Res Function(FMonthlyTask) _then) =
      _$FMonthlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, Month month, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$FMonthlyTaskCopyWithImpl<$Res> implements $FMonthlyTaskCopyWith<$Res> {
  _$FMonthlyTaskCopyWithImpl(this._self, this._then);

  final FMonthlyTask _self;
  final $Res Function(FMonthlyTask) _then;

  /// Create a copy of FMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [FMonthlyTask].
extension FMonthlyTaskPatterns on FMonthlyTask {
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
    TResult Function(_FMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FMonthlyTask() when $default != null:
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
    TResult Function(_FMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FMonthlyTask():
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
    TResult? Function(_FMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FMonthlyTask() when $default != null:
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
            String title, Month month, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FMonthlyTask() when $default != null:
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
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
            String title, Month month, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FMonthlyTask():
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
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
            String title, Month month, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FMonthlyTask() when $default != null:
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FMonthlyTask extends FMonthlyTask {
  const _FMonthlyTask(
      {required this.title,
      required this.month,
      required this.id,
      required this.isChecked,
      required this.labelId})
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

  /// Create a copy of FMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FMonthlyTaskCopyWith<_FMonthlyTask> get copyWith =>
      __$FMonthlyTaskCopyWithImpl<_FMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, month, id, isChecked, labelId);

  @override
  String toString() {
    return 'FMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$FMonthlyTaskCopyWith<$Res>
    implements $FMonthlyTaskCopyWith<$Res> {
  factory _$FMonthlyTaskCopyWith(
          _FMonthlyTask value, $Res Function(_FMonthlyTask) _then) =
      __$FMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, Month month, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$FMonthlyTaskCopyWithImpl<$Res>
    implements _$FMonthlyTaskCopyWith<$Res> {
  __$FMonthlyTaskCopyWithImpl(this._self, this._then);

  final _FMonthlyTask _self;
  final $Res Function(_FMonthlyTask) _then;

  /// Create a copy of FMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_FMonthlyTask(
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
    ));
  }
}

/// @nodoc
mixin _$FYearlyTask {
  String get title;
  int get year;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of FYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FYearlyTaskCopyWith<FYearlyTask> get copyWith =>
      _$FYearlyTaskCopyWithImpl<FYearlyTask>(this as FYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FYearlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, year, id, isChecked, labelId);

  @override
  String toString() {
    return 'FYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $FYearlyTaskCopyWith<$Res> {
  factory $FYearlyTaskCopyWith(
          FYearlyTask value, $Res Function(FYearlyTask) _then) =
      _$FYearlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, int year, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$FYearlyTaskCopyWithImpl<$Res> implements $FYearlyTaskCopyWith<$Res> {
  _$FYearlyTaskCopyWithImpl(this._self, this._then);

  final FYearlyTask _self;
  final $Res Function(FYearlyTask) _then;

  /// Create a copy of FYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [FYearlyTask].
extension FYearlyTaskPatterns on FYearlyTask {
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
    TResult Function(_FYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FYearlyTask() when $default != null:
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
    TResult Function(_FYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FYearlyTask():
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
    TResult? Function(_FYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FYearlyTask() when $default != null:
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
            String title, int year, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FYearlyTask() when $default != null:
        return $default(
            _that.title, _that.year, _that.id, _that.isChecked, _that.labelId);
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
            String title, int year, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FYearlyTask():
        return $default(
            _that.title, _that.year, _that.id, _that.isChecked, _that.labelId);
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
            String title, int year, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FYearlyTask() when $default != null:
        return $default(
            _that.title, _that.year, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FYearlyTask extends FYearlyTask {
  const _FYearlyTask(
      {required this.title,
      required this.year,
      required this.id,
      required this.isChecked,
      required this.labelId})
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

  /// Create a copy of FYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FYearlyTaskCopyWith<_FYearlyTask> get copyWith =>
      __$FYearlyTaskCopyWithImpl<_FYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FYearlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, year, id, isChecked, labelId);

  @override
  String toString() {
    return 'FYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$FYearlyTaskCopyWith<$Res>
    implements $FYearlyTaskCopyWith<$Res> {
  factory _$FYearlyTaskCopyWith(
          _FYearlyTask value, $Res Function(_FYearlyTask) _then) =
      __$FYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int year, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$FYearlyTaskCopyWithImpl<$Res> implements _$FYearlyTaskCopyWith<$Res> {
  __$FYearlyTaskCopyWithImpl(this._self, this._then);

  final _FYearlyTask _self;
  final $Res Function(_FYearlyTask) _then;

  /// Create a copy of FYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_FYearlyTask(
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
    ));
  }
}

// dart format on
