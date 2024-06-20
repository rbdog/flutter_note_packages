import 'models.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

/// Settings of device preview itself (tool bar position, background style).
@freezed
abstract class MobilePreviewSettingsData with _$MobilePreviewSettingsData {
  /// Create a new set of settings.
  const factory MobilePreviewSettingsData({
    /// The toolbar position.
    @Default(MobilePreviewToolBarPositionData.bottom)
    MobilePreviewToolBarPositionData toolbarPosition,

    /// The theme of the toolbar.
    @Default(MobilePreviewToolBarThemeData.dark)
    MobilePreviewToolBarThemeData toolbarTheme,

    /// The theme of the background.
    @Default(MobilePreviewBackgroundThemeData.light)
    MobilePreviewBackgroundThemeData backgroundTheme,
  }) = _MobilePreviewSettingsData;

  factory MobilePreviewSettingsData.fromJson(Map<String, dynamic> json) =>
      _$MobilePreviewSettingsDataFromJson(json);
}
