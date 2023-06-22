import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ar_widget_method_channel.dart';

abstract class ArWidgetPlatform extends PlatformInterface {
  /// Constructs a ArWidgetPlatform.
  ArWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static ArWidgetPlatform _instance = MethodChannelArWidget();

  /// The default instance of [ArWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelArWidget].
  static ArWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ArWidgetPlatform] when
  /// they register themselves.
  static set instance(ArWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
