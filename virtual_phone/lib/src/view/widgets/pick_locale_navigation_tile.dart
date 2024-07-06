import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/locales/default_locales.dart';
import '../../state/device_settings/provider.dart';
import '../pages/pick_locale.dart';
import 'minimal_tile.dart';

class PickLocaleNavigationTile extends ConsumerWidget {
  const PickLocaleNavigationTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(deviceSettingsProvider);
    final notifier = ref.watch(deviceSettingsProvider.notifier);

    final selectedLocale = availableLocales.firstWhere(
      (it) => it.code == settings.locale,
      orElse: () => availableLocales.first,
    );

    return MinimalTile.navigation(
      title: const Text('言語と地域'),
      builder: (context) => PickLocalePage(
        locale: selectedLocale,
        onSelected: (newLocale) {
          notifier.setLocale(newLocale);
        },
      ),
    );
  }
}
