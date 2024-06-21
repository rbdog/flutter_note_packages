import 'package:mobile_preview/src/state/store.dart';
import 'package:mobile_preview/src/view/widgets/platform_picker.dart';
import 'package:mobile_preview/src/view/widgets/platform_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'panel_section.dart';

/// All the simulated properties for the device.
class DeviceSection extends StatelessWidget {
  const DeviceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceName = context.select(
      (MobilePreviewStore store) => store.device.name,
    );
    final deviceIdentifier = context.select(
      (MobilePreviewStore store) => store.device.id,
    );

    final canRotate = context.select(
      (MobilePreviewStore store) => store.device.rotatedSafeAreas != null,
    );

    final orientation = context.select(
      (MobilePreviewStore store) => store.data.orientation,
    );

    final isVirtualKeyboardVisible = context.select(
      (MobilePreviewStore store) => store.data.isVirtualKeyboardVisible,
    );

    return PanelSection(
      title: 'Device',
      children: [
        ListTile(
          key: const Key('device'),
          title: const Text('Device'),
          subtitle: Text(deviceName),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PlatformIcon(
                platform: deviceIdentifier.platform,
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
                  child: const PlatformPicker(),
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
                switch (orientation) {
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
                orientation == Orientation.landscape ? 2.35 : 0.75,
              ),
              child: const Icon(Icons.screen_rotation),
            ),
            onTap: () {
              final state = context.read<MobilePreviewStore>();
              state.rotate();
            },
          ),
        ListTile(
          key: const Key('keyboard'),
          title: const Text('Virtual keyboard'),
          subtitle: Text(isVirtualKeyboardVisible ? 'Visible' : 'Hidden'),
          trailing: Opacity(
            opacity: isVirtualKeyboardVisible ? 1.0 : 0.3,
            child: Icon(
              isVirtualKeyboardVisible
                  ? Icons.keyboard
                  : Icons.keyboard_outlined,
            ),
          ),
          onTap: () {
            final state = context.read<MobilePreviewStore>();
            state.toggleVirtualKeyboard();
          },
        ),
      ],
    );
  }
}
