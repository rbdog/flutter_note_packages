import 'package:mobile_preview/src/logic/device/types/device.dart';

import 'android/index.dart';
import 'ios/index.dart';

abstract class Devices {
  static const ios = IosDevices();
  static const android = AndroidDevices();
  static List<Device> get all => [
        ...ios.all,
        ...android.all,
      ];
}
