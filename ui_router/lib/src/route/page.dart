import 'package:ui_router/src/route/route.dart';
import 'package:flutter/material.dart';
import 'package:ui_router/src/state/page_state.dart';

class UiPage implements UiRoute {
  const UiPage({
    required this.path,
    required this.build,
  });

  @override
  UiRouteType get type => UiRouteType.page;
  @override
  final String path;
  final Widget Function(UiPageState state) build;
}
