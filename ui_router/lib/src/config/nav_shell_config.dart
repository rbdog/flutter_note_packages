import 'package:ui_router/src/config/config.dart';
import 'package:ui_router/src/route/route.dart';

class UiNavShellConfig implements UiConfig {
  UiNavShellConfig({
    required this.path,
    required this.pages,
    required this.fullPath,
    required this.initialPagePath,
  });

  @override
  final String path;
  @override
  final String fullPath;
  final List<UiConfig> pages;
  final String initialPagePath;

  @override
  UiRouteType get routeType => UiRouteType.navShell;
}
