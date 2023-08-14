import 'package:flutter/material.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/tab_shell_state.dart';
import 'package:ui_router/src/theme/theme.dart';

class UiTabShellTheme implements UiTheme {
  UiTabShellTheme({
    required this.path,
    required this.tabs,
    required this.build,
  });

  @override
  final String path;
  final List<UiTheme> tabs;
  final Widget Function(UiTabShellState state, Widget child)? build;

  @override
  UiRouteType get routeType => UiRouteType.tabShell;
}
