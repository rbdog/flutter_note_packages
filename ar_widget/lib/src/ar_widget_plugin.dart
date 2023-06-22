import 'package:ar_widget/src/ar_widget_platform_interface.dart';

class ArWidgetPlugin {
  Future<String?> getPlatformVersion() {
    return ArWidgetPlatform.instance.getPlatformVersion();
  }
}
