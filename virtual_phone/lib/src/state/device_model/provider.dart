import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/config.dart';
import 'notifier.dart';

final deviceModelIdProvider = NotifierProvider<DeviceModelIdNotifier, String>(
  () {
    throw UnimplementedError();
  },
);

final deviceModelProvider = Provider((ref) {
  final modelId = ref.watch(deviceModelIdProvider);
  return presetDevices.firstWhere((it) => it.id == modelId);
});
