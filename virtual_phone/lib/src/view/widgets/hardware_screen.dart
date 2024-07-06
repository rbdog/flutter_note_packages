import 'package:flutter/material.dart';

import '../../logic/device_model/types/index.dart';
import 'screenshot_rect.dart';

class HardwareScreenView extends StatelessWidget {
  const HardwareScreenView({
    super.key,
    required this.deviceModel,
    required this.isPortrait,
    required this.builder,
  });

  final DeviceModel deviceModel;
  final bool isPortrait;
  final Widget Function(SoftwareScreen screen) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final modelScreen = deviceModel.hardwareScreen;
      final expectedW =
          isPortrait ? modelScreen.logicalWidth : modelScreen.logicalHeight;
      final expectedH =
          isPortrait ? modelScreen.logicalHeight : modelScreen.logicalWidth;
      final safeAreaInset = isPortrait
          ? modelScreen.safeAreaInset.portrait
          : modelScreen.safeAreaInset.landscape;
      final actualW = constraints.maxWidth;
      final actualH = constraints.maxHeight;
      final ratioW = actualW / expectedW;
      final ratioH = actualH / expectedH;

      return OverflowBox(
        alignment: Alignment.topLeft,
        minWidth: expectedW,
        maxWidth: expectedW,
        minHeight: expectedH,
        maxHeight: expectedH,
        child: Transform.scale(
          alignment: Alignment.topLeft,
          scaleX: ratioW,
          scaleY: ratioH,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              deviceModel.hardwareScreen.logicalCornerRadius,
            ),
            child: SizedBox(
              width: expectedW,
              height: expectedH,
              child: ScreenshotRect(
                child: MediaQuery(
                  data: mediaQuery.copyWith(
                    size: Size(
                      expectedW,
                      expectedH,
                    ),
                    devicePixelRatio: deviceModel.hardwareScreen.pixelRatio,
                  ),
                  child: builder(
                    SoftwareScreen(
                      width: expectedW,
                      height: expectedH,
                      cornerRadius:
                          deviceModel.hardwareScreen.logicalCornerRadius,
                      safeAreaInset: SoftwareSafeAreaInset(
                        left: safeAreaInset.left,
                        top: safeAreaInset.top,
                        right: safeAreaInset.right,
                        bottom: safeAreaInset.bottom,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
