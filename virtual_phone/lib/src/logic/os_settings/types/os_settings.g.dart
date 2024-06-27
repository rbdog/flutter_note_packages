// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'os_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceSettingsImpl _$$DeviceSettingsImplFromJson(Map<String, dynamic> json) =>
    _$DeviceSettingsImpl(
      locale: json['locale'] as String? ?? 'en-US',
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      boldText: json['boldText'] as bool? ?? false,
      disableAnimations: json['disableAnimations'] as bool? ?? false,
      highContrast: json['highContrast'] as bool? ?? false,
      accessibleNavigation: json['accessibleNavigation'] as bool? ?? false,
      invertColors: json['invertColors'] as bool? ?? false,
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$DeviceSettingsImplToJson(
        _$DeviceSettingsImpl instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'isDarkMode': instance.isDarkMode,
      'boldText': instance.boldText,
      'disableAnimations': instance.disableAnimations,
      'highContrast': instance.highContrast,
      'accessibleNavigation': instance.accessibleNavigation,
      'invertColors': instance.invertColors,
      'textScaleFactor': instance.textScaleFactor,
    };
