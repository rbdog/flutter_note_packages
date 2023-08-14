import 'package:ui_router/src/route/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/state.dart';

class UiTabShell implements UiRoute {
  const UiTabShell._({
    required this.path,
    required this.tabs,
    required this.build,
    required this.initialTabPath,
  });

  @override
  UiRouteType get type => UiRouteType.tabShell;
  @override
  final String path;
  final List<UiTabPage> tabs;
  final Widget Function(UiState state, Widget child)? build;
  final String initialTabPath;

  factory UiTabShell({
    required String name,
    String? initialTabPath,
    required Widget Function(UiState state, Widget child)? build,
    required List<UiTabPage> tabs,
  }) {
    return UiTabShell._(
      path: name,
      tabs: tabs,
      build: build,
      initialTabPath: initialTabPath ?? tabs.first.path,
    );
  }
}
