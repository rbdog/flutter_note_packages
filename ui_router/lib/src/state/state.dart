import 'package:ui_router/src/route/route.dart';

abstract class UiState {
  UiRouteType get routeType;
  String get path;
  Map<String, String> get pathParams;
  Map<String, String> get queryParams;
}
