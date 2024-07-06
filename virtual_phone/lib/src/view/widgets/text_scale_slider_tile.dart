import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_settings/provider.dart';
import 'minimal_slider.dart';
import 'minimal_tile.dart';

class TextScaleSliderTile extends ConsumerWidget {
  const TextScaleSliderTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(deviceSettingsProvider);
    return MinimalTile.withChild(
      title: const Text('文字サイズ'),
      child: MinimalSlider(
        value: settings.textScale,
        min: 0.25,
        max: 3,
        divisions: 11,
        onChanged: (scale) {
          final notifier = ref.read(deviceSettingsProvider.notifier);
          notifier.setTextScale(scale);
        },
      ),
    );
  }
}
