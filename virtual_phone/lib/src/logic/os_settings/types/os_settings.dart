import 'package:freezed_annotation/freezed_annotation.dart';

part 'os_settings.freezed.dart';
part 'os_settings.g.dart';

/// OSSettings
@freezed
class OSSettings with _$OSSettings {
  const factory OSSettings({
    /// The currently selected device locale.
    @Default('en-US') String locale,

    /// Indicate whether the mode is currently dark.
    @Default(false) bool isDarkMode,

    /// Indicate whether texts are forced to bold.
    @Default(false) bool boldText,

    /// Indicate whether animations are disabled.
    @Default(false) bool disableAnimations,

    /// Indicate whether the highcontrast mode is activated.
    @Default(false) bool highContrast,

    /// Indicate whether the navigation is in accessible mode.
    @Default(false) bool accessibleNavigation,

    /// Indicate whether image colors are inverted.
    @Default(false) bool invertColors,

    /// The current text scaling factor.
    @Default(1.0) double textScaleFactor,
  }) = _DeviceSettings;

  factory OSSettings.fromJson(Map<String, dynamic> json) =>
      _$OSSettingsFromJson(json);
}
