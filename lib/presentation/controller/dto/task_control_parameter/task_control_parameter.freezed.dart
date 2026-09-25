// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_control_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskControlParameter {
  ListEntry<VTask> get taskEntry;
  String? get newTitle;
  bool? get newChecked;
  int? get newLabelId;

  /// Create a copy of TaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskControlParameterCopyWith<TaskControlParameter> get copyWith =>
      _$TaskControlParameterCopyWithImpl<TaskControlParameter>(
          this as TaskControlParameter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskControlParameter &&
            (identical(other.taskEntry, taskEntry) ||
                other.taskEntry == taskEntry) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newChecked, newChecked) ||
                other.newChecked == newChecked) &&
            (identical(other.newLabelId, newLabelId) ||
                other.newLabelId == newLabelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, taskEntry, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'TaskControlParameter(taskEntry: $taskEntry, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class $TaskControlParameterCopyWith<$Res> {
  factory $TaskControlParameterCopyWith(TaskControlParameter value,
          $Res Function(TaskControlParameter) _then) =
      _$TaskControlParameterCopyWithImpl;
  @useResult
  $Res call(
      {ListEntry<VTask> taskEntry,
      String? newTitle,
      bool? newChecked,
      int? newLabelId});
}

/// @nodoc
class _$TaskControlParameterCopyWithImpl<$Res>
    implements $TaskControlParameterCopyWith<$Res> {
  _$TaskControlParameterCopyWithImpl(this._self, this._then);

  final TaskControlParameter _self;
  final $Res Function(TaskControlParameter) _then;

  /// Create a copy of TaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskEntry = null,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_self.copyWith(
      taskEntry: null == taskEntry
          ? _self.taskEntry
          : taskEntry // ignore: cast_nullable_to_non_nullable
              as ListEntry<VTask>,
      newTitle: freezed == newTitle
          ? _self.newTitle
          : newTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newChecked: freezed == newChecked
          ? _self.newChecked
          : newChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      newLabelId: freezed == newLabelId
          ? _self.newLabelId
          : newLabelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TaskControlParameter].
extension TaskControlParameterPatterns on TaskControlParameter {
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
    TResult Function(_TaskControlParameter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter() when $default != null:
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
    TResult Function(_TaskControlParameter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter():
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
    TResult? Function(_TaskControlParameter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter() when $default != null:
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
    TResult Function(ListEntry<VTask> taskEntry, String? newTitle,
            bool? newChecked, int? newLabelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter() when $default != null:
        return $default(_that.taskEntry, _that.newTitle, _that.newChecked,
            _that.newLabelId);
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
    TResult Function(ListEntry<VTask> taskEntry, String? newTitle,
            bool? newChecked, int? newLabelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter():
        return $default(_that.taskEntry, _that.newTitle, _that.newChecked,
            _that.newLabelId);
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
    TResult? Function(ListEntry<VTask> taskEntry, String? newTitle,
            bool? newChecked, int? newLabelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter() when $default != null:
        return $default(_that.taskEntry, _that.newTitle, _that.newChecked,
            _that.newLabelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TaskControlParameter extends TaskControlParameter {
  const _TaskControlParameter(
      {required this.taskEntry,
      this.newTitle,
      this.newChecked,
      this.newLabelId})
      : super._();

  @override
  final ListEntry<VTask> taskEntry;
  @override
  final String? newTitle;
  @override
  final bool? newChecked;
  @override
  final int? newLabelId;

  /// Create a copy of TaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskControlParameterCopyWith<_TaskControlParameter> get copyWith =>
      __$TaskControlParameterCopyWithImpl<_TaskControlParameter>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskControlParameter &&
            (identical(other.taskEntry, taskEntry) ||
                other.taskEntry == taskEntry) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newChecked, newChecked) ||
                other.newChecked == newChecked) &&
            (identical(other.newLabelId, newLabelId) ||
                other.newLabelId == newLabelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, taskEntry, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'TaskControlParameter(taskEntry: $taskEntry, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class _$TaskControlParameterCopyWith<$Res>
    implements $TaskControlParameterCopyWith<$Res> {
  factory _$TaskControlParameterCopyWith(_TaskControlParameter value,
          $Res Function(_TaskControlParameter) _then) =
      __$TaskControlParameterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ListEntry<VTask> taskEntry,
      String? newTitle,
      bool? newChecked,
      int? newLabelId});
}

/// @nodoc
class __$TaskControlParameterCopyWithImpl<$Res>
    implements _$TaskControlParameterCopyWith<$Res> {
  __$TaskControlParameterCopyWithImpl(this._self, this._then);

  final _TaskControlParameter _self;
  final $Res Function(_TaskControlParameter) _then;

  /// Create a copy of TaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? taskEntry = null,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_TaskControlParameter(
      taskEntry: null == taskEntry
          ? _self.taskEntry
          : taskEntry // ignore: cast_nullable_to_non_nullable
              as ListEntry<VTask>,
      newTitle: freezed == newTitle
          ? _self.newTitle
          : newTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newChecked: freezed == newChecked
          ? _self.newChecked
          : newChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      newLabelId: freezed == newLabelId
          ? _self.newLabelId
          : newLabelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$WeeklyTaskControlParameter {
  VWeeklyTask get taskOrigin;
  Date? get newStart;
  String? get newTitle;
  bool? get newChecked;
  int? get newLabelId;

  /// Create a copy of WeeklyTaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeklyTaskControlParameterCopyWith<WeeklyTaskControlParameter>
      get copyWith =>
          _$WeeklyTaskControlParameterCopyWithImpl<WeeklyTaskControlParameter>(
              this as WeeklyTaskControlParameter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeklyTaskControlParameter &&
            (identical(other.taskOrigin, taskOrigin) ||
                other.taskOrigin == taskOrigin) &&
            (identical(other.newStart, newStart) ||
                other.newStart == newStart) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newChecked, newChecked) ||
                other.newChecked == newChecked) &&
            (identical(other.newLabelId, newLabelId) ||
                other.newLabelId == newLabelId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, taskOrigin, newStart, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'WeeklyTaskControlParameter(taskOrigin: $taskOrigin, newStart: $newStart, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class $WeeklyTaskControlParameterCopyWith<$Res> {
  factory $WeeklyTaskControlParameterCopyWith(WeeklyTaskControlParameter value,
          $Res Function(WeeklyTaskControlParameter) _then) =
      _$WeeklyTaskControlParameterCopyWithImpl;
  @useResult
  $Res call(
      {VWeeklyTask taskOrigin,
      Date? newStart,
      String? newTitle,
      bool? newChecked,
      int? newLabelId});

  $VWeeklyTaskCopyWith<$Res> get taskOrigin;
}

/// @nodoc
class _$WeeklyTaskControlParameterCopyWithImpl<$Res>
    implements $WeeklyTaskControlParameterCopyWith<$Res> {
  _$WeeklyTaskControlParameterCopyWithImpl(this._self, this._then);

  final WeeklyTaskControlParameter _self;
  final $Res Function(WeeklyTaskControlParameter) _then;

  /// Create a copy of WeeklyTaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskOrigin = null,
    Object? newStart = freezed,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_self.copyWith(
      taskOrigin: null == taskOrigin
          ? _self.taskOrigin
          : taskOrigin // ignore: cast_nullable_to_non_nullable
              as VWeeklyTask,
      newStart: freezed == newStart
          ? _self.newStart
          : newStart // ignore: cast_nullable_to_non_nullable
              as Date?,
      newTitle: freezed == newTitle
          ? _self.newTitle
          : newTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newChecked: freezed == newChecked
          ? _self.newChecked
          : newChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      newLabelId: freezed == newLabelId
          ? _self.newLabelId
          : newLabelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of WeeklyTaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VWeeklyTaskCopyWith<$Res> get taskOrigin {
    return $VWeeklyTaskCopyWith<$Res>(_self.taskOrigin, (value) {
      return _then(_self.copyWith(taskOrigin: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WeeklyTaskControlParameter].
extension WeeklyTaskControlParameterPatterns on WeeklyTaskControlParameter {
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
    TResult Function(_WeeklyTaskControlParameter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskControlParameter() when $default != null:
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
    TResult Function(_WeeklyTaskControlParameter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskControlParameter():
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
    TResult? Function(_WeeklyTaskControlParameter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskControlParameter() when $default != null:
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
    TResult Function(VWeeklyTask taskOrigin, Date? newStart, String? newTitle,
            bool? newChecked, int? newLabelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskControlParameter() when $default != null:
        return $default(_that.taskOrigin, _that.newStart, _that.newTitle,
            _that.newChecked, _that.newLabelId);
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
    TResult Function(VWeeklyTask taskOrigin, Date? newStart, String? newTitle,
            bool? newChecked, int? newLabelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskControlParameter():
        return $default(_that.taskOrigin, _that.newStart, _that.newTitle,
            _that.newChecked, _that.newLabelId);
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
    TResult? Function(VWeeklyTask taskOrigin, Date? newStart, String? newTitle,
            bool? newChecked, int? newLabelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskControlParameter() when $default != null:
        return $default(_that.taskOrigin, _that.newStart, _that.newTitle,
            _that.newChecked, _that.newLabelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WeeklyTaskControlParameter extends WeeklyTaskControlParameter {
  const _WeeklyTaskControlParameter(
      {required this.taskOrigin,
      this.newStart,
      this.newTitle,
      this.newChecked,
      this.newLabelId})
      : super._();

  @override
  final VWeeklyTask taskOrigin;
  @override
  final Date? newStart;
  @override
  final String? newTitle;
  @override
  final bool? newChecked;
  @override
  final int? newLabelId;

  /// Create a copy of WeeklyTaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeeklyTaskControlParameterCopyWith<_WeeklyTaskControlParameter>
      get copyWith => __$WeeklyTaskControlParameterCopyWithImpl<
          _WeeklyTaskControlParameter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeeklyTaskControlParameter &&
            (identical(other.taskOrigin, taskOrigin) ||
                other.taskOrigin == taskOrigin) &&
            (identical(other.newStart, newStart) ||
                other.newStart == newStart) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newChecked, newChecked) ||
                other.newChecked == newChecked) &&
            (identical(other.newLabelId, newLabelId) ||
                other.newLabelId == newLabelId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, taskOrigin, newStart, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'WeeklyTaskControlParameter(taskOrigin: $taskOrigin, newStart: $newStart, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class _$WeeklyTaskControlParameterCopyWith<$Res>
    implements $WeeklyTaskControlParameterCopyWith<$Res> {
  factory _$WeeklyTaskControlParameterCopyWith(
          _WeeklyTaskControlParameter value,
          $Res Function(_WeeklyTaskControlParameter) _then) =
      __$WeeklyTaskControlParameterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {VWeeklyTask taskOrigin,
      Date? newStart,
      String? newTitle,
      bool? newChecked,
      int? newLabelId});

  @override
  $VWeeklyTaskCopyWith<$Res> get taskOrigin;
}

/// @nodoc
class __$WeeklyTaskControlParameterCopyWithImpl<$Res>
    implements _$WeeklyTaskControlParameterCopyWith<$Res> {
  __$WeeklyTaskControlParameterCopyWithImpl(this._self, this._then);

  final _WeeklyTaskControlParameter _self;
  final $Res Function(_WeeklyTaskControlParameter) _then;

  /// Create a copy of WeeklyTaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? taskOrigin = null,
    Object? newStart = freezed,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_WeeklyTaskControlParameter(
      taskOrigin: null == taskOrigin
          ? _self.taskOrigin
          : taskOrigin // ignore: cast_nullable_to_non_nullable
              as VWeeklyTask,
      newStart: freezed == newStart
          ? _self.newStart
          : newStart // ignore: cast_nullable_to_non_nullable
              as Date?,
      newTitle: freezed == newTitle
          ? _self.newTitle
          : newTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newChecked: freezed == newChecked
          ? _self.newChecked
          : newChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      newLabelId: freezed == newLabelId
          ? _self.newLabelId
          : newLabelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of WeeklyTaskControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VWeeklyTaskCopyWith<$Res> get taskOrigin {
    return $VWeeklyTaskCopyWith<$Res>(_self.taskOrigin, (value) {
      return _then(_self.copyWith(taskOrigin: value));
    });
  }
}

// dart format on
