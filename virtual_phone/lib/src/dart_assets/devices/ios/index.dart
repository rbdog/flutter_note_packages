import '../../../logic/device_model/types/device_model.dart';
import 'iphone_12_mini/device.dart' as i_iphone_12_mini;
import 'iphone_12/device.dart' as i_iphone_12;
import 'iphone_12_pro_max/device.dart' as i_iphone_12_pro_max;
import 'iphone_13_mini/device.dart' as i_iphone_13_mini;
import 'iphone_13/device.dart' as i_iphone_13;
import 'iphone_13_pro_max/device.dart' as i_iphone_13_pro_max;
import 'iphone_se/device.dart' as i_iphone_se;

/// A set of iOS devices.
class IosModelIds {
  const IosModelIds();

  String get iPhone12Mini => i_iphone_12_mini.model.id;
  String get iPhone12 => i_iphone_12.model.id;
  String get iPhone12ProMax => i_iphone_12_pro_max.model.id;
  String get iPhone13Mini => i_iphone_13_mini.model.id;
  String get iPhone13 => i_iphone_13.model.id;
  String get iPhone13ProMax => i_iphone_13_pro_max.model.id;
  String get iPhoneSE => i_iphone_se.model.id;

  /// All devices.
  List<String> get all => [
        iPhone12Mini,
        iPhone12,
        iPhone12ProMax,
        iPhone13Mini,
        iPhone13,
        iPhone13ProMax,
        iPhoneSE,
      ];
}

/// A set of iOS devices.
class IosModels {
  const IosModels();

  /// All devices.
  List<DeviceModel> get all => [
        i_iphone_12_mini.model,
        i_iphone_12.model,
        i_iphone_12_pro_max.model,
        i_iphone_13_mini.model,
        i_iphone_13.model,
        i_iphone_13_pro_max.model,
        i_iphone_se.model,
      ];
}
