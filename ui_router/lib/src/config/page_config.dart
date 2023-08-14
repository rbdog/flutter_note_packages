import 'package:ui_router/src/config/config.dart';
import 'package:ui_router/src/route/route.dart';

class UiPageConfig implements UiConfig {
  UiPageConfig({
    required this.path,
    required this.fullPath,
  });

  @override
  final String path;
  @override
  final String fullPath;

  @override
  UiRouteType get routeType => UiRouteType.page;
}
