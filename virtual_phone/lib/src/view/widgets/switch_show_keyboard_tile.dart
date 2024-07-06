import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_state/provider.dart';
import 'minimal_tile.dart';

class SwitchShowKeyboardTile extends ConsumerWidget {
  const SwitchShowKeyboardTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceState = ref.watch(deviceStateProvider);
    final notifier = ref.watch(deviceStateProvider.notifier);

    return MinimalTile.onOff(
      title: const Text('キーボード'),
      value: deviceState.showKeyboard,
      onChanged: (isOn) {
        notifier.toggleShowKeyboard();
      },
    );
  }
}
