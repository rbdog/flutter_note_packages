import 'package:flutter/material.dart';
import 'package:ui_router/src/config/nav_shell_config.dart';
import 'package:ui_router/src/notifier/nav_shell_notifier.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/route/shell.dart';
import 'package:ui_router/src/router/config_from_route.dart';
import 'package:ui_router/src/state/state.dart';
import 'package:ui_router/src/updater/get_all_patterns.dart';
import 'package:ui_router/src/updater/decode_uri.dart';
import 'package:ui_router/src/updater/nav_shell_updater.dart';

List<UiNavShellNotifier> createAllNavNotifiers(
  UiShell rootShell,
  String? Function(UiState state)? redirect,
) {
  debugPrint('creating notifiers for root=${rootShell.path}');
  final notifiers = _getSelfAndChildrenNotifiers(
    route: rootShell,
    parentPath: '',
    redirect: redirect,
  );
  return notifiers;
}

List<UiNavShellNotifier> _getSelfAndChildrenNotifiers({
  required UiRoute route,
  required String parentPath,
  required String? Function(UiState state)? redirect,
}) {
  switch (route.type) {
    case UiRouteType.page:
      return [];
    case UiRouteType.tabShell:
      return [];
    case UiRouteType.navShell:
      final navShell = route as UiShell;
      final children = navShell.pages
          .map(
            (subRoute) => _getSelfAndChildrenNotifiers(
              route: subRoute,
              parentPath: parentPath + navShell.path,
              redirect: redirect,
            ),
          )
          .toList();
      List<UiNavShellNotifier> tmpRouters = [];
      for (final list in children) {
        tmpRouters.addAll(list);
      }

      final navShellConfig =
          configFromRoute(navShell, parentPath) as UiNavShellConfig;
      final updater = UiNavShellUpdater(
        config: navShellConfig,
        redirect: redirect,
      );
      final allPatterns = getAllPatterns(shellConfig: navShellConfig);
      final initialUri = decodeUri(
        navShell.initialPagePath,
        allPatterns,
      )!;
      final iniState = updater.initState(initialUri: initialUri);
      final selfRouter = UiNavShellNotifier(
        state: iniState,
        updater: updater,
      );
      tmpRouters.insert(0, selfRouter);
      return tmpRouters;
  }
}
