import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_state.freezed.dart';
part 'device_state.g.dart';

@freezed
class DeviceState with _$DeviceState {
  const factory DeviceState({
    /// The current orientation of the device
    @Default(Orientation.portrait) Orientation orientation,

    /// Indicate whether the virtual keyboard is visible.
    @Default(false) bool isVirtualKeyboardVisible,
  }) = _DeviceState;

  factory DeviceState.fromJson(Map<String, dynamic> json) =>
      _$DeviceStateFromJson(json);
}
