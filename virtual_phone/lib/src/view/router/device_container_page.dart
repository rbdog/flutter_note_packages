import 'package:flutter/material.dart';

import '../../logic/device_model/types/device_model.dart';
import '../../logic/device_settings/types/device_settings.dart';
import '../widgets/device_view.dart';
import '../widgets/software_keyboard.dart';

class DeviceContainerPage extends StatelessWidget {
  const DeviceContainerPage({
    super.key,
    required this.device,
    required this.settings,
    required this.screenshotKey,
    required this.child,
  });

  final DeviceModel device;
  final DeviceSettings settings;
  final Widget child;
  final GlobalKey screenshotKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Theme(
      data: theme.copyWith(
        platform: device.id.platform,
        visualDensity: VisualDensity.standard,
      ),
      child: Container(
        color: Colors.grey,
        padding: EdgeInsets.only(
          top: 20 + mediaQuery.viewPadding.top,
          right: 20 + mediaQuery.viewPadding.right,
          left: 20 + mediaQuery.viewPadding.left,
          bottom: 20,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: RepaintBoundary(
            key: screenshotKey,
            child: DeviceView(
              deviceModel: device,
              orientation: settings.orientation,
              screen: SoftwareKeyboard(
                isEnabled: settings.isVirtualKeyboardVisible,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    platform: device.id.platform,
                    brightness: settings.isDarkMode
                        ? Brightness.dark
                        : Brightness.light,
                  ),
                  child: MediaQuery(
                    data: _mediaQuery(
                      device,
                      settings,
                      context,
                    ),
                    child: Builder(
                      builder: (context) => child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

MediaQueryData _mediaQuery(
  DeviceModel device,
  DeviceSettings settings,
  BuildContext context,
) {
  var deviceMediaQuery = DeviceView.mediaQuery(
    context: context,
    info: device,
    orientation: settings.orientation,
  );

  if (settings.isVirtualKeyboardVisible) {
    deviceMediaQuery = SoftwareKeyboard.mediaQuery(deviceMediaQuery);
  }

  return deviceMediaQuery.copyWith(
    platformBrightness:
        settings.isDarkMode ? Brightness.dark : Brightness.light,
    textScaler: TextScaler.linear(settings.textScaleFactor),
    boldText: settings.boldText,
    disableAnimations: settings.disableAnimations,
    accessibleNavigation: settings.accessibleNavigation,
    invertColors: settings.invertColors,
  );
}
