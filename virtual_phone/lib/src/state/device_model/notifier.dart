import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dart_assets/devices/index.dart';
import '../../logic/device_model/types/id.dart';

class DeviceModelIdNotifier extends Notifier<DeviceModelId> {
  DeviceModelIdNotifier({
    required this.initialModelId,
  });

  final DeviceModelId? initialModelId;

  @override
  DeviceModelId build() {
    return initialModelId ?? Devices.all.first.id;
  }

  /// Select the current device.
  void selectDevice(DeviceModelId id) {
    state = id;
  }
}
