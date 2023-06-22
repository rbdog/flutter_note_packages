import 'package:flutter_test/flutter_test.dart';
import 'package:ar_widget/ar_widget.dart';
import 'package:ar_widget/src/ar_widget_platform_interface.dart';
import 'package:ar_widget/src/ar_widget_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockArWidgetPlatform
    with MockPlatformInterfaceMixin
    implements ArWidgetPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ArWidgetPlatform initialPlatform = ArWidgetPlatform.instance;

  test('$MethodChannelArWidget is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelArWidget>());
  });

  test('getPlatformVersion', () async {
    ArWidgetPlugin arWidgetPlugin = ArWidgetPlugin();
    MockArWidgetPlatform fakePlatform = MockArWidgetPlatform();
    ArWidgetPlatform.instance = fakePlatform;

    expect(await arWidgetPlugin.getPlatformVersion(), '42');
  });
}
