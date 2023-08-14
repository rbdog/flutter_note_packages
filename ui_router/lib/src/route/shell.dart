import 'package:flutter/material.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/nav_shell_state.dart';

class UiShell implements UiRoute {
  const UiShell._({
    required this.path,
    required this.initialPagePath,
    required this.pages,
    required this.build,
  });

  @override
  UiRouteType get type => UiRouteType.navShell;
  @override
  final String path;
  final String initialPagePath;
  final List<UiRoute> pages;
  final Widget Function(UiNavShellState state, Widget child) build;

  factory UiShell({
    required String path,
    String? initialPagePath,
    required Widget Function(UiNavShellState state, Widget child) build,
    required List<UiRoute> pages,
  }) {
    return UiShell._(
      initialPagePath: initialPagePath ?? pages.first.path,
      path: path,
      pages: pages,
      build: build,
    );
  }

  factory UiShell.root({
    required List<UiRoute> pages,
  }) {
    return UiShell._(
      initialPagePath: '/index',
      path: '',
      pages: pages,
      build: (_, child) => child,
    );
  }
}
