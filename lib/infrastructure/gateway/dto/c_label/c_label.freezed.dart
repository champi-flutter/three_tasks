// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'c_label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CLabel {
  String get title;
  int get labelId;
  TaskIdList get dailyIdList;
  TaskIdList get weeklyIdList;
  TaskIdList get monthlyIdList;
  TaskIdList get yearlyIdList;

  /// Create a copy of CLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CLabelCopyWith<CLabel> get copyWith =>
      _$CLabelCopyWithImpl<CLabel>(this as CLabel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CLabel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.dailyIdList, dailyIdList) ||
                other.dailyIdList == dailyIdList) &&
            (identical(other.weeklyIdList, weeklyIdList) ||
                other.weeklyIdList == weeklyIdList) &&
            (identical(other.monthlyIdList, monthlyIdList) ||
                other.monthlyIdList == monthlyIdList) &&
            (identical(other.yearlyIdList, yearlyIdList) ||
                other.yearlyIdList == yearlyIdList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, labelId, dailyIdList,
      weeklyIdList, monthlyIdList, yearlyIdList);

  @override
  String toString() {
    return 'CLabel(title: $title, labelId: $labelId, dailyIdList: $dailyIdList, weeklyIdList: $weeklyIdList, monthlyIdList: $monthlyIdList, yearlyIdList: $yearlyIdList)';
  }
}

/// @nodoc
abstract mixin class $CLabelCopyWith<$Res> {
  factory $CLabelCopyWith(CLabel value, $Res Function(CLabel) _then) =
      _$CLabelCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int labelId,
      TaskIdList dailyIdList,
      TaskIdList weeklyIdList,
      TaskIdList monthlyIdList,
      TaskIdList yearlyIdList});
}

/// @nodoc
class _$CLabelCopyWithImpl<$Res> implements $CLabelCopyWith<$Res> {
  _$CLabelCopyWithImpl(this._self, this._then);

  final CLabel _self;
  final $Res Function(CLabel) _then;

  /// Create a copy of CLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? labelId = null,
    Object? dailyIdList = null,
    Object? weeklyIdList = null,
    Object? monthlyIdList = null,
    Object? yearlyIdList = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyIdList: null == dailyIdList
          ? _self.dailyIdList
          : dailyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
      weeklyIdList: null == weeklyIdList
          ? _self.weeklyIdList
          : weeklyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
      monthlyIdList: null == monthlyIdList
          ? _self.monthlyIdList
          : monthlyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
      yearlyIdList: null == yearlyIdList
          ? _self.yearlyIdList
          : yearlyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
    ));
  }
}

/// Adds pattern-matching-related methods to [CLabel].
extension CLabelPatterns on CLabel {
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
    TResult Function(_CLabel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CLabel() when $default != null:
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
    TResult Function(_CLabel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CLabel():
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
    TResult? Function(_CLabel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CLabel() when $default != null:
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
            String title,
            int labelId,
            TaskIdList dailyIdList,
            TaskIdList weeklyIdList,
            TaskIdList monthlyIdList,
            TaskIdList yearlyIdList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CLabel() when $default != null:
        return $default(_that.title, _that.labelId, _that.dailyIdList,
            _that.weeklyIdList, _that.monthlyIdList, _that.yearlyIdList);
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
            String title,
            int labelId,
            TaskIdList dailyIdList,
            TaskIdList weeklyIdList,
            TaskIdList monthlyIdList,
            TaskIdList yearlyIdList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CLabel():
        return $default(_that.title, _that.labelId, _that.dailyIdList,
            _that.weeklyIdList, _that.monthlyIdList, _that.yearlyIdList);
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
            String title,
            int labelId,
            TaskIdList dailyIdList,
            TaskIdList weeklyIdList,
            TaskIdList monthlyIdList,
            TaskIdList yearlyIdList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CLabel() when $default != null:
        return $default(_that.title, _that.labelId, _that.dailyIdList,
            _that.weeklyIdList, _that.monthlyIdList, _that.yearlyIdList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CLabel extends CLabel {
  const _CLabel(
      {required this.title,
      required this.labelId,
      required this.dailyIdList,
      required this.weeklyIdList,
      required this.monthlyIdList,
      required this.yearlyIdList})
      : super._();

  @override
  final String title;
  @override
  final int labelId;
  @override
  final TaskIdList dailyIdList;
  @override
  final TaskIdList weeklyIdList;
  @override
  final TaskIdList monthlyIdList;
  @override
  final TaskIdList yearlyIdList;

  /// Create a copy of CLabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CLabelCopyWith<_CLabel> get copyWith =>
      __$CLabelCopyWithImpl<_CLabel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CLabel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.dailyIdList, dailyIdList) ||
                other.dailyIdList == dailyIdList) &&
            (identical(other.weeklyIdList, weeklyIdList) ||
                other.weeklyIdList == weeklyIdList) &&
            (identical(other.monthlyIdList, monthlyIdList) ||
                other.monthlyIdList == monthlyIdList) &&
            (identical(other.yearlyIdList, yearlyIdList) ||
                other.yearlyIdList == yearlyIdList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, labelId, dailyIdList,
      weeklyIdList, monthlyIdList, yearlyIdList);

  @override
  String toString() {
    return 'CLabel(title: $title, labelId: $labelId, dailyIdList: $dailyIdList, weeklyIdList: $weeklyIdList, monthlyIdList: $monthlyIdList, yearlyIdList: $yearlyIdList)';
  }
}

/// @nodoc
abstract mixin class _$CLabelCopyWith<$Res> implements $CLabelCopyWith<$Res> {
  factory _$CLabelCopyWith(_CLabel value, $Res Function(_CLabel) _then) =
      __$CLabelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int labelId,
      TaskIdList dailyIdList,
      TaskIdList weeklyIdList,
      TaskIdList monthlyIdList,
      TaskIdList yearlyIdList});
}

/// @nodoc
class __$CLabelCopyWithImpl<$Res> implements _$CLabelCopyWith<$Res> {
  __$CLabelCopyWithImpl(this._self, this._then);

  final _CLabel _self;
  final $Res Function(_CLabel) _then;

  /// Create a copy of CLabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? labelId = null,
    Object? dailyIdList = null,
    Object? weeklyIdList = null,
    Object? monthlyIdList = null,
    Object? yearlyIdList = null,
  }) {
    return _then(_CLabel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyIdList: null == dailyIdList
          ? _self.dailyIdList
          : dailyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
      weeklyIdList: null == weeklyIdList
          ? _self.weeklyIdList
          : weeklyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
      monthlyIdList: null == monthlyIdList
          ? _self.monthlyIdList
          : monthlyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
      yearlyIdList: null == yearlyIdList
          ? _self.yearlyIdList
          : yearlyIdList // ignore: cast_nullable_to_non_nullable
              as TaskIdList,
    ));
  }
}

// dart format on
