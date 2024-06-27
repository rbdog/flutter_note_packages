import '../../logic/device_model/types/device_model.dart';
import 'android/index.dart';
import 'ios/index.dart';

abstract class DeviceModelIds {
  static const ios = IosModelIds();
  static const android = AndroidModelIds();
  static List<String> get all => [
        ...ios.all,
        ...android.all,
      ];
}

abstract class DeviceModels {
  static const ios = IosModels();
  static const android = AndroidModels();
  static List<DeviceModel> get all => [
        ...ios.all,
        ...android.all,
      ];
}
