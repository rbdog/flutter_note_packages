import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/state.dart';

class UiPageState implements UiState {
  UiPageState({
    required this.path,
    required this.pathParams,
    required this.queryParams,
  });

  @override
  String path;

  @override
  final Map<String, String> pathParams;

  @override
  final Map<String, String> queryParams;

  @override
  UiRouteType get routeType => UiRouteType.page;
}
