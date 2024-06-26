import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/locales/default_locales.dart';
import '../../external/locales/locales.dart';
import '../../external/prefs/index.dart';
import '../../logic/device_model/types/id.dart';
import '../../logic/device_settings/types/device_settings.dart';

class DeviceSettingsNotifier extends AsyncNotifier<DeviceSettings> {
  @override
  Future<DeviceSettings> build() async {
    final defaultLocale = myBasicLocaleListResolution(
      PlatformDispatcher.instance.views.first.platformDispatcher.locales,
      availableLocales.map((x) => x.locale).toList(),
    ).toString();

    DeviceSettings? data;

    try {
      data = await prefs.load();
    } catch (e) {
      // ignore: avoid_print
      print('[mobile_preview] Error while restoring data: $e');
    }

    data ??= DeviceSettings(
      locale: defaultLocale,
    );

    return const DeviceSettings();
  }

  void toggleVirtualKeyboard() {
    if (!state.hasValue) return;
    final oldIsVirtualKeyboardVisible = state.value!.isVirtualKeyboardVisible;
    state = AsyncValue.data(
      state.value!.copyWith(
        isVirtualKeyboardVisible: !oldIsVirtualKeyboardVisible,
      ),
    );
  }

  /// Switch from light to dark mode.
  void toggleDarkMode() {
    if (!state.hasValue) return;
    final oldIsDarkMode = state.value!.isDarkMode;
    state = AsyncValue.data(
      state.value!.copyWith(
        isDarkMode: !oldIsDarkMode,
      ),
    );
  }

  /// Change the simulated device orientation between portrait and landscape.
  void rotate() {
    if (!state.hasValue) return;
    final oldOrientation = state.value!.orientation;
    final index = (oldOrientation.index + 1) % Orientation.values.length;
    state = AsyncValue.data(
      state.value!.copyWith(
        orientation: Orientation.values[index],
      ),
    );
  }

  /// Select the current device.
  void selectDevice(DeviceModelId id) {
    if (!state.hasValue) return;
    state = AsyncValue.data(
      state.value!.copyWith(
        deviceId: id.toString(),
      ),
    );
  }

  /// Make the toolbar visible to the user.
  void showToolbar() {
    if (!state.hasValue) return;
    state = AsyncValue.data(
      state.value!.copyWith(
        isToolbarVisible: true,
      ),
    );
  }

  /// Hide the toolbar.
  void hideToolbar() {
    if (!state.hasValue) return;
    state = AsyncValue.data(
      state.value!.copyWith(
        isToolbarVisible: false,
      ),
    );
  }

  void toggleAccessibleNavigation() {
    if (!state.hasValue) return;
    final old = state.value!.accessibleNavigation;
    state = AsyncValue.data(
      state.value!.copyWith(
        accessibleNavigation: !old,
      ),
    );
  }

  void toggleInvertColors() {
    if (!state.hasValue) return;
    final old = state.value!.invertColors;
    state = AsyncValue.data(
      state.value!.copyWith(
        invertColors: !old,
      ),
    );
  }

  void toggleBoldText() {
    if (!state.hasValue) return;
    final old = state.value!.invertColors;
    state = AsyncValue.data(
      state.value!.copyWith(
        invertColors: !old,
      ),
    );
  }

  void setTextScale(double scale) {
    if (!state.hasValue) return;
    state = AsyncValue.data(
      state.value!.copyWith(
        textScaleFactor: scale,
      ),
    );
  }

  void setLocale(NamedLocale locale) {
    if (!state.hasValue) return;
    state = AsyncValue.data(
      state.value!.copyWith(
        locale: locale.code,
      ),
    );
  }
}
