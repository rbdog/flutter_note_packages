import 'package:ui_router/src/route/route.dart';

abstract class UiConfig {
  UiRouteType get routeType;
  String get path;
  String get fullPath;
}
