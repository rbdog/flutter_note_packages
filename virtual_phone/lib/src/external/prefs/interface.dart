import '../../logic/device_settings/types/device_settings.dart';

abstract class PrefsInterface {
  Future<DeviceSettings?> load();

  Future<void> save(DeviceSettings data);
}
