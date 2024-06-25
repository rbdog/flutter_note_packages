import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_preview/src/logic/device/types/device.dart';
import 'package:mobile_preview/src/state/device_settings/provider.dart';

import '../../dart_assets/devices/index.dart';

final defaultDeviceProvider = Provider<Device>((ref) {
  throw UnimplementedError();
});

final deviceProvider = FutureProvider((ref) async {
  final settings = await ref.watch(deviceSettingsProvider.future);
  final defaultDevice = ref.watch(defaultDeviceProvider);
  return Devices.all.firstWhere(
    (it) =>
        it.id.toString() == (settings.deviceId ?? defaultDevice.id.toString()),
    orElse: () => Devices.all.first,
  );
});
