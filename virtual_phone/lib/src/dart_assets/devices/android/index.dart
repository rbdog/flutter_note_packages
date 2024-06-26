import '../../../logic/device_model/types/device_model.dart';
import 'samsung_galaxy_s20/device.dart' as i_samsung_galaxy_s20;
import 'samsung_galaxy_note20/device.dart' as i_samsung_galaxy_note20;
import 'samsung_galaxy_note20_ultra/device.dart'
    as i_samsung_galaxy_note20_ultra;
import 'samsung_galaxy_a50/device.dart' as samsung_galaxy_a50;
import 'oneplus_8_pro/device.dart' as i_oneplus_8_pro;
import 'sony_xperia_1_ii/device.dart' as i_sony_xperia_1_ii;

/// A set of iOS devices.
class AndroidDevices {
  const AndroidDevices();

  DeviceModel get samsungGalaxyS20 => i_samsung_galaxy_s20.info;

  DeviceModel get samsungGalaxyNote20 => i_samsung_galaxy_note20.info;

  DeviceModel get samsungGalaxyNote20Ultra =>
      i_samsung_galaxy_note20_ultra.info;

  DeviceModel get samsungGalaxyA50 => samsung_galaxy_a50.info;

  DeviceModel get onePlus8Pro => i_oneplus_8_pro.info;

  DeviceModel get sonyXperia1II => i_sony_xperia_1_ii.info;

  /// All available devices.
  List<DeviceModel> get all => [
        samsungGalaxyA50,
        samsungGalaxyS20,
        samsungGalaxyNote20,
        samsungGalaxyNote20Ultra,
        onePlus8Pro,
        sonyXperia1II,
      ];
}
