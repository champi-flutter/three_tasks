// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ELabel {
  String get title;
  int get labelId;
  List<int> get dailyIdList;
  List<int> get weeklyIdList;
  List<int> get monthlyIdList;
  List<int> get yearlyIdList;

  /// Create a copy of ELabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ELabelCopyWith<ELabel> get copyWith =>
      _$ELabelCopyWithImpl<ELabel>(this as ELabel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ELabel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            const DeepCollectionEquality()
                .equals(other.dailyIdList, dailyIdList) &&
            const DeepCollectionEquality()
                .equals(other.weeklyIdList, weeklyIdList) &&
            const DeepCollectionEquality()
                .equals(other.monthlyIdList, monthlyIdList) &&
            const DeepCollectionEquality()
                .equals(other.yearlyIdList, yearlyIdList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      labelId,
      const DeepCollectionEquality().hash(dailyIdList),
      const DeepCollectionEquality().hash(weeklyIdList),
      const DeepCollectionEquality().hash(monthlyIdList),
      const DeepCollectionEquality().hash(yearlyIdList));

  @override
  String toString() {
    return 'ELabel(title: $title, labelId: $labelId, dailyIdList: $dailyIdList, weeklyIdList: $weeklyIdList, monthlyIdList: $monthlyIdList, yearlyIdList: $yearlyIdList)';
  }
}

/// @nodoc
abstract mixin class $ELabelCopyWith<$Res> {
  factory $ELabelCopyWith(ELabel value, $Res Function(ELabel) _then) =
      _$ELabelCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int labelId,
      List<int> dailyIdList,
      List<int> weeklyIdList,
      List<int> monthlyIdList,
      List<int> yearlyIdList});
}

/// @nodoc
class _$ELabelCopyWithImpl<$Res> implements $ELabelCopyWith<$Res> {
  _$ELabelCopyWithImpl(this._self, this._then);

  final ELabel _self;
  final $Res Function(ELabel) _then;

  /// Create a copy of ELabel
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
              as List<int>,
      weeklyIdList: null == weeklyIdList
          ? _self.weeklyIdList
          : weeklyIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      monthlyIdList: null == monthlyIdList
          ? _self.monthlyIdList
          : monthlyIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      yearlyIdList: null == yearlyIdList
          ? _self.yearlyIdList
          : yearlyIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ELabel].
extension ELabelPatterns on ELabel {
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
    TResult Function(_ELabel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ELabel() when $default != null:
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
    TResult Function(_ELabel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ELabel():
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
    TResult? Function(_ELabel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ELabel() when $default != null:
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
            List<int> dailyIdList,
            List<int> weeklyIdList,
            List<int> monthlyIdList,
            List<int> yearlyIdList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ELabel() when $default != null:
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
            List<int> dailyIdList,
            List<int> weeklyIdList,
            List<int> monthlyIdList,
            List<int> yearlyIdList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ELabel():
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
            List<int> dailyIdList,
            List<int> weeklyIdList,
            List<int> monthlyIdList,
            List<int> yearlyIdList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ELabel() when $default != null:
        return $default(_that.title, _that.labelId, _that.dailyIdList,
            _that.weeklyIdList, _that.monthlyIdList, _that.yearlyIdList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ELabel implements ELabel {
  const _ELabel(
      {required this.title,
      required this.labelId,
      required final List<int> dailyIdList,
      required final List<int> weeklyIdList,
      required final List<int> monthlyIdList,
      required final List<int> yearlyIdList})
      : _dailyIdList = dailyIdList,
        _weeklyIdList = weeklyIdList,
        _monthlyIdList = monthlyIdList,
        _yearlyIdList = yearlyIdList;

  @override
  final String title;
  @override
  final int labelId;
  final List<int> _dailyIdList;
  @override
  List<int> get dailyIdList {
    if (_dailyIdList is EqualUnmodifiableListView) return _dailyIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyIdList);
  }

  final List<int> _weeklyIdList;
  @override
  List<int> get weeklyIdList {
    if (_weeklyIdList is EqualUnmodifiableListView) return _weeklyIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyIdList);
  }

  final List<int> _monthlyIdList;
  @override
  List<int> get monthlyIdList {
    if (_monthlyIdList is EqualUnmodifiableListView) return _monthlyIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyIdList);
  }

  final List<int> _yearlyIdList;
  @override
  List<int> get yearlyIdList {
    if (_yearlyIdList is EqualUnmodifiableListView) return _yearlyIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yearlyIdList);
  }

  /// Create a copy of ELabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ELabelCopyWith<_ELabel> get copyWith =>
      __$ELabelCopyWithImpl<_ELabel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ELabel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            const DeepCollectionEquality()
                .equals(other._dailyIdList, _dailyIdList) &&
            const DeepCollectionEquality()
                .equals(other._weeklyIdList, _weeklyIdList) &&
            const DeepCollectionEquality()
                .equals(other._monthlyIdList, _monthlyIdList) &&
            const DeepCollectionEquality()
                .equals(other._yearlyIdList, _yearlyIdList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      labelId,
      const DeepCollectionEquality().hash(_dailyIdList),
      const DeepCollectionEquality().hash(_weeklyIdList),
      const DeepCollectionEquality().hash(_monthlyIdList),
      const DeepCollectionEquality().hash(_yearlyIdList));

  @override
  String toString() {
    return 'ELabel(title: $title, labelId: $labelId, dailyIdList: $dailyIdList, weeklyIdList: $weeklyIdList, monthlyIdList: $monthlyIdList, yearlyIdList: $yearlyIdList)';
  }
}

/// @nodoc
abstract mixin class _$ELabelCopyWith<$Res> implements $ELabelCopyWith<$Res> {
  factory _$ELabelCopyWith(_ELabel value, $Res Function(_ELabel) _then) =
      __$ELabelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int labelId,
      List<int> dailyIdList,
      List<int> weeklyIdList,
      List<int> monthlyIdList,
      List<int> yearlyIdList});
}

/// @nodoc
class __$ELabelCopyWithImpl<$Res> implements _$ELabelCopyWith<$Res> {
  __$ELabelCopyWithImpl(this._self, this._then);

  final _ELabel _self;
  final $Res Function(_ELabel) _then;

  /// Create a copy of ELabel
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
    return _then(_ELabel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyIdList: null == dailyIdList
          ? _self._dailyIdList
          : dailyIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weeklyIdList: null == weeklyIdList
          ? _self._weeklyIdList
          : weeklyIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      monthlyIdList: null == monthlyIdList
          ? _self._monthlyIdList
          : monthlyIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      yearlyIdList: null == yearlyIdList
          ? _self._yearlyIdList
          : yearlyIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

// dart format on
