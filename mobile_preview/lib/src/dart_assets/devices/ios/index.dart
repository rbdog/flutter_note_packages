import 'package:mobile_preview/src/logic/device/types/device.dart';

import 'package:mobile_preview/src/dart_assets/devices/ios/iphone_12_mini/device.dart'
    as i_iphone_12_mini;
import 'package:mobile_preview/src/dart_assets/devices/ios/iphone_12/device.dart'
    as i_iphone_12;
import 'package:mobile_preview/src/dart_assets/devices/ios/iphone_12_pro_max/device.dart'
    as i_iphone_12_pro_max;

import 'package:mobile_preview/src/dart_assets/devices/ios/iphone_13_mini/device.dart'
    as i_iphone_13_mini;
import 'package:mobile_preview/src/dart_assets/devices/ios/iphone_13/device.dart'
    as i_iphone_13;
import 'package:mobile_preview/src/dart_assets/devices/ios/iphone_13_pro_max/device.dart'
    as i_iphone_13_pro_max;
import 'package:mobile_preview/src/dart_assets/devices/ios/iphone_se/device.dart'
    as i_iphone_se;

/// A set of iOS devices.
class IosDevices {
  const IosDevices();

  Device get iPhone12Mini => i_iphone_12_mini.info;
  Device get iPhone12 => i_iphone_12.info;
  Device get iPhone12ProMax => i_iphone_12_pro_max.info;
  Device get iPhone13Mini => i_iphone_13_mini.info;
  Device get iPhone13 => i_iphone_13.info;
  Device get iPhone13ProMax => i_iphone_13_pro_max.info;
  Device get iPhoneSE => i_iphone_se.info;

  /// All devices.
  List<Device> get all => [
        // Phones
        iPhone12Mini,
        iPhone12,
        iPhone12ProMax,
        iPhone13Mini,
        iPhone13,
        iPhone13ProMax,
        iPhoneSE,
      ];
}
