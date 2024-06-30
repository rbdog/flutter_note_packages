import 'package:freezed_annotation/freezed_annotation.dart';

part 'os_settings.freezed.dart';
part 'os_settings.g.dart';

/// OSSettings
@freezed
class OSSettings with _$OSSettings {
  const factory OSSettings({
    required String locale,
    required bool isDarkMode,
    required bool boldText,
    required bool disableAnimations,
    required bool highContrast,
    required bool accessibleNavigation,
    required bool invertColors,
    required double textScale,
  }) = _DeviceSettings;

  factory OSSettings.fromJson(Map<String, dynamic> json) =>
      _$OSSettingsFromJson(json);
}
