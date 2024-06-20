import 'dart:convert';

import 'package:mobile_preview/src/external/prefs/interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../state/data.dart';

class Prefs extends PrefsInterface {
  static const String defaultPrefsKey = 'mobile_preview.settings';

  @override
  Future<MobilePreviewData?> load() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(defaultPrefsKey);
    if (json == null || json.isEmpty) return null;
    return MobilePreviewData.fromJson(jsonDecode(json));
  }

  @override
  Future<void> save(MobilePreviewData data) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(defaultPrefsKey, jsonEncode(data.toJson()));
  }
}
