import 'package:ui_router/src/config/config.dart';
import 'package:ui_router/src/config/nav_shell_config.dart';
import 'package:ui_router/src/config/page_config.dart';
import 'package:ui_router/src/config/tab_shell_config.dart';
import 'package:ui_router/src/route/shell.dart';
import 'package:ui_router/src/route/page.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/route/tab_shell.dart';

UiConfig configFromRoute(UiRoute route, String parentPath) {
  return _getSelfAndChildrenConfigs(route, parentPath);
}

UiConfig _getSelfAndChildrenConfigs(UiRoute route, String parentPath) {
  switch (route.type) {
    case UiRouteType.page:
      final page = route as UiPage;
      return UiPageConfig(
        path: page.path,
        fullPath: parentPath + page.path,
      );
    case UiRouteType.navShell:
      final navShell = route as UiShell;
      final children = navShell.pages
          .map(
            (it) => _getSelfAndChildrenConfigs(
              it,
              parentPath + navShell.path,
            ),
          )
          .toList();
      return UiNavShellConfig(
        path: navShell.path,
        fullPath: parentPath + navShell.path,
        pages: children,
        initialPagePath: navShell.initialPagePath,
      );
    case UiRouteType.tabShell:
      final tabShell = route as UiTabShell;
      final children = tabShell.tabs
          .map(
            (it) => _getSelfAndChildrenConfigs(
              it,
              parentPath + tabShell.path,
            ),
          )
          .toList();
      return UiTabShellConfig(
        path: tabShell.path,
        fullPath: parentPath + tabShell.path,
        tabs: children,
        initialTabPath: tabShell.initialTabPath,
      );
  }
}
