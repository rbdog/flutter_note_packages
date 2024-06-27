import '../../logic/os_settings/types/os_settings.dart';

abstract class PrefsInterface {
  Future<OSSettings?> load();

  Future<void> save(OSSettings data);
}
