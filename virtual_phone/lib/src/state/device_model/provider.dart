import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dart_assets/devices/index.dart';
import '../../logic/device_model/types/id.dart';
import 'notifier.dart';

final deviceModelIdProvider =
    NotifierProvider<DeviceModelIdNotifier, DeviceModelId>(
  () {
    throw UnimplementedError();
  },
);

final deviceModelProvider = Provider((ref) {
  final modelId = ref.watch(deviceModelIdProvider);
  return Devices.all.firstWhere((it) => it.id == modelId);
});
