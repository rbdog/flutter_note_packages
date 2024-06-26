import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/locales/default_locales.dart';
import '../../logic/device_settings/types/device_settings.dart';
import 'notifier.dart';

final deviceSettingsProvider =
    AsyncNotifierProvider<DeviceSettingsNotifier, DeviceSettings>(() {
  return DeviceSettingsNotifier();
});

final localeProvider = FutureProvider((ref) async {
  final settings = await ref.watch(deviceSettingsProvider.future);
  return availableLocales
      .firstWhere(
        (x) => x.locale.toString() == settings.locale,
        orElse: () => availableLocales.first,
      )
      .locale;
});
