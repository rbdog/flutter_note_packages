// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceStateImpl _$$DeviceStateImplFromJson(Map<String, dynamic> json) =>
    _$DeviceStateImpl(
      orientation: $enumDecode(_$OrientationEnumMap, json['orientation']),
      showKeyboard: json['showKeyboard'] as bool,
    );

Map<String, dynamic> _$$DeviceStateImplToJson(_$DeviceStateImpl instance) =>
    <String, dynamic>{
      'orientation': _$OrientationEnumMap[instance.orientation]!,
      'showKeyboard': instance.showKeyboard,
    };

const _$OrientationEnumMap = {
  Orientation.portrait: 'portrait',
  Orientation.landscape: 'landscape',
};
