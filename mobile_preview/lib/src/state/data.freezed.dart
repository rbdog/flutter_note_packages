// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MobilePreviewData _$MobilePreviewDataFromJson(Map<String, dynamic> json) {
  return _MobilePreviewData.fromJson(json);
}

/// @nodoc
mixin _$MobilePreviewData {
  /// Indicate whether the toolbar is visible.
  bool get isToolbarVisible => throw _privateConstructorUsedError;

  /// Indicate whether the device simulation is enabled.
  bool get isEnabled => throw _privateConstructorUsedError;

  /// The current orientation of the device
  Orientation get orientation => throw _privateConstructorUsedError;

  /// The currently selected device.
  String? get deviceIdentifier => throw _privateConstructorUsedError;

  /// The currently selected device locale.
  String get locale => throw _privateConstructorUsedError;

  /// Indicate whether the mode is currently dark.
  bool get isDarkMode => throw _privateConstructorUsedError;

  /// Indicate whether texts are forced to bold.
  bool get boldText => throw _privateConstructorUsedError;

  /// Indicate whether the virtual keyboard is visible.
  bool get isVirtualKeyboardVisible => throw _privateConstructorUsedError;

  /// Indicate whether animations are disabled.
  bool get disableAnimations => throw _privateConstructorUsedError;

  /// Indicate whether the highcontrast mode is activated.
  bool get highContrast => throw _privateConstructorUsedError;

  /// Indicate whether the navigation is in accessible mode.
  bool get accessibleNavigation => throw _privateConstructorUsedError;

  /// Indicate whether image colors are inverted.
  bool get invertColors => throw _privateConstructorUsedError;

  /// Indicate whether image colors are inverted.
  Map<String, Map<String, dynamic>> get pluginData =>
      throw _privateConstructorUsedError;

  /// The current text scaling factor.
  double get textScaleFactor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MobilePreviewDataCopyWith<MobilePreviewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobilePreviewDataCopyWith<$Res> {
  factory $MobilePreviewDataCopyWith(
          MobilePreviewData value, $Res Function(MobilePreviewData) then) =
      _$MobilePreviewDataCopyWithImpl<$Res, MobilePreviewData>;
  @useResult
  $Res call(
      {bool isToolbarVisible,
      bool isEnabled,
      Orientation orientation,
      String? deviceIdentifier,
      String locale,
      bool isDarkMode,
      bool boldText,
      bool isVirtualKeyboardVisible,
      bool disableAnimations,
      bool highContrast,
      bool accessibleNavigation,
      bool invertColors,
      Map<String, Map<String, dynamic>> pluginData,
      double textScaleFactor});
}

/// @nodoc
class _$MobilePreviewDataCopyWithImpl<$Res, $Val extends MobilePreviewData>
    implements $MobilePreviewDataCopyWith<$Res> {
  _$MobilePreviewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isToolbarVisible = null,
    Object? isEnabled = null,
    Object? orientation = null,
    Object? deviceIdentifier = freezed,
    Object? locale = null,
    Object? isDarkMode = null,
    Object? boldText = null,
    Object? isVirtualKeyboardVisible = null,
    Object? disableAnimations = null,
    Object? highContrast = null,
    Object? accessibleNavigation = null,
    Object? invertColors = null,
    Object? pluginData = null,
    Object? textScaleFactor = null,
  }) {
    return _then(_value.copyWith(
      isToolbarVisible: null == isToolbarVisible
          ? _value.isToolbarVisible
          : isToolbarVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      deviceIdentifier: freezed == deviceIdentifier
          ? _value.deviceIdentifier
          : deviceIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isVirtualKeyboardVisible: null == isVirtualKeyboardVisible
          ? _value.isVirtualKeyboardVisible
          : isVirtualKeyboardVisible // ignore: cast_nullable_to_non_nullable
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
      pluginData: null == pluginData
          ? _value.pluginData
          : pluginData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
      textScaleFactor: null == textScaleFactor
          ? _value.textScaleFactor
          : textScaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobilePreviewDataImplCopyWith<$Res>
    implements $MobilePreviewDataCopyWith<$Res> {
  factory _$$MobilePreviewDataImplCopyWith(_$MobilePreviewDataImpl value,
          $Res Function(_$MobilePreviewDataImpl) then) =
      __$$MobilePreviewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isToolbarVisible,
      bool isEnabled,
      Orientation orientation,
      String? deviceIdentifier,
      String locale,
      bool isDarkMode,
      bool boldText,
      bool isVirtualKeyboardVisible,
      bool disableAnimations,
      bool highContrast,
      bool accessibleNavigation,
      bool invertColors,
      Map<String, Map<String, dynamic>> pluginData,
      double textScaleFactor});
}

/// @nodoc
class __$$MobilePreviewDataImplCopyWithImpl<$Res>
    extends _$MobilePreviewDataCopyWithImpl<$Res, _$MobilePreviewDataImpl>
    implements _$$MobilePreviewDataImplCopyWith<$Res> {
  __$$MobilePreviewDataImplCopyWithImpl(_$MobilePreviewDataImpl _value,
      $Res Function(_$MobilePreviewDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isToolbarVisible = null,
    Object? isEnabled = null,
    Object? orientation = null,
    Object? deviceIdentifier = freezed,
    Object? locale = null,
    Object? isDarkMode = null,
    Object? boldText = null,
    Object? isVirtualKeyboardVisible = null,
    Object? disableAnimations = null,
    Object? highContrast = null,
    Object? accessibleNavigation = null,
    Object? invertColors = null,
    Object? pluginData = null,
    Object? textScaleFactor = null,
  }) {
    return _then(_$MobilePreviewDataImpl(
      isToolbarVisible: null == isToolbarVisible
          ? _value.isToolbarVisible
          : isToolbarVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      deviceIdentifier: freezed == deviceIdentifier
          ? _value.deviceIdentifier
          : deviceIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isVirtualKeyboardVisible: null == isVirtualKeyboardVisible
          ? _value.isVirtualKeyboardVisible
          : isVirtualKeyboardVisible // ignore: cast_nullable_to_non_nullable
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
      pluginData: null == pluginData
          ? _value._pluginData
          : pluginData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
      textScaleFactor: null == textScaleFactor
          ? _value.textScaleFactor
          : textScaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobilePreviewDataImpl implements _MobilePreviewData {
  const _$MobilePreviewDataImpl(
      {this.isToolbarVisible = true,
      this.isEnabled = true,
      this.orientation = Orientation.portrait,
      this.deviceIdentifier,
      this.locale = 'en-US',
      this.isDarkMode = false,
      this.boldText = false,
      this.isVirtualKeyboardVisible = false,
      this.disableAnimations = false,
      this.highContrast = false,
      this.accessibleNavigation = false,
      this.invertColors = false,
      final Map<String, Map<String, dynamic>> pluginData =
          const <String, Map<String, dynamic>>{},
      this.textScaleFactor = 1.0})
      : _pluginData = pluginData;

  factory _$MobilePreviewDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobilePreviewDataImplFromJson(json);

  /// Indicate whether the toolbar is visible.
  @override
  @JsonKey()
  final bool isToolbarVisible;

  /// Indicate whether the device simulation is enabled.
  @override
  @JsonKey()
  final bool isEnabled;

  /// The current orientation of the device
  @override
  @JsonKey()
  final Orientation orientation;

  /// The currently selected device.
  @override
  final String? deviceIdentifier;

  /// The currently selected device locale.
  @override
  @JsonKey()
  final String locale;

  /// Indicate whether the mode is currently dark.
  @override
  @JsonKey()
  final bool isDarkMode;

  /// Indicate whether texts are forced to bold.
  @override
  @JsonKey()
  final bool boldText;

  /// Indicate whether the virtual keyboard is visible.
  @override
  @JsonKey()
  final bool isVirtualKeyboardVisible;

  /// Indicate whether animations are disabled.
  @override
  @JsonKey()
  final bool disableAnimations;

  /// Indicate whether the highcontrast mode is activated.
  @override
  @JsonKey()
  final bool highContrast;

  /// Indicate whether the navigation is in accessible mode.
  @override
  @JsonKey()
  final bool accessibleNavigation;

  /// Indicate whether image colors are inverted.
  @override
  @JsonKey()
  final bool invertColors;

  /// Indicate whether image colors are inverted.
  final Map<String, Map<String, dynamic>> _pluginData;

  /// Indicate whether image colors are inverted.
  @override
  @JsonKey()
  Map<String, Map<String, dynamic>> get pluginData {
    if (_pluginData is EqualUnmodifiableMapView) return _pluginData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pluginData);
  }

  /// The current text scaling factor.
  @override
  @JsonKey()
  final double textScaleFactor;

  @override
  String toString() {
    return 'MobilePreviewData(isToolbarVisible: $isToolbarVisible, isEnabled: $isEnabled, orientation: $orientation, deviceIdentifier: $deviceIdentifier, locale: $locale, isDarkMode: $isDarkMode, boldText: $boldText, isVirtualKeyboardVisible: $isVirtualKeyboardVisible, disableAnimations: $disableAnimations, highContrast: $highContrast, accessibleNavigation: $accessibleNavigation, invertColors: $invertColors, pluginData: $pluginData, textScaleFactor: $textScaleFactor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobilePreviewDataImpl &&
            (identical(other.isToolbarVisible, isToolbarVisible) ||
                other.isToolbarVisible == isToolbarVisible) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.deviceIdentifier, deviceIdentifier) ||
                other.deviceIdentifier == deviceIdentifier) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.boldText, boldText) ||
                other.boldText == boldText) &&
            (identical(
                    other.isVirtualKeyboardVisible, isVirtualKeyboardVisible) ||
                other.isVirtualKeyboardVisible == isVirtualKeyboardVisible) &&
            (identical(other.disableAnimations, disableAnimations) ||
                other.disableAnimations == disableAnimations) &&
            (identical(other.highContrast, highContrast) ||
                other.highContrast == highContrast) &&
            (identical(other.accessibleNavigation, accessibleNavigation) ||
                other.accessibleNavigation == accessibleNavigation) &&
            (identical(other.invertColors, invertColors) ||
                other.invertColors == invertColors) &&
            const DeepCollectionEquality()
                .equals(other._pluginData, _pluginData) &&
            (identical(other.textScaleFactor, textScaleFactor) ||
                other.textScaleFactor == textScaleFactor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isToolbarVisible,
      isEnabled,
      orientation,
      deviceIdentifier,
      locale,
      isDarkMode,
      boldText,
      isVirtualKeyboardVisible,
      disableAnimations,
      highContrast,
      accessibleNavigation,
      invertColors,
      const DeepCollectionEquality().hash(_pluginData),
      textScaleFactor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MobilePreviewDataImplCopyWith<_$MobilePreviewDataImpl> get copyWith =>
      __$$MobilePreviewDataImplCopyWithImpl<_$MobilePreviewDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobilePreviewDataImplToJson(
      this,
    );
  }
}

abstract class _MobilePreviewData implements MobilePreviewData {
  const factory _MobilePreviewData(
      {final bool isToolbarVisible,
      final bool isEnabled,
      final Orientation orientation,
      final String? deviceIdentifier,
      final String locale,
      final bool isDarkMode,
      final bool boldText,
      final bool isVirtualKeyboardVisible,
      final bool disableAnimations,
      final bool highContrast,
      final bool accessibleNavigation,
      final bool invertColors,
      final Map<String, Map<String, dynamic>> pluginData,
      final double textScaleFactor}) = _$MobilePreviewDataImpl;

  factory _MobilePreviewData.fromJson(Map<String, dynamic> json) =
      _$MobilePreviewDataImpl.fromJson;

  @override

  /// Indicate whether the toolbar is visible.
  bool get isToolbarVisible;
  @override

  /// Indicate whether the device simulation is enabled.
  bool get isEnabled;
  @override

  /// The current orientation of the device
  Orientation get orientation;
  @override

  /// The currently selected device.
  String? get deviceIdentifier;
  @override

  /// The currently selected device locale.
  String get locale;
  @override

  /// Indicate whether the mode is currently dark.
  bool get isDarkMode;
  @override

  /// Indicate whether texts are forced to bold.
  bool get boldText;
  @override

  /// Indicate whether the virtual keyboard is visible.
  bool get isVirtualKeyboardVisible;
  @override

  /// Indicate whether animations are disabled.
  bool get disableAnimations;
  @override

  /// Indicate whether the highcontrast mode is activated.
  bool get highContrast;
  @override

  /// Indicate whether the navigation is in accessible mode.
  bool get accessibleNavigation;
  @override

  /// Indicate whether image colors are inverted.
  bool get invertColors;
  @override

  /// Indicate whether image colors are inverted.
  Map<String, Map<String, dynamic>> get pluginData;
  @override

  /// The current text scaling factor.
  double get textScaleFactor;
  @override
  @JsonKey(ignore: true)
  _$$MobilePreviewDataImplCopyWith<_$MobilePreviewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
