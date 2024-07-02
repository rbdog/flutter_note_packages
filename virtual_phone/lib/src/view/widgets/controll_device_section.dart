import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../../logic/screenshot/screenshot.dart';
import '../../state/device_model/provider.dart';
import '../../state/device_state/provider.dart';
import 'menu_section.dart';

/// All the simulated properties for the device.
class ControllDeviceSection extends ConsumerWidget {
  const ControllDeviceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceState = ref.watch(deviceStateProvider);
    return MenuSection(
      title: 'Controll Device',
      children: [
        ListTile(
          key: const Key('orientation'),
          title: const Text('Orientation'),
          subtitle: Text(
            () {
              switch (deviceState.orientation) {
                case Orientation.landscape:
                  return 'Landscape';
                case Orientation.portrait:
                  return 'Portrait';
              }
            }(),
          ),
          trailing: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transformAlignment: Alignment.center,
            transform: Matrix4.rotationZ(
              deviceState.orientation == Orientation.landscape ? 2.35 : 0.75,
            ),
            child: const Icon(Icons.screen_rotation),
          ),
          onTap: () {
            final notifier = ref.read(deviceStateProvider.notifier);
            notifier.rotate();
          },
        ),
        ListTile(
          key: const Key('Keyboard'),
          title: const Text('Keyboard'),
          subtitle: Text(deviceState.showKeyboard ? 'Visible' : 'Hidden'),
          trailing: Opacity(
            opacity: deviceState.showKeyboard ? 1.0 : 0.3,
            child: Icon(
              deviceState.showKeyboard
                  ? Icons.keyboard
                  : Icons.keyboard_outlined,
            ),
          ),
          onTap: () {
            final notiifer = ref.read(deviceStateProvider.notifier);
            notiifer.toggleVirtualKeyboard();
          },
        ),
        ListTile(
          key: const Key('Screenshot'),
          title: const Text('Take a screenshot'),
          trailing: const Icon(Icons.camera_alt),
          onTap: () async {
            final deviceModel = ref.read(deviceModelProvider);
            final screenshot = await takeAScreenshot(
              pixelRatio: deviceModel.screen.pixelRatio,
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
        ),
      ],
    );
  }
}
