// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'v_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VDayTask {
  String get task;
  Date get date;
  int get id;
  bool get isChecked;

  /// Create a copy of VDayTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VDayTaskCopyWith<VDayTask> get copyWith =>
      _$VDayTaskCopyWithImpl<VDayTask>(this as VDayTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VDayTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, date, id, isChecked);

  @override
  String toString() {
    return 'VDayTask(task: $task, date: $date, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class $VDayTaskCopyWith<$Res> {
  factory $VDayTaskCopyWith(VDayTask value, $Res Function(VDayTask) _then) =
      _$VDayTaskCopyWithImpl;
  @useResult
  $Res call({String task, Date date, int id, bool isChecked});
}

/// @nodoc
class _$VDayTaskCopyWithImpl<$Res> implements $VDayTaskCopyWith<$Res> {
  _$VDayTaskCopyWithImpl(this._self, this._then);

  final VDayTask _self;
  final $Res Function(VDayTask) _then;

  /// Create a copy of VDayTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_self.copyWith(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// Adds pattern-matching-related methods to [VDayTask].
extension VDayTaskPatterns on VDayTask {
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
    TResult Function(_VDayTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VDayTask() when $default != null:
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
    TResult Function(_VDayTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDayTask():
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
    TResult? Function(_VDayTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDayTask() when $default != null:
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
    TResult Function(String task, Date date, int id, bool isChecked)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VDayTask() when $default != null:
        return $default(_that.task, _that.date, _that.id, _that.isChecked);
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
    TResult Function(String task, Date date, int id, bool isChecked) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDayTask():
        return $default(_that.task, _that.date, _that.id, _that.isChecked);
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
    TResult? Function(String task, Date date, int id, bool isChecked)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDayTask() when $default != null:
        return $default(_that.task, _that.date, _that.id, _that.isChecked);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VDayTask extends VDayTask {
  const _VDayTask(
      {required this.task,
      required this.date,
      required this.id,
      required this.isChecked})
      : super._();

  @override
  final String task;
  @override
  final Date date;
  @override
  final int id;
  @override
  final bool isChecked;

  /// Create a copy of VDayTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VDayTaskCopyWith<_VDayTask> get copyWith =>
      __$VDayTaskCopyWithImpl<_VDayTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VDayTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, date, id, isChecked);

  @override
  String toString() {
    return 'VDayTask(task: $task, date: $date, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class _$VDayTaskCopyWith<$Res>
    implements $VDayTaskCopyWith<$Res> {
  factory _$VDayTaskCopyWith(_VDayTask value, $Res Function(_VDayTask) _then) =
      __$VDayTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String task, Date date, int id, bool isChecked});
}

/// @nodoc
class __$VDayTaskCopyWithImpl<$Res> implements _$VDayTaskCopyWith<$Res> {
  __$VDayTaskCopyWithImpl(this._self, this._then);

  final _VDayTask _self;
  final $Res Function(_VDayTask) _then;

  /// Create a copy of VDayTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_VDayTask(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
mixin _$VWeeklyTask {
  String get task; // todo 週のクラス（2026/06/04）＞＞
  UniqueWeek get week;
  int get id;
  bool get isChecked;

  /// Create a copy of VWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VWeeklyTaskCopyWith<VWeeklyTask> get copyWith =>
      _$VWeeklyTaskCopyWithImpl<VWeeklyTask>(this as VWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VWeeklyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, week, id, isChecked);

  @override
  String toString() {
    return 'VWeeklyTask(task: $task, week: $week, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class $VWeeklyTaskCopyWith<$Res> {
  factory $VWeeklyTaskCopyWith(
          VWeeklyTask value, $Res Function(VWeeklyTask) _then) =
      _$VWeeklyTaskCopyWithImpl;
  @useResult
  $Res call({String task, UniqueWeek week, int id, bool isChecked});
}

/// @nodoc
class _$VWeeklyTaskCopyWithImpl<$Res> implements $VWeeklyTaskCopyWith<$Res> {
  _$VWeeklyTaskCopyWithImpl(this._self, this._then);

  final VWeeklyTask _self;
  final $Res Function(VWeeklyTask) _then;

  /// Create a copy of VWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_self.copyWith(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// Adds pattern-matching-related methods to [VWeeklyTask].
extension VWeeklyTaskPatterns on VWeeklyTask {
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
    TResult Function(_VWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask() when $default != null:
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
    TResult Function(_VWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask():
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
    TResult? Function(_VWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask() when $default != null:
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
    TResult Function(String task, UniqueWeek week, int id, bool isChecked)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask() when $default != null:
        return $default(_that.task, _that.week, _that.id, _that.isChecked);
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
    TResult Function(String task, UniqueWeek week, int id, bool isChecked)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask():
        return $default(_that.task, _that.week, _that.id, _that.isChecked);
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
    TResult? Function(String task, UniqueWeek week, int id, bool isChecked)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask() when $default != null:
        return $default(_that.task, _that.week, _that.id, _that.isChecked);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VWeeklyTask extends VWeeklyTask {
  const _VWeeklyTask(
      {required this.task,
      required this.week,
      required this.id,
      required this.isChecked})
      : super._();

  @override
  final String task;
// todo 週のクラス（2026/06/04）＞＞
  @override
  final UniqueWeek week;
  @override
  final int id;
  @override
  final bool isChecked;

  /// Create a copy of VWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VWeeklyTaskCopyWith<_VWeeklyTask> get copyWith =>
      __$VWeeklyTaskCopyWithImpl<_VWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VWeeklyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, week, id, isChecked);

  @override
  String toString() {
    return 'VWeeklyTask(task: $task, week: $week, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class _$VWeeklyTaskCopyWith<$Res>
    implements $VWeeklyTaskCopyWith<$Res> {
  factory _$VWeeklyTaskCopyWith(
          _VWeeklyTask value, $Res Function(_VWeeklyTask) _then) =
      __$VWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String task, UniqueWeek week, int id, bool isChecked});
}

/// @nodoc
class __$VWeeklyTaskCopyWithImpl<$Res> implements _$VWeeklyTaskCopyWith<$Res> {
  __$VWeeklyTaskCopyWithImpl(this._self, this._then);

  final _VWeeklyTask _self;
  final $Res Function(_VWeeklyTask) _then;

  /// Create a copy of VWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_VWeeklyTask(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
mixin _$VMonthlyTask {
  String get task;
  Month get month;
  int get id;
  bool get isChecked;

  /// Create a copy of VMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VMonthlyTaskCopyWith<VMonthlyTask> get copyWith =>
      _$VMonthlyTaskCopyWithImpl<VMonthlyTask>(
          this as VMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VMonthlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, month, id, isChecked);

  @override
  String toString() {
    return 'VMonthlyTask(task: $task, month: $month, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class $VMonthlyTaskCopyWith<$Res> {
  factory $VMonthlyTaskCopyWith(
          VMonthlyTask value, $Res Function(VMonthlyTask) _then) =
      _$VMonthlyTaskCopyWithImpl;
  @useResult
  $Res call({String task, Month month, int id, bool isChecked});
}

/// @nodoc
class _$VMonthlyTaskCopyWithImpl<$Res> implements $VMonthlyTaskCopyWith<$Res> {
  _$VMonthlyTaskCopyWithImpl(this._self, this._then);

  final VMonthlyTask _self;
  final $Res Function(VMonthlyTask) _then;

  /// Create a copy of VMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_self.copyWith(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// Adds pattern-matching-related methods to [VMonthlyTask].
extension VMonthlyTaskPatterns on VMonthlyTask {
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
    TResult Function(_VMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask() when $default != null:
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
    TResult Function(_VMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask():
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
    TResult? Function(_VMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask() when $default != null:
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
    TResult Function(String task, Month month, int id, bool isChecked)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask() when $default != null:
        return $default(_that.task, _that.month, _that.id, _that.isChecked);
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
    TResult Function(String task, Month month, int id, bool isChecked) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask():
        return $default(_that.task, _that.month, _that.id, _that.isChecked);
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
    TResult? Function(String task, Month month, int id, bool isChecked)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask() when $default != null:
        return $default(_that.task, _that.month, _that.id, _that.isChecked);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VMonthlyTask extends VMonthlyTask {
  const _VMonthlyTask(
      {required this.task,
      required this.month,
      required this.id,
      required this.isChecked})
      : super._();

  @override
  final String task;
  @override
  final Month month;
  @override
  final int id;
  @override
  final bool isChecked;

  /// Create a copy of VMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VMonthlyTaskCopyWith<_VMonthlyTask> get copyWith =>
      __$VMonthlyTaskCopyWithImpl<_VMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VMonthlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, month, id, isChecked);

  @override
  String toString() {
    return 'VMonthlyTask(task: $task, month: $month, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class _$VMonthlyTaskCopyWith<$Res>
    implements $VMonthlyTaskCopyWith<$Res> {
  factory _$VMonthlyTaskCopyWith(
          _VMonthlyTask value, $Res Function(_VMonthlyTask) _then) =
      __$VMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String task, Month month, int id, bool isChecked});
}

/// @nodoc
class __$VMonthlyTaskCopyWithImpl<$Res>
    implements _$VMonthlyTaskCopyWith<$Res> {
  __$VMonthlyTaskCopyWithImpl(this._self, this._then);

  final _VMonthlyTask _self;
  final $Res Function(_VMonthlyTask) _then;

  /// Create a copy of VMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_VMonthlyTask(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
mixin _$VYearlyTask {
  String get task;
  int get year;
  int get id;
  bool get isChecked;

  /// Create a copy of VYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VYearlyTaskCopyWith<VYearlyTask> get copyWith =>
      _$VYearlyTaskCopyWithImpl<VYearlyTask>(this as VYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VYearlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, year, id, isChecked);

  @override
  String toString() {
    return 'VYearlyTask(task: $task, year: $year, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class $VYearlyTaskCopyWith<$Res> {
  factory $VYearlyTaskCopyWith(
          VYearlyTask value, $Res Function(VYearlyTask) _then) =
      _$VYearlyTaskCopyWithImpl;
  @useResult
  $Res call({String task, int year, int id, bool isChecked});
}

/// @nodoc
class _$VYearlyTaskCopyWithImpl<$Res> implements $VYearlyTaskCopyWith<$Res> {
  _$VYearlyTaskCopyWithImpl(this._self, this._then);

  final VYearlyTask _self;
  final $Res Function(VYearlyTask) _then;

  /// Create a copy of VYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? year = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_self.copyWith(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// Adds pattern-matching-related methods to [VYearlyTask].
extension VYearlyTaskPatterns on VYearlyTask {
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
    TResult Function(_VYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VYearlyTask() when $default != null:
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
    TResult Function(_VYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VYearlyTask():
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
    TResult? Function(_VYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VYearlyTask() when $default != null:
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
    TResult Function(String task, int year, int id, bool isChecked)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VYearlyTask() when $default != null:
        return $default(_that.task, _that.year, _that.id, _that.isChecked);
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
    TResult Function(String task, int year, int id, bool isChecked) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VYearlyTask():
        return $default(_that.task, _that.year, _that.id, _that.isChecked);
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
    TResult? Function(String task, int year, int id, bool isChecked)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VYearlyTask() when $default != null:
        return $default(_that.task, _that.year, _that.id, _that.isChecked);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VYearlyTask extends VYearlyTask {
  const _VYearlyTask(
      {required this.task,
      required this.year,
      required this.id,
      required this.isChecked})
      : super._();

  @override
  final String task;
  @override
  final int year;
  @override
  final int id;
  @override
  final bool isChecked;

  /// Create a copy of VYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VYearlyTaskCopyWith<_VYearlyTask> get copyWith =>
      __$VYearlyTaskCopyWithImpl<_VYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VYearlyTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, year, id, isChecked);

  @override
  String toString() {
    return 'VYearlyTask(task: $task, year: $year, id: $id, isChecked: $isChecked)';
  }
}

/// @nodoc
abstract mixin class _$VYearlyTaskCopyWith<$Res>
    implements $VYearlyTaskCopyWith<$Res> {
  factory _$VYearlyTaskCopyWith(
          _VYearlyTask value, $Res Function(_VYearlyTask) _then) =
      __$VYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String task, int year, int id, bool isChecked});
}

/// @nodoc
class __$VYearlyTaskCopyWithImpl<$Res> implements _$VYearlyTaskCopyWith<$Res> {
  __$VYearlyTaskCopyWithImpl(this._self, this._then);

  final _VYearlyTask _self;
  final $Res Function(_VYearlyTask) _then;

  /// Create a copy of VYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = null,
    Object? year = null,
    Object? id = null,
    Object? isChecked = null,
  }) {
    return _then(_VYearlyTask(
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

// dart format on
