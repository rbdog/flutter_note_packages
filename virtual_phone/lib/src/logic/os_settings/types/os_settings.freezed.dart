// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'os_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OSSettings _$OSSettingsFromJson(Map<String, dynamic> json) {
  return _DeviceSettings.fromJson(json);
}

/// @nodoc
mixin _$OSSettings {
  String get locale => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get boldText => throw _privateConstructorUsedError;
  bool get disableAnimations => throw _privateConstructorUsedError;
  bool get highContrast => throw _privateConstructorUsedError;
  bool get accessibleNavigation => throw _privateConstructorUsedError;
  bool get invertColors => throw _privateConstructorUsedError;
  double get textScale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OSSettingsCopyWith<OSSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OSSettingsCopyWith<$Res> {
  factory $OSSettingsCopyWith(
          OSSettings value, $Res Function(OSSettings) then) =
      _$OSSettingsCopyWithImpl<$Res, OSSettings>;
  @useResult
  $Res call(
      {String locale,
      bool isDarkMode,
      bool boldText,
      bool disableAnimations,
      bool highContrast,
      bool accessibleNavigation,
      bool invertColors,
      double textScale});
}

/// @nodoc
class _$OSSettingsCopyWithImpl<$Res, $Val extends OSSettings>
    implements $OSSettingsCopyWith<$Res> {
  _$OSSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? isDarkMode = null,
    Object? boldText = null,
    Object? disableAnimations = null,
    Object? highContrast = null,
    Object? accessibleNavigation = null,
    Object? invertColors = null,
    Object? textScale = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      boldText: null == boldText
          ? _value.boldText
          : boldText // ignore: cast_nullable_to_non_nullable
              as bool,
      disableAnimations: null == disableAnimations
          ? _value.disableAnimations
          : disableAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
      highContrast: null == highContrast
          ? _value.highContrast
          : highContrast // ignore: cast_nullable_to_non_nullable
              as bool,
      accessibleNavigation: null == accessibleNavigation
          ? _value.accessibleNavigation
          : accessibleNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      invertColors: null == invertColors
          ? _value.invertColors
          : invertColors // ignore: cast_nullable_to_non_nullable
              as bool,
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceSettingsImplCopyWith<$Res>
    implements $OSSettingsCopyWith<$Res> {
  factory _$$DeviceSettingsImplCopyWith(_$DeviceSettingsImpl value,
          $Res Function(_$DeviceSettingsImpl) then) =
      __$$DeviceSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String locale,
      bool isDarkMode,
      bool boldText,
      bool disableAnimations,
      bool highContrast,
      bool accessibleNavigation,
      bool invertColors,
      double textScale});
}

/// @nodoc
class __$$DeviceSettingsImplCopyWithImpl<$Res>
    extends _$OSSettingsCopyWithImpl<$Res, _$DeviceSettingsImpl>
    implements _$$DeviceSettingsImplCopyWith<$Res> {
  __$$DeviceSettingsImplCopyWithImpl(
      _$DeviceSettingsImpl _value, $Res Function(_$DeviceSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? isDarkMode = null,
    Object? boldText = null,
    Object? disableAnimations = null,
    Object? highContrast = null,
    Object? accessibleNavigation = null,
    Object? invertColors = null,
    Object? textScale = null,
  }) {
    return _then(_$DeviceSettingsImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      boldText: null == boldText
          ? _value.boldText
          : boldText // ignore: cast_nullable_to_non_nullable
              as bool,
      disableAnimations: null == disableAnimations
          ? _value.disableAnimations
          : disableAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
      highContrast: null == highContrast
          ? _value.highContrast
          : highContrast // ignore: cast_nullable_to_non_nullable
              as bool,
      accessibleNavigation: null == accessibleNavigation
          ? _value.accessibleNavigation
          : accessibleNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      invertColors: null == invertColors
          ? _value.invertColors
          : invertColors // ignore: cast_nullable_to_non_nullable
              as bool,
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceSettingsImpl implements _DeviceSettings {
  const _$DeviceSettingsImpl(
      {required this.locale,
      required this.isDarkMode,
      required this.boldText,
      required this.disableAnimations,
      required this.highContrast,
      required this.accessibleNavigation,
      required this.invertColors,
      required this.textScale});

  factory _$DeviceSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceSettingsImplFromJson(json);

  @override
  final String locale;
  @override
  final bool isDarkMode;
  @override
  final bool boldText;
  @override
  final bool disableAnimations;
  @override
  final bool highContrast;
  @override
  final bool accessibleNavigation;
  @override
  final bool invertColors;
  @override
  final double textScale;

  @override
  String toString() {
    return 'OSSettings(locale: $locale, isDarkMode: $isDarkMode, boldText: $boldText, disableAnimations: $disableAnimations, highContrast: $highContrast, accessibleNavigation: $accessibleNavigation, invertColors: $invertColors, textScale: $textScale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceSettingsImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.boldText, boldText) ||
                other.boldText == boldText) &&
            (identical(other.disableAnimations, disableAnimations) ||
                other.disableAnimations == disableAnimations) &&
            (identical(other.highContrast, highContrast) ||
                other.highContrast == highContrast) &&
            (identical(other.accessibleNavigation, accessibleNavigation) ||
                other.accessibleNavigation == accessibleNavigation) &&
            (identical(other.invertColors, invertColors) ||
                other.invertColors == invertColors) &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      locale,
      isDarkMode,
      boldText,
      disableAnimations,
      highContrast,
      accessibleNavigation,
      invertColors,
      textScale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceSettingsImplCopyWith<_$DeviceSettingsImpl> get copyWith =>
      __$$DeviceSettingsImplCopyWithImpl<_$DeviceSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceSettingsImplToJson(
      this,
    );
  }
}

abstract class _DeviceSettings implements OSSettings {
  const factory _DeviceSettings(
      {required final String locale,
      required final bool isDarkMode,
      required final bool boldText,
      required final bool disableAnimations,
      required final bool highContrast,
      required final bool accessibleNavigation,
      required final bool invertColors,
      required final double textScale}) = _$DeviceSettingsImpl;

  factory _DeviceSettings.fromJson(Map<String, dynamic> json) =
      _$DeviceSettingsImpl.fromJson;

  @override
  String get locale;
  @override
  bool get isDarkMode;
  @override
  bool get boldText;
  @override
  bool get disableAnimations;
  @override
  bool get highContrast;
  @override
  bool get accessibleNavigation;
  @override
  bool get invertColors;
  @override
  double get textScale;
  @override
  @JsonKey(ignore: true)
  _$$DeviceSettingsImplCopyWith<_$DeviceSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
