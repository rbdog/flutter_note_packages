import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'menu.dart';

/// The tool layout when the screen is large.
class LargeLayout extends StatefulWidget {
  const LargeLayout({
    super.key,
    required this.menuSections,
  });

  final List<Widget> menuSections;

  @override
  LargeLayoutState createState() => LargeLayoutState();
}

class LargeLayoutState extends State<LargeLayout> {
  @override
  void initState() {
    // Forcing rebuild to update absolute postion in `_overlayKey`
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => setState(() {}),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Localizations(
        locale: const Locale('en', 'US'),
        delegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: 320,
              child: MediaQuery(
                data: mediaQuery.copyWith(
                  padding: mediaQuery.padding.copyWith(left: 0) +
                      const EdgeInsets.only(left: 40),
                ),
                child: Navigator(
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [
                      MaterialPageRoute(
                        builder: (context) => Menu(
                          sections: widget.menuSections,
                        ),
                      ),
                    ];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
