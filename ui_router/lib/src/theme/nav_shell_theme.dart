import 'package:flutter/material.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/nav_shell_state.dart';
import 'package:ui_router/src/theme/theme.dart';

class UiNavShellTheme implements UiTheme {
  UiNavShellTheme({
    required this.path,
    required this.pages,
    required this.build,
  });

  @override
  final String path;
  final List<UiTheme> pages;
  final Widget Function(UiNavShellState state, Widget child) build;

  @override
  UiRouteType get routeType => UiRouteType.navShell;
}
