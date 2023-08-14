import 'package:ui_router/src/config/tab_shell_config.dart';
import 'package:ui_router/src/notifier/tab_shell_notifier.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/route/shell.dart';
import 'package:ui_router/src/route/tab_shell.dart';
import 'package:ui_router/src/router/config_from_route.dart';
import 'package:ui_router/src/state/state.dart';

List<UiTabShellNotifier> createAllTabNotifiers(
  UiShell rootShell,
  String? Function(UiState state)? redirect,
) {
  return _getSelfAndChildrenNotifiers(
    route: rootShell,
    parentPath: rootShell.path,
    redirect: redirect,
  );
}

List<UiTabShellNotifier> _getSelfAndChildrenNotifiers({
  required UiRoute route,
  required String parentPath,
  required String? Function(UiState state)? redirect,
}) {
  switch (route.type) {
    case UiRouteType.page:
      return [];
    case UiRouteType.navShell:
      return [];
    case UiRouteType.tabShell:
      final tabShell = route as UiTabShell;
      final children = tabShell.tabs
          .map(
            (subRoute) => _getSelfAndChildrenNotifiers(
              route: subRoute,
              parentPath: parentPath + tabShell.path,
              redirect: redirect,
            ),
          )
          .toList();
      List<UiTabShellNotifier> tmpRouters = [];
      for (final list in children) {
        tmpRouters.addAll(list);
      }
      final shellPath = parentPath + route.path;
      final tabShellConfig =
          configFromRoute(tabShell, shellPath) as UiTabShellConfig;
      final selfRouter = UiTabShellNotifier(
        config: tabShellConfig,
        pages: tabShell.tabs,
      );
      tmpRouters.insert(0, selfRouter);
      return tmpRouters;
  }
}
