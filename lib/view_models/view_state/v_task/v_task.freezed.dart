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
mixin _$VDailyTask {
  String get title;
  Date get date;
  int get id;
  bool get isChecked;
  int get labelId;

  /// Create a copy of VDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VDailyTaskCopyWith<VDailyTask> get copyWith =>
      _$VDailyTaskCopyWithImpl<VDailyTask>(this as VDailyTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, date, id, isChecked, labelId);

  @override
  String toString() {
    return 'VDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $VDailyTaskCopyWith<$Res> {
  factory $VDailyTaskCopyWith(
          VDailyTask value, $Res Function(VDailyTask) _then) =
      _$VDailyTaskCopyWithImpl;
  @useResult
  $Res call({String title, Date date, int id, bool isChecked, int labelId});
}

/// @nodoc
class _$VDailyTaskCopyWithImpl<$Res> implements $VDailyTaskCopyWith<$Res> {
  _$VDailyTaskCopyWithImpl(this._self, this._then);

  final VDailyTask _self;
  final $Res Function(VDailyTask) _then;

  /// Create a copy of VDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [VDailyTask].
extension VDailyTaskPatterns on VDailyTask {
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
    TResult Function(_VDailyTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VDailyTask() when $default != null:
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
    TResult Function(_VDailyTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDailyTask():
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
    TResult? Function(_VDailyTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDailyTask() when $default != null:
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
            String title, Date date, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VDailyTask() when $default != null:
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
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
            String title, Date date, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDailyTask():
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
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
            String title, Date date, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VDailyTask() when $default != null:
        return $default(
            _that.title, _that.date, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VDailyTask extends VDailyTask {
  const _VDailyTask(
      {required this.title,
      required this.date,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String title;
  @override
  final Date date;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;

  /// Create a copy of VDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VDailyTaskCopyWith<_VDailyTask> get copyWith =>
      __$VDailyTaskCopyWithImpl<_VDailyTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VDailyTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, date, id, isChecked, labelId);

  @override
  String toString() {
    return 'VDailyTask(title: $title, date: $date, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class _$VDailyTaskCopyWith<$Res>
    implements $VDailyTaskCopyWith<$Res> {
  factory _$VDailyTaskCopyWith(
          _VDailyTask value, $Res Function(_VDailyTask) _then) =
      __$VDailyTaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, Date date, int id, bool isChecked, int labelId});
}

/// @nodoc
class __$VDailyTaskCopyWithImpl<$Res> implements _$VDailyTaskCopyWith<$Res> {
  __$VDailyTaskCopyWithImpl(this._self, this._then);

  final _VDailyTask _self;
  final $Res Function(_VDailyTask) _then;

  /// Create a copy of VDailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_VDailyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$VWeeklyTask {
  String get title;
  UniqueWeek get week;
  int get id;
  bool get isChecked;
  int get labelId;

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
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, week, id, isChecked, labelId);

  @override
  String toString() {
    return 'VWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $VWeeklyTaskCopyWith<$Res> {
  factory $VWeeklyTaskCopyWith(
          VWeeklyTask value, $Res Function(VWeeklyTask) _then) =
      _$VWeeklyTaskCopyWithImpl;
  @useResult
  $Res call(
      {String title, UniqueWeek week, int id, bool isChecked, int labelId});
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
    Object? title = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
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
    TResult Function(
            String title, UniqueWeek week, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask() when $default != null:
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
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
            String title, UniqueWeek week, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask():
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
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
            String title, UniqueWeek week, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VWeeklyTask() when $default != null:
        return $default(
            _that.title, _that.week, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VWeeklyTask extends VWeeklyTask {
  const _VWeeklyTask(
      {required this.title,
      required this.week,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String title;
  @override
  final UniqueWeek week;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;

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
            (identical(other.title, title) || other.title == title) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, week, id, isChecked, labelId);

  @override
  String toString() {
    return 'VWeeklyTask(title: $title, week: $week, id: $id, isChecked: $isChecked, labelId: $labelId)';
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
  $Res call(
      {String title, UniqueWeek week, int id, bool isChecked, int labelId});
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
    Object? title = null,
    Object? week = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_VWeeklyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$VMonthlyTask {
  String get title;
  Month get month;
  int get id;
  bool get isChecked;
  int get labelId;

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
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, month, id, isChecked, labelId);

  @override
  String toString() {
    return 'VMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $VMonthlyTaskCopyWith<$Res> {
  factory $VMonthlyTaskCopyWith(
          VMonthlyTask value, $Res Function(VMonthlyTask) _then) =
      _$VMonthlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, Month month, int id, bool isChecked, int labelId});
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
    Object? title = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
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
    TResult Function(
            String title, Month month, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask() when $default != null:
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
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
            String title, Month month, int id, bool isChecked, int labelId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask():
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
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
            String title, Month month, int id, bool isChecked, int labelId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VMonthlyTask() when $default != null:
        return $default(
            _that.title, _that.month, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VMonthlyTask extends VMonthlyTask {
  const _VMonthlyTask(
      {required this.title,
      required this.month,
      required this.id,
      required this.isChecked,
      required this.labelId})
      : super._();

  @override
  final String title;
  @override
  final Month month;
  @override
  final int id;
  @override
  final bool isChecked;
  @override
  final int labelId;

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
            (identical(other.title, title) || other.title == title) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.labelId, labelId) || other.labelId == labelId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, month, id, isChecked, labelId);

  @override
  String toString() {
    return 'VMonthlyTask(title: $title, month: $month, id: $id, isChecked: $isChecked, labelId: $labelId)';
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
  $Res call({String title, Month month, int id, bool isChecked, int labelId});
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
    Object? title = null,
    Object? month = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_VMonthlyTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
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
      labelId: null == labelId
          ? _self.labelId
          : labelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$VYearlyTask {
  String get title;
  int get year;
  int get id;
  bool get isChecked;
  int get labelId;

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
    return 'VYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
  }
}

/// @nodoc
abstract mixin class $VYearlyTaskCopyWith<$Res> {
  factory $VYearlyTaskCopyWith(
          VYearlyTask value, $Res Function(VYearlyTask) _then) =
      _$VYearlyTaskCopyWithImpl;
  @useResult
  $Res call({String title, int year, int id, bool isChecked, int labelId});
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
    TResult Function(
            String title, int year, int id, bool isChecked, int labelId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VYearlyTask() when $default != null:
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
      case _VYearlyTask():
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
      case _VYearlyTask() when $default != null:
        return $default(
            _that.title, _that.year, _that.id, _that.isChecked, _that.labelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VYearlyTask extends VYearlyTask {
  const _VYearlyTask(
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
    return 'VYearlyTask(title: $title, year: $year, id: $id, isChecked: $isChecked, labelId: $labelId)';
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
  $Res call({String title, int year, int id, bool isChecked, int labelId});
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
    Object? title = null,
    Object? year = null,
    Object? id = null,
    Object? isChecked = null,
    Object? labelId = null,
  }) {
    return _then(_VYearlyTask(
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
