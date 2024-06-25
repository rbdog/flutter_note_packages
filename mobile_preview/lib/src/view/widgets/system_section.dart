import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_preview/src/state/device_settings/provider.dart';
import 'package:mobile_preview/src/view/widgets/locale.dart';
import 'package:flutter/material.dart';

import '../../external/locales/default_locales.dart';
import '../../state/data.dart';
import 'panel_section.dart';

/// All the simulated system settings.
class SystemSection extends ConsumerWidget {
  const SystemSection({
    super.key,
    this.locale = true,
    this.theme = true,
    required this.settings,
  });

  /// Allow to select the current device locale.
  final bool locale;

  /// Allow to override the current system theme (dark/light)
  final bool theme;

  final MobilePreviewData settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = availableLocales.firstWhere(
      (it) => it.code == settings.locale,
      orElse: () => availableLocales.first,
    );

    return PanelSection(
      title: 'System',
      children: [
        if (locale)
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
        if (theme)
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
      ],
    );
  }
}
