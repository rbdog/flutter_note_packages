import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dart_assets/devices/index.dart';
import '../../logic/device_model/types/device_model.dart';
import '../device_settings/provider.dart';

final defaultDeviceModelProvider = Provider<DeviceModel>((ref) {
  throw UnimplementedError();
});

final deviceModelProvider = FutureProvider((ref) async {
  final settings = await ref.watch(deviceSettingsProvider.future);
  final defaultDevice = ref.watch(defaultDeviceModelProvider);
  return Devices.all.firstWhere(
    (it) =>
        it.id.toString() == (settings.deviceId ?? defaultDevice.id.toString()),
    orElse: () => Devices.all.first,
  );
});
