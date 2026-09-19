// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'q_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QDailyTask {
  String get title;
  int get dateInt;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of QDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QDailyTaskCopyWith<QDailyTask> get copyWith =>
      _$QDailyTaskCopyWithImpl<QDailyTask>(this as QDailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dateInt, dateInt) || other.dateInt == dateInt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, dateInt, id, isChecked, labelId);

  @override
  String toString() {
    return 'QDailyTask(title: $title, dateInt: $dateInt, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $QDailyTaskCopyWith<$Res> {
  factory $QDailyTaskCopyWith(
          QDailyTask value, $Res Function(QDailyTask) _then) =
      _$QDailyTaskCopyWithImpl;
  @useResult
  $Res call({String title, int dateInt, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$QDailyTaskCopyWithImpl<$Res> implements $QDailyTaskCopyWith<$Res> {
  _$QDailyTaskCopyWithImpl(this._self, this._then);

  final QDailyTask _self;
  final $Res Function(QDailyTask) _then;

  /// Create a copy of QDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dateInt = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateInt: null == dateInt
          ? _self.dateInt
          : dateInt // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [QDailyTask].
extension QDailyTaskPatterns on QDailyTask {
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
    TResult Function(_QDailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QDailyTask() when $default != null:
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
    TResult Function(_QDailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QDailyTask():
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
    TResult? Function(_QDailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QDailyTask() when $default != null:
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
            String title, int dateInt, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QDailyTask() when $default != null:
        return $default(_that.title, _that.dateInt, _that.id, _that.isChecked,
            _that.labelId);
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
            String title, int dateInt, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QDailyTask():
        return $default(_that.title, _that.dateInt, _that.id, _that.isChecked,
            _that.labelId);
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
            String title, int dateInt, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QDailyTask() when $default != null:
        return $default(_that.title, _that.dateInt, _that.id, _that.isChecked,
            _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QDailyTask extends QDailyTask {
  const _QDailyTask(
      {required this.title,
      required this.dateInt,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String title;
  @override
  final int dateInt;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;

  /// Create a copy of QDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QDailyTaskCopyWith<_QDailyTask> get copyWith =>
      __$QDailyTaskCopyWithImpl<_QDailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dateInt, dateInt) || other.dateInt == dateInt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, dateInt, id, isChecked, labelId);

  @override
  String toString() {
    return 'QDailyTask(title: $title, dateInt: $dateInt, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$QDailyTaskCopyWith<$Res>
    implements $QDailyTaskCopyWith<$Res> {
  factory _$QDailyTaskCopyWith(
          _QDailyTask value, $Res Function(_QDailyTask) _then) =
      __$QDailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int dateInt, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$QDailyTaskCopyWithImpl<$Res> implements _$QDailyTaskCopyWith<$Res> {
  __$QDailyTaskCopyWithImpl(this._self, this._then);

  final _QDailyTask _self;
  final $Res Function(_QDailyTask) _then;

  /// Create a copy of QDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? dateInt = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_QDailyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateInt: null == dateInt
          ? _self.dateInt
          : dateInt // ignore: cast_nullable_to_non_nullable
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

/// @nodoc
mixin _$QWeeklyTask {
  String get title;
  int get firstDateInt;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of QWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QWeeklyTaskCopyWith<QWeeklyTask> get copyWith =>
      _$QWeeklyTaskCopyWithImpl<QWeeklyTask>(this as QWeeklyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstDateInt, firstDateInt) ||
                other.firstDateInt == firstDateInt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, firstDateInt, id, isChecked, labelId);

  @override
  String toString() {
    return 'QWeeklyTask(title: $title, firstDateInt: $firstDateInt, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $QWeeklyTaskCopyWith<$Res> {
  factory $QWeeklyTaskCopyWith(
          QWeeklyTask value, $Res Function(QWeeklyTask) _then) =
      _$QWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title, int firstDateInt, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$QWeeklyTaskCopyWithImpl<$Res> implements $QWeeklyTaskCopyWith<$Res> {
  _$QWeeklyTaskCopyWithImpl(this._self, this._then);

  final QWeeklyTask _self;
  final $Res Function(QWeeklyTask) _then;

  /// Create a copy of QWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? firstDateInt = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstDateInt: null == firstDateInt
          ? _self.firstDateInt
          : firstDateInt // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [QWeeklyTask].
extension QWeeklyTaskPatterns on QWeeklyTask {
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
    TResult Function(_QWeeklyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QWeeklyTask() when $default != null:
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
    TResult Function(_QWeeklyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QWeeklyTask():
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
    TResult? Function(_QWeeklyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QWeeklyTask() when $default != null:
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
    TResult Function(String title, int firstDateInt, int id, bool isChecked,
            int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QWeeklyTask() when $default != null:
        return $default(_that.title, _that.firstDateInt, _that.id,
            _that.isChecked, _that.labelId);
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
            String title, int firstDateInt, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QWeeklyTask():
        return $default(_that.title, _that.firstDateInt, _that.id,
            _that.isChecked, _that.labelId);
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
    TResult? Function(String title, int firstDateInt, int id, bool isChecked,
            int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QWeeklyTask() when $default != null:
        return $default(_that.title, _that.firstDateInt, _that.id,
            _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QWeeklyTask extends QWeeklyTask {
  const _QWeeklyTask(
      {required this.title,
      required this.firstDateInt,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String title;
  @override
  final int firstDateInt;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;

  /// Create a copy of QWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QWeeklyTaskCopyWith<_QWeeklyTask> get copyWith =>
      __$QWeeklyTaskCopyWithImpl<_QWeeklyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QWeeklyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstDateInt, firstDateInt) ||
                other.firstDateInt == firstDateInt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, firstDateInt, id, isChecked, labelId);

  @override
  String toString() {
    return 'QWeeklyTask(title: $title, firstDateInt: $firstDateInt, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$QWeeklyTaskCopyWith<$Res>
    implements $QWeeklyTaskCopyWith<$Res> {
  factory _$QWeeklyTaskCopyWith(
          _QWeeklyTask value, $Res Function(_QWeeklyTask) _then) =
      __$QWeeklyTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title, int firstDateInt, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$QWeeklyTaskCopyWithImpl<$Res> implements _$QWeeklyTaskCopyWith<$Res> {
  __$QWeeklyTaskCopyWithImpl(this._self, this._then);

  final _QWeeklyTask _self;
  final $Res Function(_QWeeklyTask) _then;

  /// Create a copy of QWeeklyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? firstDateInt = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_QWeeklyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstDateInt: null == firstDateInt
          ? _self.firstDateInt
          : firstDateInt // ignore: cast_nullable_to_non_nullable
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

/// @nodoc
mixin _$QMonthlyTask {
  String get title;
  int get monthInt;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of QMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QMonthlyTaskCopyWith<QMonthlyTask> get copyWith =>
      _$QMonthlyTaskCopyWithImpl<QMonthlyTask>(
          this as QMonthlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.monthInt, monthInt) ||
                other.monthInt == monthInt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, monthInt, id, isChecked, labelId);

  @override
  String toString() {
    return 'QMonthlyTask(title: $title, monthInt: $monthInt, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $QMonthlyTaskCopyWith<$Res> {
  factory $QMonthlyTaskCopyWith(
          QMonthlyTask value, $Res Function(QMonthlyTask) _then) =
      _$QMonthlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, int monthInt, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$QMonthlyTaskCopyWithImpl<$Res> implements $QMonthlyTaskCopyWith<$Res> {
  _$QMonthlyTaskCopyWithImpl(this._self, this._then);

  final QMonthlyTask _self;
  final $Res Function(QMonthlyTask) _then;

  /// Create a copy of QMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? monthInt = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      monthInt: null == monthInt
          ? _self.monthInt
          : monthInt // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [QMonthlyTask].
extension QMonthlyTaskPatterns on QMonthlyTask {
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
    TResult Function(_QMonthlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QMonthlyTask() when $default != null:
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
    TResult Function(_QMonthlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QMonthlyTask():
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
    TResult? Function(_QMonthlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QMonthlyTask() when $default != null:
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
            String title, int monthInt, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QMonthlyTask() when $default != null:
        return $default(_that.title, _that.monthInt, _that.id, _that.isChecked,
            _that.labelId);
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
            String title, int monthInt, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QMonthlyTask():
        return $default(_that.title, _that.monthInt, _that.id, _that.isChecked,
            _that.labelId);
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
            String title, int monthInt, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QMonthlyTask() when $default != null:
        return $default(_that.title, _that.monthInt, _that.id, _that.isChecked,
            _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QMonthlyTask extends QMonthlyTask {
  const _QMonthlyTask(
      {required this.title,
      required this.monthInt,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String title;
  @override
  final int monthInt;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;

  /// Create a copy of QMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QMonthlyTaskCopyWith<_QMonthlyTask> get copyWith =>
      __$QMonthlyTaskCopyWithImpl<_QMonthlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QMonthlyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.monthInt, monthInt) ||
                other.monthInt == monthInt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, monthInt, id, isChecked, labelId);

  @override
  String toString() {
    return 'QMonthlyTask(title: $title, monthInt: $monthInt, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$QMonthlyTaskCopyWith<$Res>
    implements $QMonthlyTaskCopyWith<$Res> {
  factory _$QMonthlyTaskCopyWith(
          _QMonthlyTask value, $Res Function(_QMonthlyTask) _then) =
      __$QMonthlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int monthInt, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$QMonthlyTaskCopyWithImpl<$Res>
    implements _$QMonthlyTaskCopyWith<$Res> {
  __$QMonthlyTaskCopyWithImpl(this._self, this._then);

  final _QMonthlyTask _self;
  final $Res Function(_QMonthlyTask) _then;

  /// Create a copy of QMonthlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? monthInt = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_QMonthlyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      monthInt: null == monthInt
          ? _self.monthInt
          : monthInt // ignore: cast_nullable_to_non_nullable
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

/// @nodoc
mixin _$QYearlyTask {
  String get title;
  int get year;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of QYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QYearlyTaskCopyWith<QYearlyTask> get copyWith =>
      _$QYearlyTaskCopyWithImpl<QYearlyTask>(this as QYearlyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QYearlyTask &&
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
    return 'QYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $QYearlyTaskCopyWith<$Res> {
  factory $QYearlyTaskCopyWith(
          QYearlyTask value, $Res Function(QYearlyTask) _then) =
      _$QYearlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, int year, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$QYearlyTaskCopyWithImpl<$Res> implements $QYearlyTaskCopyWith<$Res> {
  _$QYearlyTaskCopyWithImpl(this._self, this._then);

  final QYearlyTask _self;
  final $Res Function(QYearlyTask) _then;

  /// Create a copy of QYearlyTask
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

/// Adds pattern-matching-related methods to [QYearlyTask].
extension QYearlyTaskPatterns on QYearlyTask {
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
    TResult Function(_QYearlyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QYearlyTask() when $default != null:
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
    TResult Function(_QYearlyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QYearlyTask():
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
    TResult? Function(_QYearlyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QYearlyTask() when $default != null:
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
      case _QYearlyTask() when $default != null:
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
      case _QYearlyTask():
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
      case _QYearlyTask() when $default != null:
        return $default(
            _that.title, _that.year, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QYearlyTask extends QYearlyTask {
  const _QYearlyTask(
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

  /// Create a copy of QYearlyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QYearlyTaskCopyWith<_QYearlyTask> get copyWith =>
      __$QYearlyTaskCopyWithImpl<_QYearlyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QYearlyTask &&
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
    return 'QYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$QYearlyTaskCopyWith<$Res>
    implements $QYearlyTaskCopyWith<$Res> {
  factory _$QYearlyTaskCopyWith(
          _QYearlyTask value, $Res Function(_QYearlyTask) _then) =
      __$QYearlyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int year, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$QYearlyTaskCopyWithImpl<$Res> implements _$QYearlyTaskCopyWith<$Res> {
  __$QYearlyTaskCopyWithImpl(this._self, this._then);

  final _QYearlyTask _self;
  final $Res Function(_QYearlyTask) _then;

  /// Create a copy of QYearlyTask
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
    return _then(_QYearlyTask(
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
