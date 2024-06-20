// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MobilePreviewSettingsDataImpl _$$MobilePreviewSettingsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MobilePreviewSettingsDataImpl(
      toolbarPosition: $enumDecodeNullable(
              _$MobilePreviewToolBarPositionDataEnumMap,
              json['toolbarPosition']) ??
          MobilePreviewToolBarPositionData.bottom,
      toolbarTheme: $enumDecodeNullable(
              _$MobilePreviewToolBarThemeDataEnumMap, json['toolbarTheme']) ??
          MobilePreviewToolBarThemeData.dark,
      backgroundTheme: $enumDecodeNullable(
              _$MobilePreviewBackgroundThemeDataEnumMap,
              json['backgroundTheme']) ??
          MobilePreviewBackgroundThemeData.light,
    );

Map<String, dynamic> _$$MobilePreviewSettingsDataImplToJson(
        _$MobilePreviewSettingsDataImpl instance) =>
    <String, dynamic>{
      'toolbarPosition':
          _$MobilePreviewToolBarPositionDataEnumMap[instance.toolbarPosition]!,
      'toolbarTheme':
          _$MobilePreviewToolBarThemeDataEnumMap[instance.toolbarTheme]!,
      'backgroundTheme':
          _$MobilePreviewBackgroundThemeDataEnumMap[instance.backgroundTheme]!,
    };

const _$MobilePreviewToolBarPositionDataEnumMap = {
  MobilePreviewToolBarPositionData.bottom: 'bottom',
  MobilePreviewToolBarPositionData.top: 'top',
  MobilePreviewToolBarPositionData.left: 'left',
  MobilePreviewToolBarPositionData.right: 'right',
};

const _$MobilePreviewToolBarThemeDataEnumMap = {
  MobilePreviewToolBarThemeData.dark: 'dark',
  MobilePreviewToolBarThemeData.light: 'light',
};

const _$MobilePreviewBackgroundThemeDataEnumMap = {
  MobilePreviewBackgroundThemeData.dark: 'dark',
  MobilePreviewBackgroundThemeData.light: 'light',
};
