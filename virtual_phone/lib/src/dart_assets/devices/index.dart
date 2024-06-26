import '../../logic/device_model/types/device_model.dart';
import 'android/index.dart';
import 'ios/index.dart';

abstract class Devices {
  static const ios = IosDevices();
  static const android = AndroidDevices();
  static List<DeviceModel> get all => [
        ...ios.all,
        ...android.all,
      ];
}
