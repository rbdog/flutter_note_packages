import '../../logic/device_model/types/device_model.dart';

import 'iphone_original/device.dart' as iphone_original;
import 'iphone_12_mini/device.dart' as iphone_12_mini;
import 'iphone_12/device.dart' as iphone_12;
import 'iphone_12_pro_max/device.dart' as iphone_12_pro_max;
import 'iphone_13_mini/device.dart' as iphone_13_mini;
import 'iphone_13/device.dart' as iphone_13;
import 'iphone_13_pro_max/device.dart' as iphone_13_pro_max;
import 'iphone_se/device.dart' as iphone_se;
import 'samsung_galaxy_s20/device.dart' as galaxy_s20;
import 'samsung_galaxy_note20/device.dart' as galaxy_note20;
import 'samsung_galaxy_note20_ultra/device.dart' as galaxy_note20_ultra;
import 'samsung_galaxy_a50/device.dart' as galaxy_a50;
import 'oneplus_8_pro/device.dart' as oneplus_8_pro;
import 'sony_xperia_1_ii/device.dart' as xperia_1_ii;

String get galaxyS20 => galaxy_s20.model.id;
String get galaxyNote20 => galaxy_note20.model.id;
String get galaxyNote20Ultra => galaxy_note20_ultra.model.id;
String get galaxyA50 => galaxy_a50.model.id;
String get onePlus8Pro => oneplus_8_pro.model.id;
String get xperia1II => xperia_1_ii.model.id;
String get iPhoneOriginal => iphone_original.model.id;
String get iPhone12Mini => iphone_12_mini.model.id;
String get iPhone12 => iphone_12.model.id;
String get iPhone12ProMax => iphone_12_pro_max.model.id;
String get iPhone13Mini => iphone_13_mini.model.id;
String get iPhone13 => iphone_13.model.id;
String get iPhone13ProMax => iphone_13_pro_max.model.id;
String get iPhoneSE => iphone_se.model.id;

enum PresetDevice {
  /// iPhone (classic) - Apple iPhone 2007
  classicIphone,

  /// Android (classic) - T-Mobile G1 2008
  classicAndroid,

  /// vPhone
  vphone,

  /// vPhone (small)
  vphoneSmall,

  /// vPhone (large)
  vphoneLarge,

  /* 2022 */

  iphone14,
  iphoneSE3,
  galaxyS22,

  /* 2023 */

  // iphone15,
  // galaxyS23,
}

abstract class DeviceModelIds {
  static List<String> get all => [
        iPhoneOriginal,
        iPhone12Mini,
        iPhone12,
        iPhone12ProMax,
        iPhone13Mini,
        iPhone13,
        iPhone13ProMax,
        iPhoneSE,
        galaxyA50,
        galaxyS20,
        galaxyNote20,
        galaxyNote20Ultra,
        onePlus8Pro,
        xperia1II,
      ];
}

abstract class DeviceModels {
  static List<OldDeviceModel> get all => [
        iphone_original.model,
        iphone_12_mini.model,
        iphone_12.model,
        iphone_12_pro_max.model,
        iphone_13_mini.model,
        iphone_13.model,
        iphone_13_pro_max.model,
        iphone_se.model,
        galaxy_s20.model,
        galaxy_note20.model,
        galaxy_note20_ultra.model,
        galaxy_a50.model,
        oneplus_8_pro.model,
        xperia_1_ii.model,
      ];
}
