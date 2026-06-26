// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkable_task_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckableTaskController {
  bool get isChecked;
  TextEditingController get titleController;

  /// Create a copy of CheckableTaskController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckableTaskControllerCopyWith<CheckableTaskController> get copyWith =>
      _$CheckableTaskControllerCopyWithImpl<CheckableTaskController>(
          this as CheckableTaskController, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckableTaskController &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.titleController, titleController) ||
                other.titleController == titleController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isChecked, titleController);

  @override
  String toString() {
    return 'CheckableTaskController(isChecked: $isChecked, titleController: $titleController)';
  }
}

/// @nodoc
abstract mixin class $CheckableTaskControllerCopyWith<$Res> {
  factory $CheckableTaskControllerCopyWith(CheckableTaskController value,
          $Res Function(CheckableTaskController) _then) =
      _$CheckableTaskControllerCopyWithImpl;
  @useResult
  $Res call({bool isChecked, TextEditingController titleController});
}

/// @nodoc
class _$CheckableTaskControllerCopyWithImpl<$Res>
    implements $CheckableTaskControllerCopyWith<$Res> {
  _$CheckableTaskControllerCopyWithImpl(this._self, this._then);

  final CheckableTaskController _self;
  final $Res Function(CheckableTaskController) _then;

  /// Create a copy of CheckableTaskController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
    Object? titleController = null,
  }) {
    return _then(_self.copyWith(
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      titleController: null == titleController
          ? _self.titleController
          : titleController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// Adds pattern-matching-related methods to [CheckableTaskController].
extension CheckableTaskControllerPatterns on CheckableTaskController {
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
    TResult Function(_CheckableTaskController value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckableTaskController() when $default != null:
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
    TResult Function(_CheckableTaskController value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckableTaskController():
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
    TResult? Function(_CheckableTaskController value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckableTaskController() when $default != null:
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
    TResult Function(bool isChecked, TextEditingController titleController)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckableTaskController() when $default != null:
        return $default(_that.isChecked, _that.titleController);
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
    TResult Function(bool isChecked, TextEditingController titleController)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckableTaskController():
        return $default(_that.isChecked, _that.titleController);
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
    TResult? Function(bool isChecked, TextEditingController titleController)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckableTaskController() when $default != null:
        return $default(_that.isChecked, _that.titleController);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckableTaskController implements CheckableTaskController {
  const _CheckableTaskController(
      {required this.isChecked, required this.titleController});

  @override
  final bool isChecked;
  @override
  final TextEditingController titleController;

  /// Create a copy of CheckableTaskController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckableTaskControllerCopyWith<_CheckableTaskController> get copyWith =>
      __$CheckableTaskControllerCopyWithImpl<_CheckableTaskController>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckableTaskController &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.titleController, titleController) ||
                other.titleController == titleController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isChecked, titleController);

  @override
  String toString() {
    return 'CheckableTaskController(isChecked: $isChecked, titleController: $titleController)';
  }
}

/// @nodoc
abstract mixin class _$CheckableTaskControllerCopyWith<$Res>
    implements $CheckableTaskControllerCopyWith<$Res> {
  factory _$CheckableTaskControllerCopyWith(_CheckableTaskController value,
          $Res Function(_CheckableTaskController) _then) =
      __$CheckableTaskControllerCopyWithImpl;
  @override
  @useResult
  $Res call({bool isChecked, TextEditingController titleController});
}

/// @nodoc
class __$CheckableTaskControllerCopyWithImpl<$Res>
    implements _$CheckableTaskControllerCopyWith<$Res> {
  __$CheckableTaskControllerCopyWithImpl(this._self, this._then);

  final _CheckableTaskController _self;
  final $Res Function(_CheckableTaskController) _then;

  /// Create a copy of CheckableTaskController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isChecked = null,
    Object? titleController = null,
  }) {
    return _then(_CheckableTaskController(
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      titleController: null == titleController
          ? _self.titleController
          : titleController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

// dart format on
