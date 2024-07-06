import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_state.freezed.dart';
part 'device_state.g.dart';

@freezed
class DeviceState with _$DeviceState {
  const factory DeviceState({
    required bool isPortrait,
    required bool showKeyboard,
  }) = _DeviceState;

  factory DeviceState.fromJson(Map<String, dynamic> json) =>
      _$DeviceStateFromJson(json);
}
