import 'package:mobile_preview/src/external/locales/locales.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../logic/device/types/device.dart';
import 'data.dart';

part 'state.freezed.dart';

/// Represents the current state
@freezed
class PrivateMobilePreviewState with _$PrivateMobilePreviewState {
  const factory PrivateMobilePreviewState.notInitialized() =
      _NotInitializedMobilePreviewState;

  const factory PrivateMobilePreviewState.initializing() =
      _InitializingMobilePreviewState;

  const factory PrivateMobilePreviewState.initialized({
    required List<Device> devices,
    required List<NamedLocale> locales,
    required MobilePreviewData data,
  }) = _InitializedMobilePreviewState;
}
