import 'package:flutter/material.dart';

import '../../logic/device/types/device.dart';
import '../../state/data.dart';
import '../widgets/frame.dart';
import '../widgets/virtual_keyboard.dart';

class DeviceSimulaterPage extends StatelessWidget {
  const DeviceSimulaterPage({
    super.key,
    required this.device,
    required this.settings,
    required this.screenshotKey,
    required this.child,
  });

  final Device device;
  final MobilePreviewData settings;
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
            child: DeviceFrame(
              device: device,
              orientation: settings.orientation,
              screen: VirtualKeyboard(
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
  Device device,
  MobilePreviewData settings,
  BuildContext context,
) {
  var deviceMediaQuery = DeviceFrame.mediaQuery(
    context: context,
    info: device,
    orientation: settings.orientation,
  );

  if (settings.isVirtualKeyboardVisible) {
    deviceMediaQuery = VirtualKeyboard.mediaQuery(deviceMediaQuery);
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
