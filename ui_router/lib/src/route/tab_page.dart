import 'package:ui_router/src/route/route.dart';
import 'package:flutter/material.dart';
import 'package:ui_router/src/state/state.dart';

class UiTabPage implements UiRoute {
  const UiTabPage({
    required this.path,
    required this.body,
    required this.item,
  });

  @override
  final String path;
  final Widget Function(UiState state) body;
  final Widget Function(bool isSelected)? item;

  @override
  UiRouteType get type => UiRouteType.page;
}
