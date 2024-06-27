import 'package:flutter/material.dart';

import 'menu_bar.dart' as my_menu_bar;
import 'controll_device_section.dart';
import '../widgets/settings_section.dart';
import 'pick_model_section.dart';

/// The panel which contains all the tools.
class Menu extends StatelessWidget {
  const Menu({
    super.key,
    this.isModal = false,
  });

  final bool isModal;

  @override
  Widget build(BuildContext context) {
    final rootContext = context;

    return HeroControllerScope.none(
      child: Navigator(
        onGenerateInitialRoutes: (nav, name) {
          return [
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: isModal
                      ? AppBar(
                          backgroundColor: Colors.black,
                          title: my_menu_bar.MenuBar(
                            onTap: () {
                              Navigator.maybePop(rootContext);
                            },
                          ),
                        )
                      : null,
                  body: const CustomScrollView(
                    slivers: [
                      PickModelSection(),
                      ControllDeviceSection(),
                      SettingsSection(),
                    ],
                  ),
                );
              },
            ),
          ];
        },
      ),
    );
  }
}
