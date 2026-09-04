// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EDailyTask {
  String get title;
  Date get date;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of EDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EDailyTaskCopyWith<EDailyTask> get copyWith =>
      _$EDailyTaskCopyWithImpl<EDailyTask>(this as EDailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EDailyTask &&
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
    return 'EDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $EDailyTaskCopyWith<$Res> {
  factory $EDailyTaskCopyWith(
          EDailyTask value, $Res Function(EDailyTask) _then) =
      _$EDailyTaskCopyWithImpl;
  @useResult
  $Res call({String title, Date date, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$EDailyTaskCopyWithImpl<$Res> implements $EDailyTaskCopyWith<$Res> {
  _$EDailyTaskCopyWithImpl(this._self, this._then);

  final EDailyTask _self;
  final $Res Function(EDailyTask) _then;

  /// Create a copy of EDailyTask
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

/// Adds pattern-matching-related methods to [EDailyTask].
extension EDailyTaskPatterns on EDailyTask {
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
    TResult Function(_EDailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EDailyTask() when $default != null:
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
    TResult Function(_EDailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EDailyTask():
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
    TResult? Function(_EDailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EDailyTask() when $default != null:
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
      case _EDailyTask() when $default != null:
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
      case _EDailyTask():
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
      case _EDailyTask() when $default != null:
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EDailyTask extends EDailyTask {
  const _EDailyTask(
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

  /// Create a copy of EDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EDailyTaskCopyWith<_EDailyTask> get copyWith =>
      __$EDailyTaskCopyWithImpl<_EDailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EDailyTask &&
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
    return 'EDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$EDailyTaskCopyWith<$Res>
    implements $EDailyTaskCopyWith<$Res> {
  factory _$EDailyTaskCopyWith(
          _EDailyTask value, $Res Function(_EDailyTask) _then) =
      __$EDailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, Date date, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$EDailyTaskCopyWithImpl<$Res> implements _$EDailyTaskCopyWith<$Res> {
  __$EDailyTaskCopyWithImpl(this._self, this._then);

  final _EDailyTask _self;
  final $Res Function(_EDailyTask) _then;

  /// Create a copy of EDailyTask
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
    return _then(_EDailyTask(
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
mixin _$EWeeklyTask {
  String get title;
  UniqueWeek get week;
  int get id;
  bool get isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  int get labelId;

  /// Create a copy of EWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EWeeklyTaskCopyWith<EWeeklyTask> get copyWith =>
      _$EWeeklyTaskCopyWithImpl<EWeeklyTask>(this as EWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EWeeklyTask &&
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
    return 'EWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $EWeeklyTaskCopyWith<$Res> {
  factory $EWeeklyTaskCopyWith(
          EWeeklyTask value, $Res Function(EWeeklyTask) _then) =
      _$EWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title, UniqueWeek week, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$EWeeklyTaskCopyWithImpl<$Res> implements $EWeeklyTaskCopyWith<$Res> {
  _$EWeeklyTaskCopyWithImpl(this._self, this._then);

  final EWeeklyTask _self;
  final $Res Function(EWeeklyTask) _then;

  /// Create a copy of EWeeklyTask
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

/// Adds pattern-matching-related methods to [EWeeklyTask].
extension EWeeklyTaskPatterns on EWeeklyTask {
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
    TResult Function(_EWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EWeeklyTask() when $default != null:
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
    TResult Function(_EWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EWeeklyTask():
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
    TResult? Function(_EWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EWeeklyTask() when $default != null:
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
      case _EWeeklyTask() when $default != null:
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
      case _EWeeklyTask():
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
      case _EWeeklyTask() when $default != null:
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EWeeklyTask extends EWeeklyTask {
  const _EWeeklyTask(
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

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  @override
  final int labelId;

  /// Create a copy of EWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EWeeklyTaskCopyWith<_EWeeklyTask> get copyWith =>
      __$EWeeklyTaskCopyWithImpl<_EWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EWeeklyTask &&
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
    return 'EWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$EWeeklyTaskCopyWith<$Res>
    implements $EWeeklyTaskCopyWith<$Res> {
  factory _$EWeeklyTaskCopyWith(
          _EWeeklyTask value, $Res Function(_EWeeklyTask) _then) =
      __$EWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title, UniqueWeek week, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$EWeeklyTaskCopyWithImpl<$Res> implements _$EWeeklyTaskCopyWith<$Res> {
  __$EWeeklyTaskCopyWithImpl(this._self, this._then);

  final _EWeeklyTask _self;
  final $Res Function(_EWeeklyTask) _then;

  /// Create a copy of EWeeklyTask
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
    return _then(_EWeeklyTask(
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
mixin _$EMonthlyTask {
  String get title;
  Month get month;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of EMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EMonthlyTaskCopyWith<EMonthlyTask> get copyWith =>
      _$EMonthlyTaskCopyWithImpl<EMonthlyTask>(
          this as EMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EMonthlyTask &&
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
    return 'EMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $EMonthlyTaskCopyWith<$Res> {
  factory $EMonthlyTaskCopyWith(
          EMonthlyTask value, $Res Function(EMonthlyTask) _then) =
      _$EMonthlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, Month month, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$EMonthlyTaskCopyWithImpl<$Res> implements $EMonthlyTaskCopyWith<$Res> {
  _$EMonthlyTaskCopyWithImpl(this._self, this._then);

  final EMonthlyTask _self;
  final $Res Function(EMonthlyTask) _then;

  /// Create a copy of EMonthlyTask
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

/// Adds pattern-matching-related methods to [EMonthlyTask].
extension EMonthlyTaskPatterns on EMonthlyTask {
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
    TResult Function(_EMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EMonthlyTask() when $default != null:
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
    TResult Function(_EMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EMonthlyTask():
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
    TResult? Function(_EMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EMonthlyTask() when $default != null:
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
      case _EMonthlyTask() when $default != null:
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
      case _EMonthlyTask():
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
      case _EMonthlyTask() when $default != null:
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EMonthlyTask extends EMonthlyTask {
  const _EMonthlyTask(
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

  /// Create a copy of EMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EMonthlyTaskCopyWith<_EMonthlyTask> get copyWith =>
      __$EMonthlyTaskCopyWithImpl<_EMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EMonthlyTask &&
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
    return 'EMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$EMonthlyTaskCopyWith<$Res>
    implements $EMonthlyTaskCopyWith<$Res> {
  factory _$EMonthlyTaskCopyWith(
          _EMonthlyTask value, $Res Function(_EMonthlyTask) _then) =
      __$EMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, Month month, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$EMonthlyTaskCopyWithImpl<$Res>
    implements _$EMonthlyTaskCopyWith<$Res> {
  __$EMonthlyTaskCopyWithImpl(this._self, this._then);

  final _EMonthlyTask _self;
  final $Res Function(_EMonthlyTask) _then;

  /// Create a copy of EMonthlyTask
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
    return _then(_EMonthlyTask(
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
mixin _$EYearlyTask {
  String get title;
  int get year;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of EYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EYearlyTaskCopyWith<EYearlyTask> get copyWith =>
      _$EYearlyTaskCopyWithImpl<EYearlyTask>(this as EYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EYearlyTask &&
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
    return 'EYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $EYearlyTaskCopyWith<$Res> {
  factory $EYearlyTaskCopyWith(
          EYearlyTask value, $Res Function(EYearlyTask) _then) =
      _$EYearlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, int year, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$EYearlyTaskCopyWithImpl<$Res> implements $EYearlyTaskCopyWith<$Res> {
  _$EYearlyTaskCopyWithImpl(this._self, this._then);

  final EYearlyTask _self;
  final $Res Function(EYearlyTask) _then;

  /// Create a copy of EYearlyTask
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

/// Adds pattern-matching-related methods to [EYearlyTask].
extension EYearlyTaskPatterns on EYearlyTask {
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
    TResult Function(_EYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EYearlyTask() when $default != null:
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
    TResult Function(_EYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EYearlyTask():
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
    TResult? Function(_EYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EYearlyTask() when $default != null:
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
      case _EYearlyTask() when $default != null:
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
      case _EYearlyTask():
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
      case _EYearlyTask() when $default != null:
        return $default(
            _that.title, _that.year, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EYearlyTask extends EYearlyTask {
  const _EYearlyTask(
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

  /// Create a copy of EYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EYearlyTaskCopyWith<_EYearlyTask> get copyWith =>
      __$EYearlyTaskCopyWithImpl<_EYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EYearlyTask &&
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
    return 'EYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$EYearlyTaskCopyWith<$Res>
    implements $EYearlyTaskCopyWith<$Res> {
  factory _$EYearlyTaskCopyWith(
          _EYearlyTask value, $Res Function(_EYearlyTask) _then) =
      __$EYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int year, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$EYearlyTaskCopyWithImpl<$Res> implements _$EYearlyTaskCopyWith<$Res> {
  __$EYearlyTaskCopyWithImpl(this._self, this._then);

  final _EYearlyTask _self;
  final $Res Function(_EYearlyTask) _then;

  /// Create a copy of EYearlyTask
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
    return _then(_EYearlyTask(
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
