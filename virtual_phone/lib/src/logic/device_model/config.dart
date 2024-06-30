import 'types/device_model.dart';
import 'types/preset_device.dart';

final presetDevices = [
  // Classic iPhone
  DeviceModel(
    id: PresetDevice.classicIphone.id,
    screen: const Screen(
      position: RatioPosition(
        left: 0.101,
        top: 0.1712,
        right: 0.0836,
        bottom: 0.1737,
      ),
      width: 320,
      height: 480,
      cornerRadius: 0,
      pixelRatio: 1,
    ),
    os: const OS(
      portRaitSafeAreaInset: Inset(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
      ),
      landscapeSafeAreaInset: Inset(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
      ),
      keyboardHeight: 208,
    ),
    label: const Label(
      name: 'Classic iPhone',
      releasedYear: 2007,
      platform: Platform.ios,
    ),
    imageUri: 'assets/images/classic-iphone.png',
  ),
];
