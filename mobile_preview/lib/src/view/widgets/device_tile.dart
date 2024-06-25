import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_preview/src/state/device_settings/provider.dart';

import '../../logic/device/types/device.dart';

class DeviceTile extends ConsumerWidget {
  const DeviceTile({
    super.key,
    required this.device,
  });

  final Device device;

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
        final notifier = ref.read(deviceSettingsProvider.notifier);
        notifier.selectDevice(device.id);
      },
    );
  }
}
