import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/device/types/device.dart';
import '../../state/store.dart';

class DeviceTile extends StatelessWidget {
  const DeviceTile({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(device.name),
      subtitle: Text(
        '${device.screenSize.width}x${device.screenSize.height} @${device.pixelRatio}',
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
      onTap: () {
        final state = context.read<MobilePreviewStore>();
        state.selectDevice(device.id);
      },
    );
  }
}
