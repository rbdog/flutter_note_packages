import 'package:ui_router/src/route/shell.dart';
import 'package:ui_router/src/route/page.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/route/tab_shell.dart';
import 'package:ui_router/src/theme/nav_shell_theme.dart';
import 'package:ui_router/src/theme/page_theme.dart';
import 'package:ui_router/src/theme/tab_shell_theme.dart';
import 'package:ui_router/src/theme/theme.dart';

UiTheme themeFromRoute(UiRoute route) {
  return _getSelfAndChildrenConfigs(route);
}

UiTheme _getSelfAndChildrenConfigs(UiRoute route) {
  switch (route.type) {
    case UiRouteType.page:
      final page = route as UiPage;
      return UiPageTheme(
        path: page.path,
        build: page.build,
      );
    case UiRouteType.navShell:
      final navShell = route as UiShell;
      final children = navShell.pages
          .map(
            (it) => _getSelfAndChildrenConfigs(it),
          )
          .toList();
      return UiNavShellTheme(
        path: navShell.path,
        pages: children,
        build: navShell.build,
      );
    case UiRouteType.tabShell:
      final tabShell = route as UiTabShell;
      final children = tabShell.tabs
          .map(
            (it) => _getSelfAndChildrenConfigs(it),
          )
          .toList();
      return UiTabShellTheme(
        path: tabShell.path,
        tabs: children,
        build: tabShell.build,
      );
  }
}
