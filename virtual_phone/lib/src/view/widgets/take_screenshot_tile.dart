import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/screenshot/screenshot.dart';
import '../../state/device_model/provider.dart';
import '../theme/colors.dart';
import 'minimal_tile.dart';

class TakeScreenshotTile extends ConsumerWidget {
  const TakeScreenshotTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MinimalTile.tapAction(
      title: const Text('スクリーンショット'),
      icon: const Icon(
        Icons.camera_alt,
        color: BrandColor.weakIcon,
      ),
      onTap: () async {
        final deviceModel = ref.read(deviceModelProvider);
        final screenshot = await takeScreenshot(
          pixelRatio: deviceModel.hardwareScreen.pixelRatio,
        );
        if (!context.mounted) return;
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              insetPadding: const EdgeInsets.all(10),
              child: Image.memory(screenshot.bytes),
            );
          },
        );
      },
    );
  }
}
