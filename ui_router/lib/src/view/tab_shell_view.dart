//
//
//

import 'package:ui_router/src/notifier/tab_shell_notifier.dart';
import 'package:ui_router/src/theme/tab_shell_theme.dart';
import 'package:ui_router/src/view/tab_bar.dart';
import 'package:ui_router/src/theme/tab_bar_edge.dart';
import 'package:ui_router/src/theme/tab_bar_style.dart';
import 'package:ui_router/src/view/tab_body.dart';
import 'package:flutter/material.dart';

// MEMO: - now only default tab bar
class UiTabShellView extends StatelessWidget {
  const UiTabShellView({
    super.key,
    this.edge = UiTabBarEdge.bottom,
    this.tabBarStyle,
    required this.theme,
    required this.notifier,
  });

  final UiTabShellNotifier notifier;
  final UiTabShellTheme theme;
  final UiTabBarEdge? edge;
  final UiTabBarStyle? tabBarStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (edge == UiTabBarEdge.top)
          UiTabBar(
            notifier,
            style: tabBarStyle,
          ),
        UiTabBody(notifier),
        if (edge == UiTabBarEdge.bottom)
          UiTabBar(
            notifier,
            style: tabBarStyle,
          ),
      ],
    );
  }
}
