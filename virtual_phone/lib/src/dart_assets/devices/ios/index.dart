import '../../../logic/device_model/types/device_model.dart';
import 'iphone_12_mini/device.dart' as i_iphone_12_mini;
import 'iphone_12/device.dart' as i_iphone_12;
import 'iphone_12_pro_max/device.dart' as i_iphone_12_pro_max;

import 'iphone_13_mini/device.dart' as i_iphone_13_mini;
import 'iphone_13/device.dart' as i_iphone_13;
import 'iphone_13_pro_max/device.dart' as i_iphone_13_pro_max;
import 'iphone_se/device.dart' as i_iphone_se;

/// A set of iOS devices.
class IosDevices {
  const IosDevices();

  DeviceModel get iPhone12Mini => i_iphone_12_mini.info;
  DeviceModel get iPhone12 => i_iphone_12.info;
  DeviceModel get iPhone12ProMax => i_iphone_12_pro_max.info;
  DeviceModel get iPhone13Mini => i_iphone_13_mini.info;
  DeviceModel get iPhone13 => i_iphone_13.info;
  DeviceModel get iPhone13ProMax => i_iphone_13_pro_max.info;
  DeviceModel get iPhoneSE => i_iphone_se.info;

  /// All devices.
  List<DeviceModel> get all => [
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
