import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../logic/device_state/types/device_state.dart';
import 'notifier.dart';

final deviceStateProvider = NotifierProvider<DeviceStateNotifier, DeviceState>(
  () {
    return DeviceStateNotifier();
  },
);
