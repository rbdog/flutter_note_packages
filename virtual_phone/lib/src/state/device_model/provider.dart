import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dart_assets/devices/index.dart';
import 'notifier.dart';

final deviceModelIdProvider = NotifierProvider<DeviceModelIdNotifier, String>(
  () {
    throw UnimplementedError();
  },
);

final deviceModelProvider = Provider((ref) {
  final modelId = ref.watch(deviceModelIdProvider);
  return DeviceModels.all.firstWhere((it) => it.id == modelId);
});
