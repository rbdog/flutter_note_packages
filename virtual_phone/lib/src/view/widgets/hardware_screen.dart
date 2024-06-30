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
      final isPortrait = orientation == Orientation.portrait;
      final mediaQuery = MediaQuery.of(context);
      final expectedW =
          isPortrait ? deviceModel.screen.width : deviceModel.screen.height;
      final expectedH =
          isPortrait ? deviceModel.screen.height : deviceModel.screen.width;
      final actualW = constraints.maxWidth;
      final ratio = actualW / expectedW;

      return ClipRRect(
        borderRadius: BorderRadius.circular(deviceModel.screen.cornerRadius),
        child: SizedBox(
          width: deviceModel.screen.width,
          height: deviceModel.screen.height,
          child: MediaQuery(
            data: mediaQuery.copyWith(
              size: Size(
                expectedW,
                expectedH,
              ),
              devicePixelRatio: deviceModel.screen.pixelRatio,
            ),
            child: ScreenshotView(
              child: OverflowBox(
                alignment: Alignment.center,
                minWidth: expectedW,
                maxWidth: expectedW,
                minHeight: expectedH,
                maxHeight: expectedH,
                child: Transform.scale(
                  scale: ratio,
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
