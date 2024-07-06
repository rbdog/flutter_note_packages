import '../../types/index.dart';

final classicAndroid = DeviceModel(
  id: PresetModel.classicAndroid.id,
  label: const ModelLabel(
    name: '初代 Android',
    releasedYear: 2008,
  ),
  hardwareImageUri: 'assets/images/classic-android.png',
  hardwareScreen: const HardwareScreen(
    position: RatioPosition(
      left: 0.4610,
      top: 0.1060,
      right: 0.0200,
      bottom: 0.3036,
    ),
    logicalWidth: 320,
    logicalHeight: 480,
    logicalCornerRadius: 0,
    pixelRatio: 1,
    safeAreaInset: HardwareSafeAreaInset(
      portrait: HardwareInset(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
      ),
      landscape: HardwareInset(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
      ),
    ),
  ),
  os: const SoftwareOS(
    platform: SoftwarePlatform.android,
    keyboardHeight: 238,
  ),
);
