import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../mobile_preview.dart';
import '../widgets/frame.dart';
import '../widgets/virtual_keyboard.dart';

class DeviceSimulaterPage extends StatelessWidget {
  const DeviceSimulaterPage({
    super.key,
    required this.appBuilder,
    required this.screenshotKey,
  });

  final WidgetBuilder appBuilder;
  final GlobalKey screenshotKey;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final device = context.select(
      (MobilePreviewStore store) => store.device,
    );
    final orientation = context.select(
      (MobilePreviewStore store) => store.data.orientation,
    );
    final isVirtualKeyboardVisible = context.select(
      (MobilePreviewStore store) => store.data.isVirtualKeyboardVisible,
    );
    final isDarkMode = context.select(
      (MobilePreviewStore store) => store.data.isDarkMode,
    );

    return Container(
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
            orientation: orientation,
            screen: VirtualKeyboard(
              isEnabled: isVirtualKeyboardVisible,
              child: Theme(
                data: Theme.of(context).copyWith(
                  platform: device.id.platform,
                  brightness: isDarkMode ? Brightness.dark : Brightness.light,
                ),
                child: MediaQuery(
                  data: _mediaQuery(context),
                  child: Builder(
                    builder: (context) {
                      final app = appBuilder(context);
                      return app;
                    },
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

MediaQueryData _mediaQuery(BuildContext context) {
  final device = context.select(
    (MobilePreviewStore store) => store.device,
  );

  final orientation = context.select(
    (MobilePreviewStore store) => store.data.orientation,
  );

  final isVirtualKeyboardVisible = context.select(
    (MobilePreviewStore store) => store.data.isVirtualKeyboardVisible,
  );

  final isDarkMode = context.select(
    (MobilePreviewStore store) => store.data.isDarkMode,
  );

  final textScaleFactor = context.select(
    (MobilePreviewStore store) => store.data.textScaleFactor,
  );

  final boldText = context.select(
    (MobilePreviewStore store) => store.data.boldText,
  );

  final disableAnimations = context.select(
    (MobilePreviewStore store) => store.data.disableAnimations,
  );

  final accessibleNavigation = context.select(
    (MobilePreviewStore store) => store.data.accessibleNavigation,
  );

  final invertColors = context.select(
    (MobilePreviewStore store) => store.data.invertColors,
  );

  var deviceMediaQuery = DeviceFrame.mediaQuery(
    context: context,
    info: device,
    orientation: orientation,
  );

  if (isVirtualKeyboardVisible) {
    deviceMediaQuery = VirtualKeyboard.mediaQuery(deviceMediaQuery);
  }

  return deviceMediaQuery.copyWith(
    platformBrightness: isDarkMode ? Brightness.dark : Brightness.light,
    textScaler: TextScaler.linear(textScaleFactor),
    boldText: boldText,
    disableAnimations: disableAnimations,
    accessibleNavigation: accessibleNavigation,
    invertColors: invertColors,
  );
}
