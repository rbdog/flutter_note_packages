import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/locales/default_locales.dart';
import '../../logic/os_settings/types/os_settings.dart';
import 'notifier.dart';

final deviceSettingsProvider =
    NotifierProvider<DeviceSettingsNotifier, OSSettings>(() {
  return DeviceSettingsNotifier();
});

final localeProvider = Provider((ref) {
  final locale = ref.watch(
    deviceSettingsProvider.select(
      (settings) => settings.locale,
    ),
  );
  return availableLocales
      .firstWhere(
        (it) => it.locale.toString() == locale,
        orElse: () => availableLocales.first,
      )
      .locale;
});
