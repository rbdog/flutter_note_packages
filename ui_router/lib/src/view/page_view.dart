import 'package:ui_router/src/state/page_state.dart';
import 'package:flutter/material.dart';
import 'package:ui_router/src/theme/page_theme.dart';

class UiPageView extends StatelessWidget {
  const UiPageView({
    super.key,
    required this.state,
    required this.theme,
  });

  final UiPageState state;
  final UiPageTheme theme;

  @override
  Widget build(BuildContext context) {
    final child = theme.build(state);
    return child;
  }
}
