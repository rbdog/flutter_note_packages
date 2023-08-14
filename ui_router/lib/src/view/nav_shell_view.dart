import 'package:flutter/material.dart';
import 'package:ui_router/src/notifier/nav_shell_notifier.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/page_state.dart';
import 'package:ui_router/src/theme/nav_shell_theme.dart';
import 'package:ui_router/src/theme/page_theme.dart';
import 'package:ui_router/src/theme/tab_shell_theme.dart';
import 'package:ui_router/src/view/page_view.dart';
import 'package:ui_router/src/view/tab_shell_view.dart';
import 'package:ui_router/ui_router.dart';

class UiNavShellView extends StatefulWidget {
  const UiNavShellView({
    super.key,
    required this.theme,
    required this.notifier,
    required this.router,
  });

  final UiNavShellTheme theme;
  final UiNavShellNotifier notifier;
  final UiRouter router;

  @override
  State<UiNavShellView> createState() => _UiNavShellViewState();
}

class _UiNavShellViewState extends State<UiNavShellView> {
  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.notifier.state.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.notifier.state.removeListener(_rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final childStates = widget.notifier.state.value.stack;
    final navigatorWindow = Navigator(
      pages: List<Page>.generate(
        childStates.length,
        (index) {
          final childState = childStates[index];
          final childShellPath =
              widget.notifier.updater.config.fullPath + childState.path;
          final themeIndex = widget.theme.pages.indexWhere(
            (theme) => theme.path == childState.path,
          );
          if (themeIndex < 0) {
            // 見つからなかった
            debugPrint(
              'theme not found. for fullPath=$childShellPath',
            );
          }
          final theme = widget.theme.pages[themeIndex];
          late final Widget child;

          switch (childState.routeType) {
            case UiRouteType.navShell:
              final navShell = theme as UiNavShellTheme;
              final childNotifier =
                  widget.router.getNavShellNotifier(childShellPath);
              child = UiNavShellView(
                theme: navShell,
                notifier: childNotifier,
                router: widget.router,
              );
              break;
            case UiRouteType.tabShell:
              final tabShell = theme as UiTabShellTheme;
              final childNotifier =
                  widget.router.getTabShellNotifier(childShellPath);
              child = UiTabShellView(
                notifier: childNotifier,
                theme: tabShell,
              );
              break;
            case UiRouteType.page:
              final pageState = childState as UiPageState;
              final page = theme as UiPageTheme;
              child = UiPageView(
                state: pageState,
                theme: page,
              );
              break;
          }
          return MaterialPage(child: child);
        },
      ),
      onPopPage: (route, result) {
        widget.notifier.pop(untilWhere: null);
        return false; // disable pop of the framework
      },
    );
    final withFrame = widget.theme.build.call(
      widget.notifier.state.value,
      navigatorWindow,
    );
    return withFrame;
  }
}
