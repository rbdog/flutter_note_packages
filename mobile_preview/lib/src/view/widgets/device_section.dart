import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_preview/src/logic/device/types/device.dart';
import 'package:mobile_preview/src/state/data.dart';
import 'package:mobile_preview/src/state/device_settings/provider.dart';
import 'package:mobile_preview/src/view/widgets/platform_picker.dart';
import 'package:mobile_preview/src/view/widgets/platform_icon.dart';
import 'package:flutter/material.dart';

import 'panel_section.dart';

/// All the simulated properties for the device.
class DeviceSection extends ConsumerWidget {
  const DeviceSection({
    super.key,
    required this.device,
    required this.settings,
  });

  final MobilePreviewData settings;
  final Device device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canRotate = device.rotatedSafeAreas != null;

    return PanelSection(
      title: 'Device',
      children: [
        ListTile(
          key: const Key('device'),
          title: const Text('Device'),
          subtitle: Text(device.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PlatformIcon(
                platform: device.id.platform,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
          onTap: () {
            final theme = Theme.of(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Theme(
                  data: theme,
                  child: PlatformPicker(platform: device.id.platform),
                ),
              ),
            );
          },
        ),
        if (canRotate)
          ListTile(
            key: const Key('orientation'),
            title: const Text('Orientation'),
            subtitle: Text(
              () {
                switch (settings.orientation) {
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
                settings.orientation == Orientation.landscape ? 2.35 : 0.75,
              ),
              child: const Icon(Icons.screen_rotation),
            ),
            onTap: () {
              final notifier = ref.read(deviceSettingsProvider.notifier);
              notifier.rotate();
            },
          ),
        ListTile(
          key: const Key('keyboard'),
          title: const Text('Virtual keyboard'),
          subtitle:
              Text(settings.isVirtualKeyboardVisible ? 'Visible' : 'Hidden'),
          trailing: Opacity(
            opacity: settings.isVirtualKeyboardVisible ? 1.0 : 0.3,
            child: Icon(
              settings.isVirtualKeyboardVisible
                  ? Icons.keyboard
                  : Icons.keyboard_outlined,
            ),
          ),
          onTap: () {
            final notiifer = ref.read(deviceSettingsProvider.notifier);
            notiifer.toggleVirtualKeyboard();
          },
        ),
      ],
    );
  }
}