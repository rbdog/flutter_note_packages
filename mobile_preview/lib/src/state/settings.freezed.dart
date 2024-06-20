// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MobilePreviewSettingsData _$MobilePreviewSettingsDataFromJson(
    Map<String, dynamic> json) {
  return _MobilePreviewSettingsData.fromJson(json);
}

/// @nodoc
mixin _$MobilePreviewSettingsData {
  /// The toolbar position.
  MobilePreviewToolBarPositionData get toolbarPosition =>
      throw _privateConstructorUsedError;

  /// The theme of the toolbar.
  MobilePreviewToolBarThemeData get toolbarTheme =>
      throw _privateConstructorUsedError;

  /// The theme of the background.
  MobilePreviewBackgroundThemeData get backgroundTheme =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MobilePreviewSettingsDataCopyWith<MobilePreviewSettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobilePreviewSettingsDataCopyWith<$Res> {
  factory $MobilePreviewSettingsDataCopyWith(MobilePreviewSettingsData value,
          $Res Function(MobilePreviewSettingsData) then) =
      _$MobilePreviewSettingsDataCopyWithImpl<$Res, MobilePreviewSettingsData>;
  @useResult
  $Res call(
      {MobilePreviewToolBarPositionData toolbarPosition,
      MobilePreviewToolBarThemeData toolbarTheme,
      MobilePreviewBackgroundThemeData backgroundTheme});
}

/// @nodoc
class _$MobilePreviewSettingsDataCopyWithImpl<$Res,
        $Val extends MobilePreviewSettingsData>
    implements $MobilePreviewSettingsDataCopyWith<$Res> {
  _$MobilePreviewSettingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toolbarPosition = null,
    Object? toolbarTheme = null,
    Object? backgroundTheme = null,
  }) {
    return _then(_value.copyWith(
      toolbarPosition: null == toolbarPosition
          ? _value.toolbarPosition
          : toolbarPosition // ignore: cast_nullable_to_non_nullable
              as MobilePreviewToolBarPositionData,
      toolbarTheme: null == toolbarTheme
          ? _value.toolbarTheme
          : toolbarTheme // ignore: cast_nullable_to_non_nullable
              as MobilePreviewToolBarThemeData,
      backgroundTheme: null == backgroundTheme
          ? _value.backgroundTheme
          : backgroundTheme // ignore: cast_nullable_to_non_nullable
              as MobilePreviewBackgroundThemeData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobilePreviewSettingsDataImplCopyWith<$Res>
    implements $MobilePreviewSettingsDataCopyWith<$Res> {
  factory _$$MobilePreviewSettingsDataImplCopyWith(
          _$MobilePreviewSettingsDataImpl value,
          $Res Function(_$MobilePreviewSettingsDataImpl) then) =
      __$$MobilePreviewSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MobilePreviewToolBarPositionData toolbarPosition,
      MobilePreviewToolBarThemeData toolbarTheme,
      MobilePreviewBackgroundThemeData backgroundTheme});
}

/// @nodoc
class __$$MobilePreviewSettingsDataImplCopyWithImpl<$Res>
    extends _$MobilePreviewSettingsDataCopyWithImpl<$Res,
        _$MobilePreviewSettingsDataImpl>
    implements _$$MobilePreviewSettingsDataImplCopyWith<$Res> {
  __$$MobilePreviewSettingsDataImplCopyWithImpl(
      _$MobilePreviewSettingsDataImpl _value,
      $Res Function(_$MobilePreviewSettingsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toolbarPosition = null,
    Object? toolbarTheme = null,
    Object? backgroundTheme = null,
  }) {
    return _then(_$MobilePreviewSettingsDataImpl(
      toolbarPosition: null == toolbarPosition
          ? _value.toolbarPosition
          : toolbarPosition // ignore: cast_nullable_to_non_nullable
              as MobilePreviewToolBarPositionData,
      toolbarTheme: null == toolbarTheme
          ? _value.toolbarTheme
          : toolbarTheme // ignore: cast_nullable_to_non_nullable
              as MobilePreviewToolBarThemeData,
      backgroundTheme: null == backgroundTheme
          ? _value.backgroundTheme
          : backgroundTheme // ignore: cast_nullable_to_non_nullable
              as MobilePreviewBackgroundThemeData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobilePreviewSettingsDataImpl implements _MobilePreviewSettingsData {
  const _$MobilePreviewSettingsDataImpl(
      {this.toolbarPosition = MobilePreviewToolBarPositionData.bottom,
      this.toolbarTheme = MobilePreviewToolBarThemeData.dark,
      this.backgroundTheme = MobilePreviewBackgroundThemeData.light});

  factory _$MobilePreviewSettingsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobilePreviewSettingsDataImplFromJson(json);

  /// The toolbar position.
  @override
  @JsonKey()
  final MobilePreviewToolBarPositionData toolbarPosition;

  /// The theme of the toolbar.
  @override
  @JsonKey()
  final MobilePreviewToolBarThemeData toolbarTheme;

  /// The theme of the background.
  @override
  @JsonKey()
  final MobilePreviewBackgroundThemeData backgroundTheme;

  @override
  String toString() {
    return 'MobilePreviewSettingsData(toolbarPosition: $toolbarPosition, toolbarTheme: $toolbarTheme, backgroundTheme: $backgroundTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobilePreviewSettingsDataImpl &&
            (identical(other.toolbarPosition, toolbarPosition) ||
                other.toolbarPosition == toolbarPosition) &&
            (identical(other.toolbarTheme, toolbarTheme) ||
                other.toolbarTheme == toolbarTheme) &&
            (identical(other.backgroundTheme, backgroundTheme) ||
                other.backgroundTheme == backgroundTheme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, toolbarPosition, toolbarTheme, backgroundTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MobilePreviewSettingsDataImplCopyWith<_$MobilePreviewSettingsDataImpl>
      get copyWith => __$$MobilePreviewSettingsDataImplCopyWithImpl<
          _$MobilePreviewSettingsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobilePreviewSettingsDataImplToJson(
      this,
    );
  }
}

abstract class _MobilePreviewSettingsData implements MobilePreviewSettingsData {
  const factory _MobilePreviewSettingsData(
          {final MobilePreviewToolBarPositionData toolbarPosition,
          final MobilePreviewToolBarThemeData toolbarTheme,
          final MobilePreviewBackgroundThemeData backgroundTheme}) =
      _$MobilePreviewSettingsDataImpl;

  factory _MobilePreviewSettingsData.fromJson(Map<String, dynamic> json) =
      _$MobilePreviewSettingsDataImpl.fromJson;

  @override

  /// The toolbar position.
  MobilePreviewToolBarPositionData get toolbarPosition;
  @override

  /// The theme of the toolbar.
  MobilePreviewToolBarThemeData get toolbarTheme;
  @override

  /// The theme of the background.
  MobilePreviewBackgroundThemeData get backgroundTheme;
  @override
  @JsonKey(ignore: true)
  _$$MobilePreviewSettingsDataImplCopyWith<_$MobilePreviewSettingsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
