// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceStateImpl _$$DeviceStateImplFromJson(Map<String, dynamic> json) =>
    _$DeviceStateImpl(
      orientation:
          $enumDecodeNullable(_$OrientationEnumMap, json['orientation']) ??
              Orientation.portrait,
      isVirtualKeyboardVisible:
          json['isVirtualKeyboardVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$$DeviceStateImplToJson(_$DeviceStateImpl instance) =>
    <String, dynamic>{
      'orientation': _$OrientationEnumMap[instance.orientation]!,
      'isVirtualKeyboardVisible': instance.isVirtualKeyboardVisible,
    };

const _$OrientationEnumMap = {
  Orientation.portrait: 'portrait',
  Orientation.landscape: 'landscape',
};
