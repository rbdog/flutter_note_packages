import 'package:mobile_preview/src/external/locales/locales.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../logic/device/types/device.dart';
import 'data.dart';

part 'state.freezed.dart';

/// Represents the current state of the device preview.
@freezed
class PrivateMobilePreviewState with _$PrivateMobilePreviewState {
  /// The device preview has not been initialized yet.
  const factory PrivateMobilePreviewState.notInitialized() =
      _NotInitializedMobilePreviewState;

  /// The device preview is currently being initialized.
  const factory PrivateMobilePreviewState.initializing() =
      _InitializingMobilePreviewState;

  /// The device preview is available.
  const factory PrivateMobilePreviewState.initialized({
    /// The list of all available devices.
    required List<Device> devices,

    /// The list of all available locales.
    required List<NamedLocale> locales,

    /// The user settings of the preview.
    required MobilePreviewData data,
  }) = _InitializedMobilePreviewState;
}
