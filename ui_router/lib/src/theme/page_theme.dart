import 'package:flutter/material.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/page_state.dart';
import 'package:ui_router/src/theme/theme.dart';

class UiPageTheme implements UiTheme {
  UiPageTheme({
    required this.path,
    required this.build,
  });

  @override
  final String path;
  final Widget Function(UiPageState state) build;

  @override
  UiRouteType get routeType => UiRouteType.page;
}
