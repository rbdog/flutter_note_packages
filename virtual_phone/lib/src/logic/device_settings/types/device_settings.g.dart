// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceSettingsImpl _$$DeviceSettingsImplFromJson(Map<String, dynamic> json) =>
    _$DeviceSettingsImpl(
      isToolbarVisible: json['isToolbarVisible'] as bool? ?? true,
      orientation:
          $enumDecodeNullable(_$OrientationEnumMap, json['orientation']) ??
              Orientation.portrait,
      deviceId: json['deviceId'] as String?,
      locale: json['locale'] as String? ?? 'en-US',
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      boldText: json['boldText'] as bool? ?? false,
      isVirtualKeyboardVisible:
          json['isVirtualKeyboardVisible'] as bool? ?? false,
      disableAnimations: json['disableAnimations'] as bool? ?? false,
      highContrast: json['highContrast'] as bool? ?? false,
      accessibleNavigation: json['accessibleNavigation'] as bool? ?? false,
      invertColors: json['invertColors'] as bool? ?? false,
      pluginData: (json['pluginData'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Map<String, dynamic>),
          ) ??
          const <String, Map<String, dynamic>>{},
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$DeviceSettingsImplToJson(
        _$DeviceSettingsImpl instance) =>
    <String, dynamic>{
      'isToolbarVisible': instance.isToolbarVisible,
      'orientation': _$OrientationEnumMap[instance.orientation]!,
      'deviceId': instance.deviceId,
      'locale': instance.locale,
      'isDarkMode': instance.isDarkMode,
      'boldText': instance.boldText,
      'isVirtualKeyboardVisible': instance.isVirtualKeyboardVisible,
      'disableAnimations': instance.disableAnimations,
      'highContrast': instance.highContrast,
      'accessibleNavigation': instance.accessibleNavigation,
      'invertColors': instance.invertColors,
      'pluginData': instance.pluginData,
      'textScaleFactor': instance.textScaleFactor,
    };

const _$OrientationEnumMap = {
  Orientation.portrait: 'portrait',
  Orientation.landscape: 'landscape',
};
