import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/state.dart';

class UiNavShellState implements UiState {
  UiNavShellState({
    required this.stack,
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
  UiRouteType get routeType => UiRouteType.navShell;

  final List<UiState> stack;

  UiNavShellState copyWith({
    List<UiState>? stack,
  }) {
    return UiNavShellState(
      path: path,
      stack: stack ?? this.stack,
      pathParams: pathParams,
      queryParams: queryParams,
    );
  }
}
