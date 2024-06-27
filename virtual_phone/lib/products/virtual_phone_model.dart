import '../src/dart_assets/devices/ios/index.dart';
import '../src/dart_assets/devices/android/index.dart';

abstract class VirtualPhoneModel {
  static const ios = IosDevices();
  static const android = AndroidDevices();
}
