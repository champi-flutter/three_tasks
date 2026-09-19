// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'label_control_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabelControlParameter {
  int get targetLabelId;
  String? get newTitle;
  int? get newDailyId;
  int? get newWeeklyId;
  int? get newMonthlyId;
  int? get newYearlyId;

  /// Create a copy of LabelControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabelControlParameterCopyWith<LabelControlParameter> get copyWith =>
      _$LabelControlParameterCopyWithImpl<LabelControlParameter>(
          this as LabelControlParameter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabelControlParameter &&
            (identical(other.targetLabelId, targetLabelId) ||
                other.targetLabelId == targetLabelId) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newDailyId, newDailyId) ||
                other.newDailyId == newDailyId) &&
            (identical(other.newWeeklyId, newWeeklyId) ||
                other.newWeeklyId == newWeeklyId) &&
            (identical(other.newMonthlyId, newMonthlyId) ||
                other.newMonthlyId == newMonthlyId) &&
            (identical(other.newYearlyId, newYearlyId) ||
                other.newYearlyId == newYearlyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, targetLabelId, newTitle,
      newDailyId, newWeeklyId, newMonthlyId, newYearlyId);

  @override
  String toString() {
    return 'LabelControlParameter(targetLabelId: $targetLabelId, newTitle: $newTitle, newDailyId: $newDailyId, newWeeklyId: $newWeeklyId, newMonthlyId: $newMonthlyId, newYearlyId: $newYearlyId)';
  }
}

/// @nodoc
abstract mixin class $LabelControlParameterCopyWith<$Res> {
  factory $LabelControlParameterCopyWith(LabelControlParameter value,
          $Res Function(LabelControlParameter) _then) =
      _$LabelControlParameterCopyWithImpl;
  @useResult
  $Res call(
      {int targetLabelId,
      String? newTitle,
      int? newDailyId,
      int? newWeeklyId,
      int? newMonthlyId,
      int? newYearlyId});
}

/// @nodoc
class _$LabelControlParameterCopyWithImpl<$Res>
    implements $LabelControlParameterCopyWith<$Res> {
  _$LabelControlParameterCopyWithImpl(this._self, this._then);

  final LabelControlParameter _self;
  final $Res Function(LabelControlParameter) _then;

  /// Create a copy of LabelControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetLabelId = null,
    Object? newTitle = freezed,
    Object? newDailyId = freezed,
    Object? newWeeklyId = freezed,
    Object? newMonthlyId = freezed,
    Object? newYearlyId = freezed,
  }) {
    return _then(_self.copyWith(
      targetLabelId: null == targetLabelId
          ? _self.targetLabelId
          : targetLabelId // ignore: cast_nullable_to_non_nullable
              as int,
      newTitle: freezed == newTitle
          ? _self.newTitle
          : newTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newDailyId: freezed == newDailyId
          ? _self.newDailyId
          : newDailyId // ignore: cast_nullable_to_non_nullable
              as int?,
      newWeeklyId: freezed == newWeeklyId
          ? _self.newWeeklyId
          : newWeeklyId // ignore: cast_nullable_to_non_nullable
              as int?,
      newMonthlyId: freezed == newMonthlyId
          ? _self.newMonthlyId
          : newMonthlyId // ignore: cast_nullable_to_non_nullable
              as int?,
      newYearlyId: freezed == newYearlyId
          ? _self.newYearlyId
          : newYearlyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LabelControlParameter].
extension LabelControlParameterPatterns on LabelControlParameter {
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
    TResult Function(_LabelControlParameter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabelControlParameter() when $default != null:
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
    TResult Function(_LabelControlParameter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabelControlParameter():
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
    TResult? Function(_LabelControlParameter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabelControlParameter() when $default != null:
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
    TResult Function(int targetLabelId, String? newTitle, int? newDailyId,
            int? newWeeklyId, int? newMonthlyId, int? newYearlyId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabelControlParameter() when $default != null:
        return $default(_that.targetLabelId, _that.newTitle, _that.newDailyId,
            _that.newWeeklyId, _that.newMonthlyId, _that.newYearlyId);
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
    TResult Function(int targetLabelId, String? newTitle, int? newDailyId,
            int? newWeeklyId, int? newMonthlyId, int? newYearlyId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabelControlParameter():
        return $default(_that.targetLabelId, _that.newTitle, _that.newDailyId,
            _that.newWeeklyId, _that.newMonthlyId, _that.newYearlyId);
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
    TResult? Function(int targetLabelId, String? newTitle, int? newDailyId,
            int? newWeeklyId, int? newMonthlyId, int? newYearlyId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabelControlParameter() when $default != null:
        return $default(_that.targetLabelId, _that.newTitle, _that.newDailyId,
            _that.newWeeklyId, _that.newMonthlyId, _that.newYearlyId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LabelControlParameter extends LabelControlParameter {
  const _LabelControlParameter(
      {required this.targetLabelId,
      this.newTitle,
      this.newDailyId,
      this.newWeeklyId,
      this.newMonthlyId,
      this.newYearlyId})
      : super._();

  @override
  final int targetLabelId;
  @override
  final String? newTitle;
  @override
  final int? newDailyId;
  @override
  final int? newWeeklyId;
  @override
  final int? newMonthlyId;
  @override
  final int? newYearlyId;

  /// Create a copy of LabelControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LabelControlParameterCopyWith<_LabelControlParameter> get copyWith =>
      __$LabelControlParameterCopyWithImpl<_LabelControlParameter>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LabelControlParameter &&
            (identical(other.targetLabelId, targetLabelId) ||
                other.targetLabelId == targetLabelId) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newDailyId, newDailyId) ||
                other.newDailyId == newDailyId) &&
            (identical(other.newWeeklyId, newWeeklyId) ||
                other.newWeeklyId == newWeeklyId) &&
            (identical(other.newMonthlyId, newMonthlyId) ||
                other.newMonthlyId == newMonthlyId) &&
            (identical(other.newYearlyId, newYearlyId) ||
                other.newYearlyId == newYearlyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, targetLabelId, newTitle,
      newDailyId, newWeeklyId, newMonthlyId, newYearlyId);

  @override
  String toString() {
    return 'LabelControlParameter(targetLabelId: $targetLabelId, newTitle: $newTitle, newDailyId: $newDailyId, newWeeklyId: $newWeeklyId, newMonthlyId: $newMonthlyId, newYearlyId: $newYearlyId)';
  }
}

/// @nodoc
abstract mixin class _$LabelControlParameterCopyWith<$Res>
    implements $LabelControlParameterCopyWith<$Res> {
  factory _$LabelControlParameterCopyWith(_LabelControlParameter value,
          $Res Function(_LabelControlParameter) _then) =
      __$LabelControlParameterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int targetLabelId,
      String? newTitle,
      int? newDailyId,
      int? newWeeklyId,
      int? newMonthlyId,
      int? newYearlyId});
}

/// @nodoc
class __$LabelControlParameterCopyWithImpl<$Res>
    implements _$LabelControlParameterCopyWith<$Res> {
  __$LabelControlParameterCopyWithImpl(this._self, this._then);

  final _LabelControlParameter _self;
  final $Res Function(_LabelControlParameter) _then;

  /// Create a copy of LabelControlParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? targetLabelId = null,
    Object? newTitle = freezed,
    Object? newDailyId = freezed,
    Object? newWeeklyId = freezed,
    Object? newMonthlyId = freezed,
    Object? newYearlyId = freezed,
  }) {
    return _then(_LabelControlParameter(
      targetLabelId: null == targetLabelId
          ? _self.targetLabelId
          : targetLabelId // ignore: cast_nullable_to_non_nullable
              as int,
      newTitle: freezed == newTitle
          ? _self.newTitle
          : newTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newDailyId: freezed == newDailyId
          ? _self.newDailyId
          : newDailyId // ignore: cast_nullable_to_non_nullable
              as int?,
      newWeeklyId: freezed == newWeeklyId
          ? _self.newWeeklyId
          : newWeeklyId // ignore: cast_nullable_to_non_nullable
              as int?,
      newMonthlyId: freezed == newMonthlyId
          ? _self.newMonthlyId
          : newMonthlyId // ignore: cast_nullable_to_non_nullable
              as int?,
      newYearlyId: freezed == newYearlyId
          ? _self.newYearlyId
          : newYearlyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
