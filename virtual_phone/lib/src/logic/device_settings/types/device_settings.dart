import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_settings.freezed.dart';
part 'device_settings.g.dart';

/// A [MobilePreview] configuration snapshot that can be
/// serialized to be persisted between sessions.
@freezed
class DeviceSettings with _$DeviceSettings {
  const factory DeviceSettings({
    /// Indicate whether the toolbar is visible.
    @Default(true) bool isToolbarVisible,

    /// The current orientation of the device
    @Default(Orientation.portrait) Orientation orientation,

    /// The currently selected device.
    String? deviceId,

    /// The currently selected device locale.
    @Default('en-US') String locale,

    /// Indicate whether the mode is currently dark.
    @Default(false) bool isDarkMode,

    /// Indicate whether texts are forced to bold.
    @Default(false) bool boldText,

    /// Indicate whether the virtual keyboard is visible.
    @Default(false) bool isVirtualKeyboardVisible,

    /// Indicate whether animations are disabled.
    @Default(false) bool disableAnimations,

    /// Indicate whether the highcontrast mode is activated.
    @Default(false) bool highContrast,

    /// Indicate whether the navigation is in accessible mode.
    @Default(false) bool accessibleNavigation,

    /// Indicate whether image colors are inverted.
    @Default(false) bool invertColors,

    /// Indicate whether image colors are inverted.
    @Default(<String, Map<String, dynamic>>{})
    Map<String, Map<String, dynamic>> pluginData,

    /// The current text scaling factor.
    @Default(1.0) double textScaleFactor,
  }) = _DeviceSettings;

  factory DeviceSettings.fromJson(Map<String, dynamic> json) =>
      _$DeviceSettingsFromJson(json);
}
