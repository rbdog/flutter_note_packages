import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_settings/provider.dart';
import 'minimal_tile.dart';

class SwitchDarkModeTile extends ConsumerWidget {
  const SwitchDarkModeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(deviceSettingsProvider);
    final notifier = ref.watch(deviceSettingsProvider.notifier);

    return MinimalTile.onOff(
      title: const Text('ダークモード'),
      value: settings.isDarkMode,
      onChanged: (isOn) {
        notifier.toggleDarkMode();
      },
    );
  }
}
