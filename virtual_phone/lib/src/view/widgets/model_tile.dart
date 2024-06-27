import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/types/device_model.dart';
import '../../state/device_model/provider.dart';

class ModelTile extends ConsumerWidget {
  const ModelTile({
    super.key,
    required this.device,
  });

  final DeviceModel device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(device.name),
      subtitle: Text(
        '${device.screenSize.width}x${device.screenSize.height} @${device.pixelRatio}',
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
      onTap: () {
        final notifier = ref.read(deviceModelIdProvider.notifier);
        notifier.selectDevice(device.id);
      },
    );
  }
}
