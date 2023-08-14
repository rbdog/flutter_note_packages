import 'package:ui_router/src/view/dialog_layer.dart';
import 'package:ui_router/src/view/nav_shell_view.dart';
import 'package:flutter/material.dart';
import 'package:ui_router/src/router/router.dart';

class UiRouterView extends StatelessWidget {
  const UiRouterView(
    this.router, {
    super.key,
  });

  final UiRouter router;

  @override
  Widget build(BuildContext context) {
    debugPrint('DEBUG: build UiRouterView');
    final rootNotifier = router.getNavShellNotifier('');
    return Stack(
      children: [
        UiNavShellView(
          theme: router.rootTheme,
          notifier: rootNotifier,
          router: router,
        ),
        UiDialogLayer(
          notifier: router.dialogNotifier,
        ),
      ],
    );
  }
}
