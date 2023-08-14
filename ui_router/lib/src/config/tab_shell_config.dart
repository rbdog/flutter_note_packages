import 'package:ui_router/src/config/config.dart';
import 'package:ui_router/src/route/route.dart';

class UiTabShellConfig implements UiConfig {
  UiTabShellConfig({
    required this.path,
    required this.tabs,
    required this.fullPath,
    required this.initialTabPath,
  });

  @override
  final String path;
  final List<UiConfig> tabs;
  @override
  final String fullPath;
  final String initialTabPath;

  @override
  UiRouteType get routeType => UiRouteType.tabShell;
}
