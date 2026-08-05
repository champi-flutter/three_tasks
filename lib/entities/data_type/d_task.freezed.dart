// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'd_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DDailyTask {
  String? get task;
  Date get date;
  int get id;
  bool? get isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  int get labelId;

  /// Create a copy of DDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DDailyTaskCopyWith<DDailyTask> get copyWith =>
      _$DDailyTaskCopyWithImpl<DDailyTask>(this as DDailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DDailyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, date, id, isChecked, labelId);

  @override
  String toString() {
    return 'DDailyTask(task: $task, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $DDailyTaskCopyWith<$Res> {
  factory $DDailyTaskCopyWith(
          DDailyTask value, $Res Function(DDailyTask) _then) =
      _$DDailyTaskCopyWithImpl;
  @useResult
  $Res call({String? task, Date date, int id, bool? isChecked, int labelId});
}

/// @nodoc
class _$DDailyTaskCopyWithImpl<$Res> implements $DDailyTaskCopyWith<$Res> {
  _$DDailyTaskCopyWithImpl(this._self, this._then);

  final DDailyTask _self;
  final $Res Function(DDailyTask) _then;

  /// Create a copy of DDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? date = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DDailyTask].
extension DDailyTaskPatterns on DDailyTask {
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
    TResult Function(_DDailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DDailyTask() when $default != null:
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
    TResult Function(_DDailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DDailyTask():
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
    TResult? Function(_DDailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DDailyTask() when $default != null:
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
            String? task, Date date, int id, bool? isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DDailyTask() when $default != null:
        return $default(
            _that.task, _that.date, _that.id, _that.isChecked, _that.labelId);
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
            String? task, Date date, int id, bool? isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DDailyTask():
        return $default(
            _that.task, _that.date, _that.id, _that.isChecked, _that.labelId);
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
            String? task, Date date, int id, bool? isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DDailyTask() when $default != null:
        return $default(
            _that.task, _that.date, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DDailyTask extends DDailyTask {
  const _DDailyTask(
      {required this.task,
      required this.date,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? task;
  @override
  final Date date;
  @override
  final int id;
  @override
  final bool? isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  @override
  final int labelId;

  /// Create a copy of DDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DDailyTaskCopyWith<_DDailyTask> get copyWith =>
      __$DDailyTaskCopyWithImpl<_DDailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DDailyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, date, id, isChecked, labelId);

  @override
  String toString() {
    return 'DDailyTask(task: $task, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$DDailyTaskCopyWith<$Res>
    implements $DDailyTaskCopyWith<$Res> {
  factory _$DDailyTaskCopyWith(
          _DDailyTask value, $Res Function(_DDailyTask) _then) =
      __$DDailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String? task, Date date, int id, bool? isChecked, int labelId});
}

/// @nodoc
class __$DDailyTaskCopyWithImpl<$Res> implements _$DDailyTaskCopyWith<$Res> {
  __$DDailyTaskCopyWithImpl(this._self, this._then);

  final _DDailyTask _self;
  final $Res Function(_DDailyTask) _then;

  /// Create a copy of DDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = freezed,
    Object? date = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_DDailyTask(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DWeeklyTask {
  String? get task;
  UniqueWeek get week;
  int get id;
  bool? get isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  int get labelId;

  /// Create a copy of DWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DWeeklyTaskCopyWith<DWeeklyTask> get copyWith =>
      _$DWeeklyTaskCopyWithImpl<DWeeklyTask>(this as DWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DWeeklyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, week, id, isChecked, labelId);

  @override
  String toString() {
    return 'DWeeklyTask(task: $task, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $DWeeklyTaskCopyWith<$Res> {
  factory $DWeeklyTaskCopyWith(
          DWeeklyTask value, $Res Function(DWeeklyTask) _then) =
      _$DWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String? task, UniqueWeek week, int id, bool? isChecked, int labelId});
}

/// @nodoc
class _$DWeeklyTaskCopyWithImpl<$Res> implements $DWeeklyTaskCopyWith<$Res> {
  _$DWeeklyTaskCopyWithImpl(this._self, this._then);

  final DWeeklyTask _self;
  final $Res Function(DWeeklyTask) _then;

  /// Create a copy of DWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? week = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DWeeklyTask].
extension DWeeklyTaskPatterns on DWeeklyTask {
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
    TResult Function(_DWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DWeeklyTask() when $default != null:
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
    TResult Function(_DWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DWeeklyTask():
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
    TResult? Function(_DWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DWeeklyTask() when $default != null:
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
    TResult Function(String? task, UniqueWeek week, int id, bool? isChecked,
            int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DWeeklyTask() when $default != null:
        return $default(
            _that.task, _that.week, _that.id, _that.isChecked, _that.labelId);
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
            String? task, UniqueWeek week, int id, bool? isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DWeeklyTask():
        return $default(
            _that.task, _that.week, _that.id, _that.isChecked, _that.labelId);
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
    TResult? Function(String? task, UniqueWeek week, int id, bool? isChecked,
            int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DWeeklyTask() when $default != null:
        return $default(
            _that.task, _that.week, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DWeeklyTask extends DWeeklyTask {
  const _DWeeklyTask(
      {required this.task,
      required this.week,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? task;
  @override
  final UniqueWeek week;
  @override
  final int id;
  @override
  final bool? isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  @override
  final int labelId;

  /// Create a copy of DWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DWeeklyTaskCopyWith<_DWeeklyTask> get copyWith =>
      __$DWeeklyTaskCopyWithImpl<_DWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DWeeklyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, week, id, isChecked, labelId);

  @override
  String toString() {
    return 'DWeeklyTask(task: $task, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$DWeeklyTaskCopyWith<$Res>
    implements $DWeeklyTaskCopyWith<$Res> {
  factory _$DWeeklyTaskCopyWith(
          _DWeeklyTask value, $Res Function(_DWeeklyTask) _then) =
      __$DWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? task, UniqueWeek week, int id, bool? isChecked, int labelId});
}

/// @nodoc
class __$DWeeklyTaskCopyWithImpl<$Res> implements _$DWeeklyTaskCopyWith<$Res> {
  __$DWeeklyTaskCopyWithImpl(this._self, this._then);

  final _DWeeklyTask _self;
  final $Res Function(_DWeeklyTask) _then;

  /// Create a copy of DWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = freezed,
    Object? week = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_DWeeklyTask(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DMonthlyTask {
  String? get task;
  Month get month;
  int get id;
  bool? get isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  int get labelId;

  /// Create a copy of DMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DMonthlyTaskCopyWith<DMonthlyTask> get copyWith =>
      _$DMonthlyTaskCopyWithImpl<DMonthlyTask>(
          this as DMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DMonthlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, month, id, isChecked, labelId);

  @override
  String toString() {
    return 'DMonthlyTask(task: $task, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $DMonthlyTaskCopyWith<$Res> {
  factory $DMonthlyTaskCopyWith(
          DMonthlyTask value, $Res Function(DMonthlyTask) _then) =
      _$DMonthlyTaskCopyWithImpl;
  @useResult
  $Res call({String? task, Month month, int id, bool? isChecked, int labelId});
}

/// @nodoc
class _$DMonthlyTaskCopyWithImpl<$Res> implements $DMonthlyTaskCopyWith<$Res> {
  _$DMonthlyTaskCopyWithImpl(this._self, this._then);

  final DMonthlyTask _self;
  final $Res Function(DMonthlyTask) _then;

  /// Create a copy of DMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? month = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DMonthlyTask].
extension DMonthlyTaskPatterns on DMonthlyTask {
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
    TResult Function(_DMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DMonthlyTask() when $default != null:
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
    TResult Function(_DMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DMonthlyTask():
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
    TResult? Function(_DMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DMonthlyTask() when $default != null:
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
            String? task, Month month, int id, bool? isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DMonthlyTask() when $default != null:
        return $default(
            _that.task, _that.month, _that.id, _that.isChecked, _that.labelId);
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
            String? task, Month month, int id, bool? isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DMonthlyTask():
        return $default(
            _that.task, _that.month, _that.id, _that.isChecked, _that.labelId);
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
            String? task, Month month, int id, bool? isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DMonthlyTask() when $default != null:
        return $default(
            _that.task, _that.month, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DMonthlyTask extends DMonthlyTask {
  const _DMonthlyTask(
      {required this.task,
      required this.month,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? task;
  @override
  final Month month;
  @override
  final int id;
  @override
  final bool? isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  @override
  final int labelId;

  /// Create a copy of DMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DMonthlyTaskCopyWith<_DMonthlyTask> get copyWith =>
      __$DMonthlyTaskCopyWithImpl<_DMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DMonthlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, month, id, isChecked, labelId);

  @override
  String toString() {
    return 'DMonthlyTask(task: $task, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$DMonthlyTaskCopyWith<$Res>
    implements $DMonthlyTaskCopyWith<$Res> {
  factory _$DMonthlyTaskCopyWith(
          _DMonthlyTask value, $Res Function(_DMonthlyTask) _then) =
      __$DMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String? task, Month month, int id, bool? isChecked, int labelId});
}

/// @nodoc
class __$DMonthlyTaskCopyWithImpl<$Res>
    implements _$DMonthlyTaskCopyWith<$Res> {
  __$DMonthlyTaskCopyWithImpl(this._self, this._then);

  final _DMonthlyTask _self;
  final $Res Function(_DMonthlyTask) _then;

  /// Create a copy of DMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = freezed,
    Object? month = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_DMonthlyTask(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DYearlyTask {
  String? get task;
  int get year;
  int get id;
  bool? get isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  int get labelId;

  /// Create a copy of DYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DYearlyTaskCopyWith<DYearlyTask> get copyWith =>
      _$DYearlyTaskCopyWithImpl<DYearlyTask>(this as DYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DYearlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, year, id, isChecked, labelId);

  @override
  String toString() {
    return 'DYearlyTask(task: $task, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $DYearlyTaskCopyWith<$Res> {
  factory $DYearlyTaskCopyWith(
          DYearlyTask value, $Res Function(DYearlyTask) _then) =
      _$DYearlyTaskCopyWithImpl;
  @useResult
  $Res call({String? task, int year, int id, bool? isChecked, int labelId});
}

/// @nodoc
class _$DYearlyTaskCopyWithImpl<$Res> implements $DYearlyTaskCopyWith<$Res> {
  _$DYearlyTaskCopyWithImpl(this._self, this._then);

  final DYearlyTask _self;
  final $Res Function(DYearlyTask) _then;

  /// Create a copy of DYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? year = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DYearlyTask].
extension DYearlyTaskPatterns on DYearlyTask {
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
    TResult Function(_DYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DYearlyTask() when $default != null:
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
    TResult Function(_DYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DYearlyTask():
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
    TResult? Function(_DYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DYearlyTask() when $default != null:
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
            String? task, int year, int id, bool? isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DYearlyTask() when $default != null:
        return $default(
            _that.task, _that.year, _that.id, _that.isChecked, _that.labelId);
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
            String? task, int year, int id, bool? isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DYearlyTask():
        return $default(
            _that.task, _that.year, _that.id, _that.isChecked, _that.labelId);
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
            String? task, int year, int id, bool? isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DYearlyTask() when $default != null:
        return $default(
            _that.task, _that.year, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DYearlyTask extends DYearlyTask {
  const _DYearlyTask(
      {required this.task,
      required this.year,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String? task;
  @override
  final int year;
  @override
  final int id;
  @override
  final bool? isChecked;

  /// todo 2026/08/02 変更: ラベル未登録の状態を null => -1 に変更
  @override
  final int labelId;

  /// Create a copy of DYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DYearlyTaskCopyWith<_DYearlyTask> get copyWith =>
      __$DYearlyTaskCopyWithImpl<_DYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DYearlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, task, year, id, isChecked, labelId);

  @override
  String toString() {
    return 'DYearlyTask(task: $task, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$DYearlyTaskCopyWith<$Res>
    implements $DYearlyTaskCopyWith<$Res> {
  factory _$DYearlyTaskCopyWith(
          _DYearlyTask value, $Res Function(_DYearlyTask) _then) =
      __$DYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String? task, int year, int id, bool? isChecked, int labelId});
}

/// @nodoc
class __$DYearlyTaskCopyWithImpl<$Res> implements _$DYearlyTaskCopyWith<$Res> {
  __$DYearlyTaskCopyWithImpl(this._self, this._then);

  final _DYearlyTask _self;
  final $Res Function(_DYearlyTask) _then;

  /// Create a copy of DYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = freezed,
    Object? year = null,
    Object? id = null,
    Object? isChecked = freezed,
    Object? labelId = null,
  }) {
    return _then(_DYearlyTask(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
