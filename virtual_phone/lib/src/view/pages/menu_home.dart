import 'package:flutter/material.dart';

import '../widgets/controll_device_section_header.dart';
import '../widgets/minimal_section_list.dart';
import '../widgets/pick_locale_navigation_tile.dart';
import '../widgets/pick_model_navigation_tile.dart';
import '../widgets/pick_model_section_header.dart';
import '../widgets/section.dart';
import '../widgets/settings_app_section_header.dart';
import '../widgets/switch_bold_text_tile.dart';
import '../widgets/switch_dark_mode_tile.dart';
import '../widgets/switch_device_rotation_tile.dart';
import '../widgets/switch_show_keyboard_tile.dart';
import '../widgets/take_screenshot_tile.dart';
import '../widgets/text_scale_slider_tile.dart';

class MenuHomePage extends StatelessWidget {
  const MenuHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MinimalSectionList(
        sections: [
          // Pick Model
          StaticSection(
            header: PickModelSectionHeader(),
            tiles: [
              PickModelNavigationTile(),
            ],
          ),

          // Controll Device
          StaticSection(
            header: ControllDeviceSectionHeader(),
            tiles: [
              SwitchDeviceRotationTile(),
              SwitchShowKeyboardTile(),
              TakeScreenshotTile(),
            ],
          ),

          // Settings App
          StaticSection(
            header: SettingsAppSectionHeader(),
            tiles: [
              PickLocaleNavigationTile(),
              SwitchDarkModeTile(),
              SwitchBoldTextTile(),
              TextScaleSliderTile(),
            ],
          ),
        ],
      ),
    );
  }
}
