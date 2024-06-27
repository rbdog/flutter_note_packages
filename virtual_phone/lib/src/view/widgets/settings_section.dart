import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../../external/locales/default_locales.dart';
import '../../state/device_settings/provider.dart';
import 'locale_picker.dart';
import 'menu_section.dart';

/// All the simulated system settings.
class SettingsSection extends ConsumerWidget {
  const SettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(deviceSettingsProvider);

    final selectedLocale = availableLocales.firstWhere(
      (it) => it.code == settings.locale,
      orElse: () => availableLocales.first,
    );

    return MenuSection(
      title: 'Settings',
      children: [
        ListTile(
          key: const Key('locale'),
          title: const Text('Locale'),
          subtitle: Text(selectedLocale.name),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language),
              Icon(Icons.chevron_right_rounded),
            ],
          ),
          onTap: () {
            final theme = Theme.of(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Theme(
                  data: theme,
                  child: LocalePicker(
                    locale: selectedLocale,
                    onSelected: (newLocale) {
                      final notifier =
                          ref.read(deviceSettingsProvider.notifier);
                      notifier.setLocale(newLocale);
                    },
                  ),
                ),
              ),
            );
          },
        ),
        ListTile(
          key: const Key('theme'),
          title: const Text('Theme'),
          subtitle: Text(settings.isDarkMode ? 'Dark' : 'Light'),
          trailing: Icon(
            settings.isDarkMode ? Icons.brightness_3 : Icons.brightness_high,
          ),
          onTap: () {
            final notifier = ref.read(deviceSettingsProvider.notifier);
            notifier.toggleDarkMode();
          },
        ),
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
        ListTile(
          key: const Key('TextScale'),
          title: const Text('Text Scale'),
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
    );
  }
}
