import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_state/types/device_state.dart';

class DeviceStateNotifier extends Notifier<DeviceState> {
  @override
  DeviceState build() {
    return const DeviceState(
      isPortrait: true,
      showKeyboard: false,
    );
  }

  void toggleShowKeyboard() {
    state = state.copyWith(
      showKeyboard: !state.showKeyboard,
    );
  }

  void toggleRotation() {
    state = state.copyWith(
      isPortrait: !state.isPortrait,
    );
  }
}
