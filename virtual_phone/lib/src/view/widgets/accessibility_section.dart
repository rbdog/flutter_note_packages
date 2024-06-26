import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_settings/types/device_settings.dart';
import '../../state/device_settings/provider.dart';
import 'menu_section.dart';

/// All the simulated accessibility settings.
class AccessibilitySection extends ConsumerWidget {
  const AccessibilitySection({
    super.key,
    required this.settings,
  });

  final DeviceSettings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuSection(
      title: 'Accessibility',
      children: [
        if (settings.accessibleNavigation)
          ListTile(
            key: const Key('accessible-navigation'),
            title: const Text('Accessible navigation'),
            subtitle:
                Text(settings.accessibleNavigation ? 'Enabled' : 'Disabled'),
            trailing: Opacity(
              opacity: settings.accessibleNavigation ? 1.0 : 0.3,
              child: Icon(
                settings.accessibleNavigation
                    ? Icons.accessible_forward
                    : Icons.accessible_rounded,
              ),
            ),
            onTap: () {
              final notifier = ref.read(deviceSettingsProvider.notifier);
              notifier.toggleAccessibleNavigation();
            },
          ),
        ListTile(
          key: const Key('invert-colors'),
          title: const Text('Invert colors'),
          subtitle: Text(settings.invertColors ? 'Enabled' : 'Disabled'),
          trailing: Opacity(
            opacity: settings.invertColors ? 1.0 : 0.3,
            child: Icon(
              settings.invertColors
                  ? Icons.format_color_reset_rounded
                  : Icons.format_color_reset_outlined,
            ),
          ),
          onTap: () {
            final notifier = ref.read(deviceSettingsProvider.notifier);
            notifier.toggleInvertColors();
          },
        ),
        ListTile(
          key: const Key('bold-text'),
          title: const Text('Bold text'),
          subtitle: Text(settings.boldText ? 'Enabled' : 'Disabled'),
          trailing: Opacity(
            opacity: settings.boldText ? 1.0 : 0.3,
            child: const Icon(
              Icons.format_bold,
            ),
          ),
          onTap: () {
            final notifier = ref.read(deviceSettingsProvider.notifier);
            notifier.toggleBoldText();
          },
        ),
        ...[
          ListTile(
            key: const Key('text-scaling-factor'),
            title: const Text('Text scaling factor'),
            subtitle: Text(settings.textScaleFactor.toString()),
            trailing: Transform(
              alignment: Alignment.center,
              transform: (Matrix4.identity()
                ..scale(
                  settings.textScaleFactor >= 2
                      ? 1.0
                      : (settings.textScaleFactor < 1 ? 0.25 : 0.6),
                )),
              child: const Icon(Icons.text_format),
            ),
          ),
          ListTile(
            key: const Key('text-scaling-slider'),
            title: Slider(
              value: settings.textScaleFactor,
              onChanged: (scale) {
                final notifier = ref.read(deviceSettingsProvider.notifier);
                notifier.setTextScale(scale);
              },
              min: 0.25,
              max: 3,
              divisions: 11,
            ),
          ),
        ],
      ],
    );
  }
}
