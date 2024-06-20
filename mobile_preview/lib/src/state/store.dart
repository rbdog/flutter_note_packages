import 'dart:async';
import 'package:mobile_preview/src/external/prefs/index.dart';
import 'package:mobile_preview/src/external/locales/default_locales.dart';
import 'package:mobile_preview/src/external/locales/locales.dart';
import 'package:mobile_preview/src/state/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../dart_assets/devices/index.dart';
import '../logic/device/types/device.dart';
import '../logic/device/types/id.dart';
import 'data.dart';
import 'settings.dart';

class MobilePreviewStore extends ChangeNotifier {
  /// Create a new store with the given [locales], [device] and [storage].
  MobilePreviewStore({
    required this.defaultDevice,
    List<Locale>? locales,
    List<Device>? devices,
  }) {
    initialize(
      locales: locales,
      devices: devices,
    );
  }

  final Device defaultDevice;

  PrivateMobilePreviewState _state =
      const PrivateMobilePreviewState.notInitialized();

  /// The curren state of the device preview.
  PrivateMobilePreviewState get state => _state;

  /// Update the state with [value] and notifies all listeners
  /// of a change.
  set state(PrivateMobilePreviewState value) {
    _state = value;
    notifyListeners();
  }

  /// Initializes the state by loading data from storage (if [useStorage])
  Future<void> initialize({
    List<Locale>? locales,
    List<Device>? devices,
  }) async {
    await state.maybeWhen(
      notInitialized: () async {
        state = const PrivateMobilePreviewState.initializing();

        final availaiableLocales = locales != null
            ? locales
                .map(
                  (available) =>
                      defaultAvailableLocales.cast<NamedLocale?>().firstWhere(
                            (all) => all!.code == available.toString(),
                            orElse: () => null,
                          ),
                )
                .where((x) => x != null)
                .toList()
            : defaultAvailableLocales;

        final defaultLocale = myBasicLocaleListResolution(
          PlatformDispatcher.instance.views.first.platformDispatcher.locales,
          availaiableLocales.map((x) => x!.locale).toList(),
        ).toString();

        devices = devices ?? Devices.all;
        MobilePreviewData? data;
        try {
          data = await prefs.load();
        } catch (e) {
          // ignore: avoid_print
          print('[mobile_preview] Error while restoring data: $e');
        }

        data ??= MobilePreviewData(
          locale: defaultLocale,
        );

        state = PrivateMobilePreviewState.initialized(
          locales: availaiableLocales.cast<NamedLocale>(),
          devices: devices!,
          data: data,
        );
      },
      orElse: () => Future.value(),
    );
  }
}

/// A set of extension to triggers updates of the state.
extension MobilePreviewStateHelperExtensions on MobilePreviewStore {
  /// Access to the current state's data.
  ///
  /// Throws an exception if not initialized.
  MobilePreviewData get data => state.maybeMap(
        initialized: (state) => state.data,
        orElse: () => throw Exception('Not initialized'),
      );

  /// Defines the current state's data.
  ///
  /// Throws an exception if not initialized.
  set data(MobilePreviewData data) {
    state = state.maybeMap(
      initialized: (state) {
        final result = state.copyWith(data: data);
        prefs.save(data);
        return result;
      },
      orElse: () => throw Exception('Not initialized'),
    );
  }

  /// Access to all available locales.
  ///
  /// Throws an exception if not initialized.
  List<NamedLocale> get locales => state.maybeMap(
        initialized: (state) => state.locales,
        orElse: () => throw Exception('Not initialized'),
      );

  /// Access to all available devices.
  ///
  /// Throws an exception if not initialized.
  List<Device> get devices => state.maybeMap(
        initialized: (state) => state.devices,
        orElse: () => throw Exception('Not initialized'),
      );

  /// Access to device preview settings from state's data.
  ///
  /// Throws an exception if not initialized.
  MobilePreviewSettingsData get settings =>
      data.settings ?? const MobilePreviewSettingsData();

  set settings(MobilePreviewSettingsData value) {
    data = data.copyWith(settings: value);
  }

  /// The currently selected device from the [availableDevices].
  ///
  /// Throws an exception if not initialized.
  Device get device {
    return state.maybeMap(
      initialized: (state) => state.devices.firstWhere(
        (x) =>
            x.id.toString() ==
            (data.deviceIdentifier ?? defaultDevice.id.toString()),
        orElse: () => state.devices.first,
      ),
      orElse: () => throw Exception('Not initialized'),
    );
  }

  /// Get the currently selected locale from state's data.
  ///
  /// Throws an exception if not initialized.
  Locale get locale => state.maybeMap(
        initialized: (state) => state.locales
            .firstWhere(
              (x) => x.locale.toString() == data.locale,
              orElse: () => state.locales.first,
            )
            .locale,
        orElse: () => throw Exception('Not initialized'),
      );

  /// Hide or show the current device frame.
  void toggleFrame() {
    data = data.copyWith(
      isFrameVisible: !data.isFrameVisible,
    );
  }

  /// Hide or show the virtual keyboard.
  void toggleVirtualKeyboard() {
    data = data.copyWith(
      isVirtualKeyboardVisible: !data.isVirtualKeyboardVisible,
    );
  }

  /// Switch from light to dark mode.
  void toggleDarkMode() {
    data = data.copyWith(
      isDarkMode: !data.isDarkMode,
    );
  }

  /// Change the simulated device orientation between portrait and landscape.
  void rotate() {
    final index = (data.orientation.index + 1) % Orientation.values.length;
    data = data.copyWith(
      orientation: Orientation.values[index],
    );
  }

  /// Select the current device.
  void selectDevice(DeviceId id) {
    data = data.copyWith(
      deviceIdentifier: id.toString(),
    );
  }
}
