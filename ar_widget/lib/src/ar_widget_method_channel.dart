import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ar_widget_platform_interface.dart';

/// An implementation of [ArWidgetPlatform] that uses method channels.
class MethodChannelArWidget extends ArWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ar_widget');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
