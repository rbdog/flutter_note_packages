import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/os_settings/types/os_settings.dart';
import 'interface.dart';

class Prefs extends PrefsInterface {
  static const String defaultPrefsKey = 'mobile_preview.settings';

  @override
  Future<OSSettings?> load() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(defaultPrefsKey);
    if (json == null || json.isEmpty) return null;
    return OSSettings.fromJson(jsonDecode(json));
  }

  @override
  Future<void> save(OSSettings data) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(defaultPrefsKey, jsonEncode(data.toJson()));
  }
}
