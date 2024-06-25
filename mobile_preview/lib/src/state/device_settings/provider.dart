import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_preview/src/state/device_settings/notifier.dart';

import '../../external/locales/default_locales.dart';
import '../data.dart';

final deviceSettingsProvider =
    AsyncNotifierProvider<DeviceSettingsNotifier, MobilePreviewData>(() {
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
