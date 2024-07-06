import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_state/provider.dart';
import 'minimal_tile.dart';

class SwitchDeviceRotationTile extends ConsumerWidget {
  const SwitchDeviceRotationTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceState = ref.watch(deviceStateProvider);
    final notifier = ref.watch(deviceStateProvider.notifier);

    return MinimalTile.onOff(
      title: const Text('回転'),
      value: !deviceState.isPortrait,
      onChanged: (isOn) {
        notifier.toggleRotation();
      },
    );
  }
}
