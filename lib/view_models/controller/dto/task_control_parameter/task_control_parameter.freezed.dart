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
  VTask get targetTask;
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
    return 'TaskControlParameter(targetTask: $targetTask, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
  }
}

/// @nodoc
abstract mixin class $TaskControlParameterCopyWith<$Res> {
  factory $TaskControlParameterCopyWith(TaskControlParameter value,
          $Res Function(TaskControlParameter) _then) =
      _$TaskControlParameterCopyWithImpl;
  @useResult
  $Res call(
      {VTask targetTask, String? newTitle, bool? newChecked, int? newLabelId});
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
    Object? targetTask = null,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_self.copyWith(
      targetTask: null == targetTask
          ? _self.targetTask
          : targetTask // ignore: cast_nullable_to_non_nullable
              as VTask,
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
    TResult Function(VTask targetTask, String? newTitle, bool? newChecked,
            int? newLabelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter() when $default != null:
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
    TResult Function(VTask targetTask, String? newTitle, bool? newChecked,
            int? newLabelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter():
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
    TResult? Function(VTask targetTask, String? newTitle, bool? newChecked,
            int? newLabelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskControlParameter() when $default != null:
        return $default(_that.targetTask, _that.newTitle, _that.newChecked,
            _that.newLabelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TaskControlParameter extends TaskControlParameter {
  const _TaskControlParameter(
      {required this.targetTask,
      this.newTitle,
      this.newChecked,
      this.newLabelId})
      : super._();

  @override
  final VTask targetTask;
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
    return 'TaskControlParameter(targetTask: $targetTask, newTitle: $newTitle, newChecked: $newChecked, newLabelId: $newLabelId)';
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
      {VTask targetTask, String? newTitle, bool? newChecked, int? newLabelId});
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
    Object? targetTask = null,
    Object? newTitle = freezed,
    Object? newChecked = freezed,
    Object? newLabelId = freezed,
  }) {
    return _then(_TaskControlParameter(
      targetTask: null == targetTask
          ? _self.targetTask
          : targetTask // ignore: cast_nullable_to_non_nullable
              as VTask,
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

// dart format on
