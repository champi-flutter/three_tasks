// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'q_label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QLabel {
  String get title;
  int get labelId;
  Int32Blob get dailyId32Blob;
  Int32Blob get weeklyId32Blob;
  Int32Blob get monthlyId32Blob;
  Int32Blob get yearlyId32Blob;

  /// Create a copy of QLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QLabelCopyWith<QLabel> get copyWith =>
      _$QLabelCopyWithImpl<QLabel>(this as QLabel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QLabel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.dailyId32Blob, dailyId32Blob) ||
                other.dailyId32Blob == dailyId32Blob) &&
            (identical(other.weeklyId32Blob, weeklyId32Blob) ||
                other.weeklyId32Blob == weeklyId32Blob) &&
            (identical(other.monthlyId32Blob, monthlyId32Blob) ||
                other.monthlyId32Blob == monthlyId32Blob) &&
            (identical(other.yearlyId32Blob, yearlyId32Blob) ||
                other.yearlyId32Blob == yearlyId32Blob));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, labelId, dailyId32Blob,
      weeklyId32Blob, monthlyId32Blob, yearlyId32Blob);

  @override
  String toString() {
    return 'QLabel(title: $title, labelId: $labelId, dailyId32Blob: $dailyId32Blob, weeklyId32Blob: $weeklyId32Blob, monthlyId32Blob: $monthlyId32Blob, yearlyId32Blob: $yearlyId32Blob)';
  }
}

/// @nodoc
abstract mixin class $QLabelCopyWith<$Res> {
  factory $QLabelCopyWith(QLabel value, $Res Function(QLabel) _then) =
      _$QLabelCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int labelId,
      Int32Blob dailyId32Blob,
      Int32Blob weeklyId32Blob,
      Int32Blob monthlyId32Blob,
      Int32Blob yearlyId32Blob});
}

/// @nodoc
class _$QLabelCopyWithImpl<$Res> implements $QLabelCopyWith<$Res> {
  _$QLabelCopyWithImpl(this._self, this._then);

  final QLabel _self;
  final $Res Function(QLabel) _then;

  /// Create a copy of QLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? labelId = null,
    Object? dailyId32Blob = null,
    Object? weeklyId32Blob = null,
    Object? monthlyId32Blob = null,
    Object? yearlyId32Blob = null,
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
      dailyId32Blob: null == dailyId32Blob
          ? _self.dailyId32Blob
          : dailyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
      weeklyId32Blob: null == weeklyId32Blob
          ? _self.weeklyId32Blob
          : weeklyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
      monthlyId32Blob: null == monthlyId32Blob
          ? _self.monthlyId32Blob
          : monthlyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
      yearlyId32Blob: null == yearlyId32Blob
          ? _self.yearlyId32Blob
          : yearlyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
    ));
  }
}

/// Adds pattern-matching-related methods to [QLabel].
extension QLabelPatterns on QLabel {
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
    TResult Function(_QLabel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QLabel() when $default != null:
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
    TResult Function(_QLabel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QLabel():
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
    TResult? Function(_QLabel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QLabel() when $default != null:
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
            Int32Blob dailyId32Blob,
            Int32Blob weeklyId32Blob,
            Int32Blob monthlyId32Blob,
            Int32Blob yearlyId32Blob)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QLabel() when $default != null:
        return $default(_that.title, _that.labelId, _that.dailyId32Blob,
            _that.weeklyId32Blob, _that.monthlyId32Blob, _that.yearlyId32Blob);
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
            Int32Blob dailyId32Blob,
            Int32Blob weeklyId32Blob,
            Int32Blob monthlyId32Blob,
            Int32Blob yearlyId32Blob)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QLabel():
        return $default(_that.title, _that.labelId, _that.dailyId32Blob,
            _that.weeklyId32Blob, _that.monthlyId32Blob, _that.yearlyId32Blob);
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
            Int32Blob dailyId32Blob,
            Int32Blob weeklyId32Blob,
            Int32Blob monthlyId32Blob,
            Int32Blob yearlyId32Blob)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QLabel() when $default != null:
        return $default(_that.title, _that.labelId, _that.dailyId32Blob,
            _that.weeklyId32Blob, _that.monthlyId32Blob, _that.yearlyId32Blob);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QLabel extends QLabel {
  const _QLabel(
      {required this.title,
      required this.labelId,
      required this.dailyId32Blob,
      required this.weeklyId32Blob,
      required this.monthlyId32Blob,
      required this.yearlyId32Blob})
      : super._();

  @override
  final String title;
  @override
  final int labelId;
  @override
  final Int32Blob dailyId32Blob;
  @override
  final Int32Blob weeklyId32Blob;
  @override
  final Int32Blob monthlyId32Blob;
  @override
  final Int32Blob yearlyId32Blob;

  /// Create a copy of QLabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QLabelCopyWith<_QLabel> get copyWith =>
      __$QLabelCopyWithImpl<_QLabel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QLabel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.labelId, labelId) || other.labelId == labelId) &&
            (identical(other.dailyId32Blob, dailyId32Blob) ||
                other.dailyId32Blob == dailyId32Blob) &&
            (identical(other.weeklyId32Blob, weeklyId32Blob) ||
                other.weeklyId32Blob == weeklyId32Blob) &&
            (identical(other.monthlyId32Blob, monthlyId32Blob) ||
                other.monthlyId32Blob == monthlyId32Blob) &&
            (identical(other.yearlyId32Blob, yearlyId32Blob) ||
                other.yearlyId32Blob == yearlyId32Blob));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, labelId, dailyId32Blob,
      weeklyId32Blob, monthlyId32Blob, yearlyId32Blob);

  @override
  String toString() {
    return 'QLabel(title: $title, labelId: $labelId, dailyId32Blob: $dailyId32Blob, weeklyId32Blob: $weeklyId32Blob, monthlyId32Blob: $monthlyId32Blob, yearlyId32Blob: $yearlyId32Blob)';
  }
}

/// @nodoc
abstract mixin class _$QLabelCopyWith<$Res> implements $QLabelCopyWith<$Res> {
  factory _$QLabelCopyWith(_QLabel value, $Res Function(_QLabel) _then) =
      __$QLabelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int labelId,
      Int32Blob dailyId32Blob,
      Int32Blob weeklyId32Blob,
      Int32Blob monthlyId32Blob,
      Int32Blob yearlyId32Blob});
}

/// @nodoc
class __$QLabelCopyWithImpl<$Res> implements _$QLabelCopyWith<$Res> {
  __$QLabelCopyWithImpl(this._self, this._then);

  final _QLabel _self;
  final $Res Function(_QLabel) _then;

  /// Create a copy of QLabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? labelId = null,
    Object? dailyId32Blob = null,
    Object? weeklyId32Blob = null,
    Object? monthlyId32Blob = null,
    Object? yearlyId32Blob = null,
  }) {
    return _then(_QLabel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyId32Blob: null == dailyId32Blob
          ? _self.dailyId32Blob
          : dailyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
      weeklyId32Blob: null == weeklyId32Blob
          ? _self.weeklyId32Blob
          : weeklyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
      monthlyId32Blob: null == monthlyId32Blob
          ? _self.monthlyId32Blob
          : monthlyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
      yearlyId32Blob: null == yearlyId32Blob
          ? _self.yearlyId32Blob
          : yearlyId32Blob // ignore: cast_nullable_to_non_nullable
              as Int32Blob,
    ));
  }
}

// dart format on
