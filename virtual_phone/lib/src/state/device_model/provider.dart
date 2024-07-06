import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/config/preset_models.dart';
import 'notifier.dart';

final deviceModelIdProvider = NotifierProvider<DeviceModelIdNotifier, String>(
  () {
    throw UnimplementedError();
  },
);

final deviceModelProvider = Provider(
  (ref) {
    final modelId = ref.watch(deviceModelIdProvider);
    return presetModels.firstWhere(
      (it) => it.id == modelId,
    );
  },
);
