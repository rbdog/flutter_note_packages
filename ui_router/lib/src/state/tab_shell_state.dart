import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/state.dart';

class UiTabShellState implements UiState {
  UiTabShellState({
    required this.path,
    required this.selected,
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
  UiRouteType get routeType => UiRouteType.tabShell;
  final String selected;

  UiTabShellState copyWith({
    String? selected,
  }) {
    return UiTabShellState(
      path: path,
      selected: selected ?? this.selected,
      pathParams: pathParams,
      queryParams: queryParams,
    );
  }
}
