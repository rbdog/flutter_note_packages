import 'package:flutter/material.dart';

import 'bottom_menu_bar.dart';
import 'menu.dart';

/// The tool layout when the screen is small.
class SmallLayout extends StatelessWidget {
  const SmallLayout({
    super.key,
    required this.maxMenuHeight,
    required this.scaffoldKey,
    required this.onMenuVisibleChanged,
    required this.slivers,
  });

  /// The maximum modal menu height.
  final double maxMenuHeight;

  /// The key of the [Scaffold] that must be used to show the modal menu.
  final GlobalKey<ScaffoldState> scaffoldKey;

  /// Invoked each time the menu is shown or hidden.
  final ValueChanged<bool> onMenuVisibleChanged;

  /// The sections containing the tools.
  ///
  /// They must be [Sliver]s.
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BottomMenuBar(
        onTap: () async {
          onMenuVisibleChanged(true);
          final sheet = scaffoldKey.currentState?.showBottomSheet(
            (context) => ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Menu(
                isModal: true,
                sections: slivers,
              ),
            ),
            constraints: BoxConstraints(
              maxHeight: maxMenuHeight,
            ),
            backgroundColor: Colors.transparent,
          );
          await sheet?.closed;
          onMenuVisibleChanged(false);
        },
      ),
    );
  }
}
