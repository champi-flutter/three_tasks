// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_update_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskUpdateParameter {
  ETask get targetTask;
  String? get newTitle;
  bool? get newChecked;
  int? get newLabelId;

  /// Create a copy of TaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskUpdateParameterCopyWith<TaskUpdateParameter> get copyWith =>
      _$TaskUpdateParameterCopyWithImpl<TaskUpdateParameter>(
          this as TaskUpdateParameter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskUpdateParameter &&
            (identical(other.targetTask, targetTask) ||
                other.targetTask == targetTask) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newChecked, newChecked) ||
                other.newChecked == newChecked) &&
            (identical(other.newLabelId, newLabelId) ||
                other.newLabelId == newLabelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, targetTask, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'TaskUpdateParameter(targetTask: $targetTask, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class $TaskUpdateParameterCopyWith<$Res> {
  factory $TaskUpdateParameterCopyWith(
          TaskUpdateParameter value, $Res Function(TaskUpdateParameter) _then) =
      _$TaskUpdateParameterCopyWithImpl;
  @useResult
  $Res call(
      {ETask targetTask, String? newTitle, bool? newChecked, int? newLabelId});
}

/// @nodoc
class _$TaskUpdateParameterCopyWithImpl<$Res>
    implements $TaskUpdateParameterCopyWith<$Res> {
  _$TaskUpdateParameterCopyWithImpl(this._self, this._then);

  final TaskUpdateParameter _self;
  final $Res Function(TaskUpdateParameter) _then;

  /// Create a copy of TaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetTask = null,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_self.copyWith(
      targetTask: null == targetTask
          ? _self.targetTask
          : targetTask // ignore: cast_nullable_to_non_nullable
              as ETask,
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

/// Adds pattern-matching-related methods to [TaskUpdateParameter].
extension TaskUpdateParameterPatterns on TaskUpdateParameter {
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
    TResult Function(_TaskUpdateParameter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskUpdateParameter() when $default != null:
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
    TResult Function(_TaskUpdateParameter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskUpdateParameter():
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
    TResult? Function(_TaskUpdateParameter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskUpdateParameter() when $default != null:
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
    TResult Function(ETask targetTask, String? newTitle, bool? newChecked,
            int? newLabelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskUpdateParameter() when $default != null:
        return $default(_that.targetTask, _that.newTitle, _that.newChecked,
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
    TResult Function(ETask targetTask, String? newTitle, bool? newChecked,
            int? newLabelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskUpdateParameter():
        return $default(_that.targetTask, _that.newTitle, _that.newChecked,
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
    TResult? Function(ETask targetTask, String? newTitle, bool? newChecked,
            int? newLabelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskUpdateParameter() when $default != null:
        return $default(_that.targetTask, _that.newTitle, _that.newChecked,
            _that.newLabelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TaskUpdateParameter extends TaskUpdateParameter {
  const _TaskUpdateParameter(
      {required this.targetTask,
      this.newTitle,
      this.newChecked,
      this.newLabelId})
      : super._();

  @override
  final ETask targetTask;
  @override
  final String? newTitle;
  @override
  final bool? newChecked;
  @override
  final int? newLabelId;

  /// Create a copy of TaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskUpdateParameterCopyWith<_TaskUpdateParameter> get copyWith =>
      __$TaskUpdateParameterCopyWithImpl<_TaskUpdateParameter>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskUpdateParameter &&
            (identical(other.targetTask, targetTask) ||
                other.targetTask == targetTask) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newChecked, newChecked) ||
                other.newChecked == newChecked) &&
            (identical(other.newLabelId, newLabelId) ||
                other.newLabelId == newLabelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, targetTask, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'TaskUpdateParameter(targetTask: $targetTask, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class _$TaskUpdateParameterCopyWith<$Res>
    implements $TaskUpdateParameterCopyWith<$Res> {
  factory _$TaskUpdateParameterCopyWith(_TaskUpdateParameter value,
          $Res Function(_TaskUpdateParameter) _then) =
      __$TaskUpdateParameterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ETask targetTask, String? newTitle, bool? newChecked, int? newLabelId});
}

/// @nodoc
class __$TaskUpdateParameterCopyWithImpl<$Res>
    implements _$TaskUpdateParameterCopyWith<$Res> {
  __$TaskUpdateParameterCopyWithImpl(this._self, this._then);

  final _TaskUpdateParameter _self;
  final $Res Function(_TaskUpdateParameter) _then;

  /// Create a copy of TaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? targetTask = null,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_TaskUpdateParameter(
      targetTask: null == targetTask
          ? _self.targetTask
          : targetTask // ignore: cast_nullable_to_non_nullable
              as ETask,
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
mixin _$WeeklyTaskUpdateParameter {
  EWeeklyTask get targetTask;
  Date? get newStart;
  String? get newTitle;
  bool? get newChecked;
  int? get newLabelId;

  /// Create a copy of WeeklyTaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeklyTaskUpdateParameterCopyWith<WeeklyTaskUpdateParameter> get copyWith =>
      _$WeeklyTaskUpdateParameterCopyWithImpl<WeeklyTaskUpdateParameter>(
          this as WeeklyTaskUpdateParameter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeklyTaskUpdateParameter &&
            (identical(other.targetTask, targetTask) ||
                other.targetTask == targetTask) &&
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
      runtimeType, targetTask, newStart, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'WeeklyTaskUpdateParameter(targetTask: $targetTask, newStart: $newStart, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class $WeeklyTaskUpdateParameterCopyWith<$Res> {
  factory $WeeklyTaskUpdateParameterCopyWith(WeeklyTaskUpdateParameter value,
          $Res Function(WeeklyTaskUpdateParameter) _then) =
      _$WeeklyTaskUpdateParameterCopyWithImpl;
  @useResult
  $Res call(
      {EWeeklyTask targetTask,
      Date? newStart,
      String? newTitle,
      bool? newChecked,
      int? newLabelId});

  $EWeeklyTaskCopyWith<$Res> get targetTask;
}

/// @nodoc
class _$WeeklyTaskUpdateParameterCopyWithImpl<$Res>
    implements $WeeklyTaskUpdateParameterCopyWith<$Res> {
  _$WeeklyTaskUpdateParameterCopyWithImpl(this._self, this._then);

  final WeeklyTaskUpdateParameter _self;
  final $Res Function(WeeklyTaskUpdateParameter) _then;

  /// Create a copy of WeeklyTaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetTask = null,
    Object? newStart = freezed,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_self.copyWith(
      targetTask: null == targetTask
          ? _self.targetTask
          : targetTask // ignore: cast_nullable_to_non_nullable
              as EWeeklyTask,
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

  /// Create a copy of WeeklyTaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EWeeklyTaskCopyWith<$Res> get targetTask {
    return $EWeeklyTaskCopyWith<$Res>(_self.targetTask, (value) {
      return _then(_self.copyWith(targetTask: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WeeklyTaskUpdateParameter].
extension WeeklyTaskUpdateParameterPatterns on WeeklyTaskUpdateParameter {
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
    TResult Function(_WeeklyTaskUpdateParameter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskUpdateParameter() when $default != null:
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
    TResult Function(_WeeklyTaskUpdateParameter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskUpdateParameter():
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
    TResult? Function(_WeeklyTaskUpdateParameter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskUpdateParameter() when $default != null:
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
    TResult Function(EWeeklyTask targetTask, Date? newStart, String? newTitle,
            bool? newChecked, int? newLabelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskUpdateParameter() when $default != null:
        return $default(_that.targetTask, _that.newStart, _that.newTitle,
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
    TResult Function(EWeeklyTask targetTask, Date? newStart, String? newTitle,
            bool? newChecked, int? newLabelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskUpdateParameter():
        return $default(_that.targetTask, _that.newStart, _that.newTitle,
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
    TResult? Function(EWeeklyTask targetTask, Date? newStart, String? newTitle,
            bool? newChecked, int? newLabelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyTaskUpdateParameter() when $default != null:
        return $default(_that.targetTask, _that.newStart, _that.newTitle,
            _that.newChecked, _that.newLabelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WeeklyTaskUpdateParameter extends WeeklyTaskUpdateParameter {
  const _WeeklyTaskUpdateParameter(
      {required this.targetTask,
      this.newStart,
      this.newTitle,
      this.newChecked,
      this.newLabelId})
      : super._();

  @override
  final EWeeklyTask targetTask;
  @override
  final Date? newStart;
  @override
  final String? newTitle;
  @override
  final bool? newChecked;
  @override
  final int? newLabelId;

  /// Create a copy of WeeklyTaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeeklyTaskUpdateParameterCopyWith<_WeeklyTaskUpdateParameter>
      get copyWith =>
          __$WeeklyTaskUpdateParameterCopyWithImpl<_WeeklyTaskUpdateParameter>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeeklyTaskUpdateParameter &&
            (identical(other.targetTask, targetTask) ||
                other.targetTask == targetTask) &&
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
      runtimeType, targetTask, newStart, newTitle, newChecked, newLabelId);

  @override
  String toString() {
    return 'WeeklyTaskUpdateParameter(targetTask: $targetTask, newStart: $newStart, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class _$WeeklyTaskUpdateParameterCopyWith<$Res>
    implements $WeeklyTaskUpdateParameterCopyWith<$Res> {
  factory _$WeeklyTaskUpdateParameterCopyWith(_WeeklyTaskUpdateParameter value,
          $Res Function(_WeeklyTaskUpdateParameter) _then) =
      __$WeeklyTaskUpdateParameterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {EWeeklyTask targetTask,
      Date? newStart,
      String? newTitle,
      bool? newChecked,
      int? newLabelId});

  @override
  $EWeeklyTaskCopyWith<$Res> get targetTask;
}

/// @nodoc
class __$WeeklyTaskUpdateParameterCopyWithImpl<$Res>
    implements _$WeeklyTaskUpdateParameterCopyWith<$Res> {
  __$WeeklyTaskUpdateParameterCopyWithImpl(this._self, this._then);

  final _WeeklyTaskUpdateParameter _self;
  final $Res Function(_WeeklyTaskUpdateParameter) _then;

  /// Create a copy of WeeklyTaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? targetTask = null,
    Object? newStart = freezed,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_WeeklyTaskUpdateParameter(
      targetTask: null == targetTask
          ? _self.targetTask
          : targetTask // ignore: cast_nullable_to_non_nullable
              as EWeeklyTask,
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

  /// Create a copy of WeeklyTaskUpdateParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EWeeklyTaskCopyWith<$Res> get targetTask {
    return $EWeeklyTaskCopyWith<$Res>(_self.targetTask, (value) {
      return _then(_self.copyWith(targetTask: value));
    });
  }
}

// dart format on
