// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 's_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SDailyTask {
  String? get title;
  Date get date;
  int get id;
  bool? get isChecked;
  int? get labelId;

  /// Create a copy of SDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SDailyTaskCopyWith<SDailyTask> get copyWith =>
      _$SDailyTaskCopyWithImpl<SDailyTask>(this as SDailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SDailyTask &&
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
    return 'SDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $SDailyTaskCopyWith<$Res> {
  factory $SDailyTaskCopyWith(
          SDailyTask value, $Res Function(SDailyTask) _then) =
      _$SDailyTaskCopyWithImpl;
  @useResult
  $Res call({String? title, Date date, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class _$SDailyTaskCopyWithImpl<$Res> implements $SDailyTaskCopyWith<$Res> {
  _$SDailyTaskCopyWithImpl(this._self, this._then);

  final SDailyTask _self;
  final $Res Function(SDailyTask) _then;

  /// Create a copy of SDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? date = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SDailyTask].
extension SDailyTaskPatterns on SDailyTask {
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
    TResult Function(_SDailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SDailyTask() when $default != null:
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
    TResult Function(_SDailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SDailyTask():
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
    TResult? Function(_SDailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SDailyTask() when $default != null:
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
            String? title, Date date, int id, bool? isChecked, int? labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SDailyTask() when $default != null:
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
            String? title, Date date, int id, bool? isChecked, int? labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SDailyTask():
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
            String? title, Date date, int id, bool? isChecked, int? labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SDailyTask() when $default != null:
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SDailyTask extends SDailyTask {
  const _SDailyTask(
      {required this.title,
      required this.date,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? title;
  @override
  final Date date;
  @override
  final int id;
  @override
  final bool? isChecked;
  @override
  final int? labelId;

  /// Create a copy of SDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SDailyTaskCopyWith<_SDailyTask> get copyWith =>
      __$SDailyTaskCopyWithImpl<_SDailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SDailyTask &&
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
    return 'SDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$SDailyTaskCopyWith<$Res>
    implements $SDailyTaskCopyWith<$Res> {
  factory _$SDailyTaskCopyWith(
          _SDailyTask value, $Res Function(_SDailyTask) _then) =
      __$SDailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, Date date, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class __$SDailyTaskCopyWithImpl<$Res> implements _$SDailyTaskCopyWith<$Res> {
  __$SDailyTaskCopyWithImpl(this._self, this._then);

  final _SDailyTask _self;
  final $Res Function(_SDailyTask) _then;

  /// Create a copy of SDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? date = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_SDailyTask(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$SWeeklyTask {
  String? get title;
  UniqueWeek get week;
  int get id;
  bool? get isChecked;
  int? get labelId;

  /// Create a copy of SWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SWeeklyTaskCopyWith<SWeeklyTask> get copyWith =>
      _$SWeeklyTaskCopyWithImpl<SWeeklyTask>(this as SWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SWeeklyTask &&
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
    return 'SWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $SWeeklyTaskCopyWith<$Res> {
  factory $SWeeklyTaskCopyWith(
          SWeeklyTask value, $Res Function(SWeeklyTask) _then) =
      _$SWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String? title, UniqueWeek week, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class _$SWeeklyTaskCopyWithImpl<$Res> implements $SWeeklyTaskCopyWith<$Res> {
  _$SWeeklyTaskCopyWithImpl(this._self, this._then);

  final SWeeklyTask _self;
  final $Res Function(SWeeklyTask) _then;

  /// Create a copy of SWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? week = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      week: null == week
          ? _self.week
          : week // ignore: cast_nullable_to_non_nullable
              as UniqueWeek,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SWeeklyTask].
extension SWeeklyTaskPatterns on SWeeklyTask {
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
    TResult Function(_SWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SWeeklyTask() when $default != null:
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
    TResult Function(_SWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SWeeklyTask():
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
    TResult? Function(_SWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SWeeklyTask() when $default != null:
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
    TResult Function(String? title, UniqueWeek week, int id, bool? isChecked,
            int? labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SWeeklyTask() when $default != null:
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
    TResult Function(String? title, UniqueWeek week, int id, bool? isChecked,
            int? labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SWeeklyTask():
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
    TResult? Function(String? title, UniqueWeek week, int id, bool? isChecked,
            int? labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SWeeklyTask() when $default != null:
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SWeeklyTask extends SWeeklyTask {
  const _SWeeklyTask(
      {required this.title,
      required this.week,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? title;
  @override
  final UniqueWeek week;
  @override
  final int id;
  @override
  final bool? isChecked;
  @override
  final int? labelId;

  /// Create a copy of SWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SWeeklyTaskCopyWith<_SWeeklyTask> get copyWith =>
      __$SWeeklyTaskCopyWithImpl<_SWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SWeeklyTask &&
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
    return 'SWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$SWeeklyTaskCopyWith<$Res>
    implements $SWeeklyTaskCopyWith<$Res> {
  factory _$SWeeklyTaskCopyWith(
          _SWeeklyTask value, $Res Function(_SWeeklyTask) _then) =
      __$SWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title, UniqueWeek week, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class __$SWeeklyTaskCopyWithImpl<$Res> implements _$SWeeklyTaskCopyWith<$Res> {
  __$SWeeklyTaskCopyWithImpl(this._self, this._then);

  final _SWeeklyTask _self;
  final $Res Function(_SWeeklyTask) _then;

  /// Create a copy of SWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? week = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_SWeeklyTask(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      week: null == week
          ? _self.week
          : week // ignore: cast_nullable_to_non_nullable
              as UniqueWeek,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$SMonthlyTask {
  String? get title;
  Month get month;
  int get id;
  bool? get isChecked;
  int? get labelId;

  /// Create a copy of SMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SMonthlyTaskCopyWith<SMonthlyTask> get copyWith =>
      _$SMonthlyTaskCopyWithImpl<SMonthlyTask>(
          this as SMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SMonthlyTask &&
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
    return 'SMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $SMonthlyTaskCopyWith<$Res> {
  factory $SMonthlyTaskCopyWith(
          SMonthlyTask value, $Res Function(SMonthlyTask) _then) =
      _$SMonthlyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String? title, Month month, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class _$SMonthlyTaskCopyWithImpl<$Res> implements $SMonthlyTaskCopyWith<$Res> {
  _$SMonthlyTaskCopyWithImpl(this._self, this._then);

  final SMonthlyTask _self;
  final $Res Function(SMonthlyTask) _then;

  /// Create a copy of SMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? month = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as Month,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SMonthlyTask].
extension SMonthlyTaskPatterns on SMonthlyTask {
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
    TResult Function(_SMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SMonthlyTask() when $default != null:
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
    TResult Function(_SMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SMonthlyTask():
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
    TResult? Function(_SMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SMonthlyTask() when $default != null:
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
            String? title, Month month, int id, bool? isChecked, int? labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SMonthlyTask() when $default != null:
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
            String? title, Month month, int id, bool? isChecked, int? labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SMonthlyTask():
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
            String? title, Month month, int id, bool? isChecked, int? labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SMonthlyTask() when $default != null:
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SMonthlyTask extends SMonthlyTask {
  const _SMonthlyTask(
      {required this.title,
      required this.month,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? title;
  @override
  final Month month;
  @override
  final int id;
  @override
  final bool? isChecked;
  @override
  final int? labelId;

  /// Create a copy of SMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SMonthlyTaskCopyWith<_SMonthlyTask> get copyWith =>
      __$SMonthlyTaskCopyWithImpl<_SMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SMonthlyTask &&
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
    return 'SMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$SMonthlyTaskCopyWith<$Res>
    implements $SMonthlyTaskCopyWith<$Res> {
  factory _$SMonthlyTaskCopyWith(
          _SMonthlyTask value, $Res Function(_SMonthlyTask) _then) =
      __$SMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title, Month month, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class __$SMonthlyTaskCopyWithImpl<$Res>
    implements _$SMonthlyTaskCopyWith<$Res> {
  __$SMonthlyTaskCopyWithImpl(this._self, this._then);

  final _SMonthlyTask _self;
  final $Res Function(_SMonthlyTask) _then;

  /// Create a copy of SMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? month = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_SMonthlyTask(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as Month,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$SYearlyTask {
  String? get title;
  int get year;
  int get id;
  bool? get isChecked;
  int? get labelId;

  /// Create a copy of SYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SYearlyTaskCopyWith<SYearlyTask> get copyWith =>
      _$SYearlyTaskCopyWithImpl<SYearlyTask>(this as SYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SYearlyTask &&
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
    return 'SYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $SYearlyTaskCopyWith<$Res> {
  factory $SYearlyTaskCopyWith(
          SYearlyTask value, $Res Function(SYearlyTask) _then) =
      _$SYearlyTaskCopyWithImpl;
  @useResult
  $Res call({String? title, int year, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class _$SYearlyTaskCopyWithImpl<$Res> implements $SYearlyTaskCopyWith<$Res> {
  _$SYearlyTaskCopyWithImpl(this._self, this._then);

  final SYearlyTask _self;
  final $Res Function(SYearlyTask) _then;

  /// Create a copy of SYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? year = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SYearlyTask].
extension SYearlyTaskPatterns on SYearlyTask {
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
    TResult Function(_SYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SYearlyTask() when $default != null:
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
    TResult Function(_SYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SYearlyTask():
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
    TResult? Function(_SYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SYearlyTask() when $default != null:
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
            String? title, int year, int id, bool? isChecked, int? labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SYearlyTask() when $default != null:
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
            String? title, int year, int id, bool? isChecked, int? labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SYearlyTask():
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
            String? title, int year, int id, bool? isChecked, int? labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SYearlyTask() when $default != null:
        return $default(
            _that.title, _that.year, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SYearlyTask extends SYearlyTask {
  const _SYearlyTask(
      {required this.title,
      required this.year,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? title;
  @override
  final int year;
  @override
  final int id;
  @override
  final bool? isChecked;
  @override
  final int? labelId;

  /// Create a copy of SYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SYearlyTaskCopyWith<_SYearlyTask> get copyWith =>
      __$SYearlyTaskCopyWithImpl<_SYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SYearlyTask &&
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
    return 'SYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$SYearlyTaskCopyWith<$Res>
    implements $SYearlyTaskCopyWith<$Res> {
  factory _$SYearlyTaskCopyWith(
          _SYearlyTask value, $Res Function(_SYearlyTask) _then) =
      __$SYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, int year, int id, bool? isChecked, int? labelId});
}

/// @nodoc
class __$SYearlyTaskCopyWithImpl<$Res> implements _$SYearlyTaskCopyWith<$Res> {
  __$SYearlyTaskCopyWithImpl(this._self, this._then);

  final _SYearlyTask _self;
  final $Res Function(_SYearlyTask) _then;

  /// Create a copy of SYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? year = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = freezed,
  }) {
    return _then(_SYearlyTask(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked: freezed == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      labelId: freezed == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
