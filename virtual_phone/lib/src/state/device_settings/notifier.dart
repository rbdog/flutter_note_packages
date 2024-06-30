import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/locales/default_locales.dart';
import '../../external/locales/locales.dart';
import '../../logic/os_settings/types/os_settings.dart';

class DeviceSettingsNotifier extends Notifier<OSSettings> {
  @override
  OSSettings build() {
    final defaultLocale = myBasicLocaleListResolution(
      PlatformDispatcher.instance.views.first.platformDispatcher.locales,
      availableLocales.map((x) => x.locale).toList(),
    ).toString();

    return OSSettings(
      locale: defaultLocale,
      isDarkMode: false,
      boldText: false,
      disableAnimations: false,
      highContrast: false,
      accessibleNavigation: false,
      invertColors: false,
      textScale: 1.0,
    );
  }

  /// Switch from light to dark mode.
  void toggleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
  }

  void toggleAccessibleNavigation() {
    state = state.copyWith(
      accessibleNavigation: !state.accessibleNavigation,
    );
  }

  void toggleInvertColors() {
    state = state.copyWith(
      invertColors: !state.invertColors,
    );
  }

  void toggleBoldText() {
    state = state.copyWith(
      boldText: !state.boldText,
    );
  }

  void setTextScale(double scale) {
    state = state.copyWith(
      textScale: scale,
    );
  }

  void setLocale(NamedLocale locale) {
    state = state.copyWith(
      locale: locale.code,
    );
  }
}
