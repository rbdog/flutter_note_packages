import 'package:flutter/material.dart';

import '../../logic/config/types/config.dart';

import '../router/navigator_shell.dart';
import '../widgets/side_menu_page.dart';
import 'menu_home.dart';
import 'device_container.dart';

/// HomeShell
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.config,
    required this.app,
  });

  /// The previewed widget.
  final Widget app;

  /// The default selected device for the first time.
  final Config? config;

  /// Width
  static const _menuWidth = 320.0;

  @override
  Widget build(BuildContext context) {
    return SideMenuPage(
      menuWidth: _menuWidth,
      menu: NavigatorShell(
        builder: (context) => const MenuHomePage(),
      ),
      content: DeviceContainerPage(
        app: app,
      ),
    );
  }
}
