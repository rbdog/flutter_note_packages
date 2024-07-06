import '../../types/index.dart';

final classicIphone = DeviceModel(
  id: PresetModel.classicIphone.id,
  label: const ModelLabel(
    name: '初代 iPhone',
    releasedYear: 2007,
  ),
  hardwareImageUri: 'assets/images/classic-iphone.png',
  hardwareScreen: const HardwareScreen(
    position: RatioPosition(
      left: 0.101,
      top: 0.1712,
      right: 0.0836,
      bottom: 0.1737,
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
    platform: SoftwarePlatform.ios,
    keyboardHeight: 238,
  ),
);
