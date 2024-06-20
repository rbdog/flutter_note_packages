import 'package:mobile_preview/src/logic/device/types/device.dart';

import 'package:mobile_preview/src/dart_assets/devices/android/samsung_galaxy_s20/device.dart'
    as i_samsung_galaxy_s20;
import 'package:mobile_preview/src/dart_assets/devices/android/samsung_galaxy_note20/device.dart'
    as i_samsung_galaxy_note20;
import 'package:mobile_preview/src/dart_assets/devices/android/samsung_galaxy_note20_ultra/device.dart'
    as i_samsung_galaxy_note20_ultra;
import 'package:mobile_preview/src/dart_assets/devices/android/samsung_galaxy_a50/device.dart'
    as samsung_galaxy_a50;
import 'package:mobile_preview/src/dart_assets/devices/android/oneplus_8_pro/device.dart'
    as i_oneplus_8_pro;
import 'package:mobile_preview/src/dart_assets/devices/android/sony_xperia_1_ii/device.dart'
    as i_sony_xperia_1_ii;

/// A set of iOS devices.
class AndroidDevices {
  const AndroidDevices();

  Device get samsungGalaxyS20 => i_samsung_galaxy_s20.info;

  Device get samsungGalaxyNote20 => i_samsung_galaxy_note20.info;

  Device get samsungGalaxyNote20Ultra => i_samsung_galaxy_note20_ultra.info;

  Device get samsungGalaxyA50 => samsung_galaxy_a50.info;

  Device get onePlus8Pro => i_oneplus_8_pro.info;

  Device get sonyXperia1II => i_sony_xperia_1_ii.info;

  /// All available devices.
  List<Device> get all => [
        samsungGalaxyA50,
        samsungGalaxyS20,
        samsungGalaxyNote20,
        samsungGalaxyNote20Ultra,
        onePlus8Pro,
        sonyXperia1II,
      ];
}
