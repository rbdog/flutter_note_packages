import 'package:flutter/material.dart';

class NavigatorShell extends StatelessWidget {
  const NavigatorShell({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope.none(
      child: Navigator(
        onGenerateInitialRoutes: (_, __) {
          return [
            MaterialPageRoute(
              builder: builder,
            ),
          ];
        },
      ),
    );
  }
}
