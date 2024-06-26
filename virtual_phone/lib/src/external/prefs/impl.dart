import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/device_settings/types/device_settings.dart';
import 'interface.dart';

class Prefs extends PrefsInterface {
  static const String defaultPrefsKey = 'mobile_preview.settings';

  @override
  Future<DeviceSettings?> load() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(defaultPrefsKey);
    if (json == null || json.isEmpty) return null;
    return DeviceSettings.fromJson(jsonDecode(json));
  }

  @override
  Future<void> save(DeviceSettings data) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(defaultPrefsKey, jsonEncode(data.toJson()));
  }
}
