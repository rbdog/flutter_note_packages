import 'package:flutter/material.dart';

/// The panel which contains all the tools.
class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.sections,
    this.isModal = false,
  });

  final bool isModal;

  final List<Widget> sections;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rootContext = context;

    return Navigator(
      onGenerateInitialRoutes: (nav, name) {
        return [
          MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    'Menu',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  leading: isModal
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          tooltip: MaterialLocalizations.of(context)
                              .backButtonTooltip,
                          onPressed: () {
                            Navigator.maybePop(rootContext);
                          },
                        )
                      : null,
                ),
                body: Stack(
                  children: [
                    CustomScrollView(
                      slivers: sections,
                    ),
                  ],
                ),
              );
            },
          ),
        ];
      },
    );
  }
}
