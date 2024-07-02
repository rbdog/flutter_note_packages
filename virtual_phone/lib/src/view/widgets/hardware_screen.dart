import 'package:flutter/material.dart';

import '../../logic/device_model/types/device_model.dart';
import 'screenshot_view.dart';

class HardwareScreenView extends StatelessWidget {
  const HardwareScreenView({
    super.key,
    required this.deviceModel,
    required this.orientation,
    required this.builder,
  });

  final DeviceModel deviceModel;
  final Orientation orientation;
  final Widget Function(Size screenSize) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final modelScreen = deviceModel.screen;
      final isPortrait = orientation == Orientation.portrait;
      final expectedW = isPortrait ? modelScreen.width : modelScreen.height;
      final expectedH = isPortrait ? modelScreen.height : modelScreen.width;
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
              deviceModel.screen.cornerRadius,
            ),
            child: SizedBox(
              width: expectedW,
              height: expectedH,
              child: ScreenshotView(
                child: MediaQuery(
                  data: mediaQuery.copyWith(
                    size: Size(
                      expectedW,
                      expectedH,
                    ),
                    devicePixelRatio: deviceModel.screen.pixelRatio,
                  ),
                  child: builder(
                    Size(
                      expectedW,
                      expectedH,
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
