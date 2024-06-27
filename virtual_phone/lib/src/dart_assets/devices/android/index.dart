import '../../../logic/device_model/types/device_model.dart';
import 'samsung_galaxy_s20/device.dart' as i_samsung_galaxy_s20;
import 'samsung_galaxy_note20/device.dart' as i_samsung_galaxy_note20;
import 'samsung_galaxy_note20_ultra/device.dart'
    as i_samsung_galaxy_note20_ultra;
import 'samsung_galaxy_a50/device.dart' as samsung_galaxy_a50;
import 'oneplus_8_pro/device.dart' as i_oneplus_8_pro;
import 'sony_xperia_1_ii/device.dart' as i_sony_xperia_1_ii;

/// A set of Android devices.
class AndroidModelIds {
  const AndroidModelIds();

  String get samsungGalaxyS20 => i_samsung_galaxy_s20.model.id;
  String get samsungGalaxyNote20 => i_samsung_galaxy_note20.model.id;
  String get samsungGalaxyNote20Ultra => i_samsung_galaxy_note20_ultra.model.id;
  String get samsungGalaxyA50 => samsung_galaxy_a50.model.id;
  String get onePlus8Pro => i_oneplus_8_pro.model.id;
  String get sonyXperia1II => i_sony_xperia_1_ii.model.id;

  /// All available devices.
  List<String> get all => [
        samsungGalaxyA50,
        samsungGalaxyS20,
        samsungGalaxyNote20,
        samsungGalaxyNote20Ultra,
        onePlus8Pro,
        sonyXperia1II,
      ];
}

/// A set of Android devices.
class AndroidModels {
  const AndroidModels();

  /// All available devices.
  List<DeviceModel> get all => [
        i_samsung_galaxy_s20.model,
        i_samsung_galaxy_note20.model,
        i_samsung_galaxy_note20_ultra.model,
        samsung_galaxy_a50.model,
        i_oneplus_8_pro.model,
        i_sony_xperia_1_ii.model,
      ];
}
