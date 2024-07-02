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
      portraitSafeAreaInset: Inset(
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
      keyboardHeight: 238,
    ),
    label: const Label(
      name: 'Classic iPhone',
      releasedYear: 2007,
      platform: Platform.ios,
    ),
    imageUri: 'assets/images/classic-iphone.png',
  ),
  // Classic Android
  DeviceModel(
    id: PresetDevice.classicAndroid.id,
    screen: const Screen(
      position: RatioPosition(
        left: 0.4610,
        top: 0.1060,
        right: 0.0200,
        bottom: 0.3036,
      ),
      width: 320,
      height: 480,
      cornerRadius: 0,
      pixelRatio: 1,
    ),
    os: const OS(
      portraitSafeAreaInset: Inset(
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
      keyboardHeight: 238,
    ),
    label: const Label(
      name: 'Classic Android',
      releasedYear: 2008,
      platform: Platform.android,
    ),
    imageUri: 'assets/images/classic-android.png',
  ),
  // Rotom
  DeviceModel(
    id: PresetDevice.rotom.id,
    screen: const Screen(
      position: RatioPosition(
        left: 0.0538,
        top: 0.2220,
        right: 0.0456,
        bottom: 0.1256,
      ),
      width: 432,
      height: 850,
      cornerRadius: 24,
      pixelRatio: 3,
    ),
    os: const OS(
      portraitSafeAreaInset: Inset(
        left: 0,
        top: 60,
        right: 0,
        bottom: 24,
      ),
      landscapeSafeAreaInset: Inset(
        left: 60,
        top: 0,
        right: 24,
        bottom: 0,
      ),
      keyboardHeight: 238,
    ),
    label: const Label(
      name: 'スマホロトム',
      releasedYear: 2019,
      platform: Platform.ios,
    ),
    imageUri: 'assets/images/rotom.png',
  ),
];
