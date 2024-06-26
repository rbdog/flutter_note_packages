// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frame_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceFrameStyle {
  DeviceKeyboardStyle get keyboardStyle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceFrameStyleCopyWith<DeviceFrameStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceFrameStyleCopyWith<$Res> {
  factory $DeviceFrameStyleCopyWith(
          DeviceFrameStyle value, $Res Function(DeviceFrameStyle) then) =
      _$DeviceFrameStyleCopyWithImpl<$Res, DeviceFrameStyle>;
  @useResult
  $Res call({DeviceKeyboardStyle keyboardStyle});

  $DeviceKeyboardStyleCopyWith<$Res> get keyboardStyle;
}

/// @nodoc
class _$DeviceFrameStyleCopyWithImpl<$Res, $Val extends DeviceFrameStyle>
    implements $DeviceFrameStyleCopyWith<$Res> {
  _$DeviceFrameStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyboardStyle = null,
  }) {
    return _then(_value.copyWith(
      keyboardStyle: null == keyboardStyle
          ? _value.keyboardStyle
          : keyboardStyle // ignore: cast_nullable_to_non_nullable
              as DeviceKeyboardStyle,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceKeyboardStyleCopyWith<$Res> get keyboardStyle {
    return $DeviceKeyboardStyleCopyWith<$Res>(_value.keyboardStyle, (value) {
      return _then(_value.copyWith(keyboardStyle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceFrameStyleImplCopyWith<$Res>
    implements $DeviceFrameStyleCopyWith<$Res> {
  factory _$$DeviceFrameStyleImplCopyWith(_$DeviceFrameStyleImpl value,
          $Res Function(_$DeviceFrameStyleImpl) then) =
      __$$DeviceFrameStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DeviceKeyboardStyle keyboardStyle});

  @override
  $DeviceKeyboardStyleCopyWith<$Res> get keyboardStyle;
}

/// @nodoc
class __$$DeviceFrameStyleImplCopyWithImpl<$Res>
    extends _$DeviceFrameStyleCopyWithImpl<$Res, _$DeviceFrameStyleImpl>
    implements _$$DeviceFrameStyleImplCopyWith<$Res> {
  __$$DeviceFrameStyleImplCopyWithImpl(_$DeviceFrameStyleImpl _value,
      $Res Function(_$DeviceFrameStyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyboardStyle = null,
  }) {
    return _then(_$DeviceFrameStyleImpl(
      keyboardStyle: null == keyboardStyle
          ? _value.keyboardStyle
          : keyboardStyle // ignore: cast_nullable_to_non_nullable
              as DeviceKeyboardStyle,
    ));
  }
}

/// @nodoc

class _$DeviceFrameStyleImpl
    with DiagnosticableTreeMixin
    implements _DeviceFrameStyle {
  const _$DeviceFrameStyleImpl({required this.keyboardStyle});

  @override
  final DeviceKeyboardStyle keyboardStyle;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeviceFrameStyle(keyboardStyle: $keyboardStyle)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeviceFrameStyle'))
      ..add(DiagnosticsProperty('keyboardStyle', keyboardStyle));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceFrameStyleImpl &&
            (identical(other.keyboardStyle, keyboardStyle) ||
                other.keyboardStyle == keyboardStyle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyboardStyle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceFrameStyleImplCopyWith<_$DeviceFrameStyleImpl> get copyWith =>
      __$$DeviceFrameStyleImplCopyWithImpl<_$DeviceFrameStyleImpl>(
          this, _$identity);
}

abstract class _DeviceFrameStyle implements DeviceFrameStyle {
  const factory _DeviceFrameStyle(
          {required final DeviceKeyboardStyle keyboardStyle}) =
      _$DeviceFrameStyleImpl;

  @override
  DeviceKeyboardStyle get keyboardStyle;
  @override
  @JsonKey(ignore: true)
  _$$DeviceFrameStyleImplCopyWith<_$DeviceFrameStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeviceKeyboardStyle {
  Color get backgroundColor => throw _privateConstructorUsedError;
  Color get button1BackgroundColor => throw _privateConstructorUsedError;
  Color get button1ForegroundColor => throw _privateConstructorUsedError;
  Color get button2BackgroundColor => throw _privateConstructorUsedError;
  Color get button2ForegroundColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceKeyboardStyleCopyWith<DeviceKeyboardStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceKeyboardStyleCopyWith<$Res> {
  factory $DeviceKeyboardStyleCopyWith(
          DeviceKeyboardStyle value, $Res Function(DeviceKeyboardStyle) then) =
      _$DeviceKeyboardStyleCopyWithImpl<$Res, DeviceKeyboardStyle>;
  @useResult
  $Res call(
      {Color backgroundColor,
      Color button1BackgroundColor,
      Color button1ForegroundColor,
      Color button2BackgroundColor,
      Color button2ForegroundColor});
}

/// @nodoc
class _$DeviceKeyboardStyleCopyWithImpl<$Res, $Val extends DeviceKeyboardStyle>
    implements $DeviceKeyboardStyleCopyWith<$Res> {
  _$DeviceKeyboardStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? button1BackgroundColor = null,
    Object? button1ForegroundColor = null,
    Object? button2BackgroundColor = null,
    Object? button2ForegroundColor = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button1BackgroundColor: null == button1BackgroundColor
          ? _value.button1BackgroundColor
          : button1BackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button1ForegroundColor: null == button1ForegroundColor
          ? _value.button1ForegroundColor
          : button1ForegroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button2BackgroundColor: null == button2BackgroundColor
          ? _value.button2BackgroundColor
          : button2BackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button2ForegroundColor: null == button2ForegroundColor
          ? _value.button2ForegroundColor
          : button2ForegroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceKeyboardStyleImplCopyWith<$Res>
    implements $DeviceKeyboardStyleCopyWith<$Res> {
  factory _$$DeviceKeyboardStyleImplCopyWith(_$DeviceKeyboardStyleImpl value,
          $Res Function(_$DeviceKeyboardStyleImpl) then) =
      __$$DeviceKeyboardStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Color backgroundColor,
      Color button1BackgroundColor,
      Color button1ForegroundColor,
      Color button2BackgroundColor,
      Color button2ForegroundColor});
}

/// @nodoc
class __$$DeviceKeyboardStyleImplCopyWithImpl<$Res>
    extends _$DeviceKeyboardStyleCopyWithImpl<$Res, _$DeviceKeyboardStyleImpl>
    implements _$$DeviceKeyboardStyleImplCopyWith<$Res> {
  __$$DeviceKeyboardStyleImplCopyWithImpl(_$DeviceKeyboardStyleImpl _value,
      $Res Function(_$DeviceKeyboardStyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? button1BackgroundColor = null,
    Object? button1ForegroundColor = null,
    Object? button2BackgroundColor = null,
    Object? button2ForegroundColor = null,
  }) {
    return _then(_$DeviceKeyboardStyleImpl(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button1BackgroundColor: null == button1BackgroundColor
          ? _value.button1BackgroundColor
          : button1BackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button1ForegroundColor: null == button1ForegroundColor
          ? _value.button1ForegroundColor
          : button1ForegroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button2BackgroundColor: null == button2BackgroundColor
          ? _value.button2BackgroundColor
          : button2BackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      button2ForegroundColor: null == button2ForegroundColor
          ? _value.button2ForegroundColor
          : button2ForegroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$DeviceKeyboardStyleImpl
    with DiagnosticableTreeMixin
    implements _DeviceKeyboardStyle {
  const _$DeviceKeyboardStyleImpl(
      {required this.backgroundColor,
      required this.button1BackgroundColor,
      required this.button1ForegroundColor,
      required this.button2BackgroundColor,
      required this.button2ForegroundColor});

  @override
  final Color backgroundColor;
  @override
  final Color button1BackgroundColor;
  @override
  final Color button1ForegroundColor;
  @override
  final Color button2BackgroundColor;
  @override
  final Color button2ForegroundColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeviceKeyboardStyle(backgroundColor: $backgroundColor, button1BackgroundColor: $button1BackgroundColor, button1ForegroundColor: $button1ForegroundColor, button2BackgroundColor: $button2BackgroundColor, button2ForegroundColor: $button2ForegroundColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeviceKeyboardStyle'))
      ..add(DiagnosticsProperty('backgroundColor', backgroundColor))
      ..add(
          DiagnosticsProperty('button1BackgroundColor', button1BackgroundColor))
      ..add(
          DiagnosticsProperty('button1ForegroundColor', button1ForegroundColor))
      ..add(
          DiagnosticsProperty('button2BackgroundColor', button2BackgroundColor))
      ..add(DiagnosticsProperty(
          'button2ForegroundColor', button2ForegroundColor));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceKeyboardStyleImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.button1BackgroundColor, button1BackgroundColor) ||
                other.button1BackgroundColor == button1BackgroundColor) &&
            (identical(other.button1ForegroundColor, button1ForegroundColor) ||
                other.button1ForegroundColor == button1ForegroundColor) &&
            (identical(other.button2BackgroundColor, button2BackgroundColor) ||
                other.button2BackgroundColor == button2BackgroundColor) &&
            (identical(other.button2ForegroundColor, button2ForegroundColor) ||
                other.button2ForegroundColor == button2ForegroundColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      backgroundColor,
      button1BackgroundColor,
      button1ForegroundColor,
      button2BackgroundColor,
      button2ForegroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceKeyboardStyleImplCopyWith<_$DeviceKeyboardStyleImpl> get copyWith =>
      __$$DeviceKeyboardStyleImplCopyWithImpl<_$DeviceKeyboardStyleImpl>(
          this, _$identity);
}

abstract class _DeviceKeyboardStyle implements DeviceKeyboardStyle {
  const factory _DeviceKeyboardStyle(
      {required final Color backgroundColor,
      required final Color button1BackgroundColor,
      required final Color button1ForegroundColor,
      required final Color button2BackgroundColor,
      required final Color button2ForegroundColor}) = _$DeviceKeyboardStyleImpl;

  @override
  Color get backgroundColor;
  @override
  Color get button1BackgroundColor;
  @override
  Color get button1ForegroundColor;
  @override
  Color get button2BackgroundColor;
  @override
  Color get button2ForegroundColor;
  @override
  @JsonKey(ignore: true)
  _$$DeviceKeyboardStyleImplCopyWith<_$DeviceKeyboardStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
