// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceState _$DeviceStateFromJson(Map<String, dynamic> json) {
  return _DeviceState.fromJson(json);
}

/// @nodoc
mixin _$DeviceState {
  /// The current orientation of the device
  Orientation get orientation => throw _privateConstructorUsedError;

  /// Indicate whether the virtual keyboard is visible.
  bool get isVirtualKeyboardVisible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceStateCopyWith<DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res, DeviceState>;
  @useResult
  $Res call({Orientation orientation, bool isVirtualKeyboardVisible});
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res, $Val extends DeviceState>
    implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orientation = null,
    Object? isVirtualKeyboardVisible = null,
  }) {
    return _then(_value.copyWith(
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      isVirtualKeyboardVisible: null == isVirtualKeyboardVisible
          ? _value.isVirtualKeyboardVisible
          : isVirtualKeyboardVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceStateImplCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$DeviceStateImplCopyWith(
          _$DeviceStateImpl value, $Res Function(_$DeviceStateImpl) then) =
      __$$DeviceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Orientation orientation, bool isVirtualKeyboardVisible});
}

/// @nodoc
class __$$DeviceStateImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$DeviceStateImpl>
    implements _$$DeviceStateImplCopyWith<$Res> {
  __$$DeviceStateImplCopyWithImpl(
      _$DeviceStateImpl _value, $Res Function(_$DeviceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orientation = null,
    Object? isVirtualKeyboardVisible = null,
  }) {
    return _then(_$DeviceStateImpl(
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      isVirtualKeyboardVisible: null == isVirtualKeyboardVisible
          ? _value.isVirtualKeyboardVisible
          : isVirtualKeyboardVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceStateImpl implements _DeviceState {
  const _$DeviceStateImpl(
      {this.orientation = Orientation.portrait,
      this.isVirtualKeyboardVisible = false});

  factory _$DeviceStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceStateImplFromJson(json);

  /// The current orientation of the device
  @override
  @JsonKey()
  final Orientation orientation;

  /// Indicate whether the virtual keyboard is visible.
  @override
  @JsonKey()
  final bool isVirtualKeyboardVisible;

  @override
  String toString() {
    return 'DeviceState(orientation: $orientation, isVirtualKeyboardVisible: $isVirtualKeyboardVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceStateImpl &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(
                    other.isVirtualKeyboardVisible, isVirtualKeyboardVisible) ||
                other.isVirtualKeyboardVisible == isVirtualKeyboardVisible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orientation, isVirtualKeyboardVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceStateImplCopyWith<_$DeviceStateImpl> get copyWith =>
      __$$DeviceStateImplCopyWithImpl<_$DeviceStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceStateImplToJson(
      this,
    );
  }
}

abstract class _DeviceState implements DeviceState {
  const factory _DeviceState(
      {final Orientation orientation,
      final bool isVirtualKeyboardVisible}) = _$DeviceStateImpl;

  factory _DeviceState.fromJson(Map<String, dynamic> json) =
      _$DeviceStateImpl.fromJson;

  @override

  /// The current orientation of the device
  Orientation get orientation;
  @override

  /// Indicate whether the virtual keyboard is visible.
  bool get isVirtualKeyboardVisible;
  @override
  @JsonKey(ignore: true)
  _$$DeviceStateImplCopyWith<_$DeviceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
