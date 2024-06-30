import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_state/types/device_state.dart';

class DeviceStateNotifier extends Notifier<DeviceState> {
  @override
  DeviceState build() {
    return const DeviceState(
      orientation: Orientation.portrait,
      showKeyboard: false,
    );
  }

  void toggleVirtualKeyboard() {
    state = state.copyWith(
      showKeyboard: !state.showKeyboard,
    );
  }

  void rotate() {
    final index = (state.orientation.index + 1) % Orientation.values.length;
    state = state.copyWith(
      orientation: Orientation.values[index],
    );
  }
}
