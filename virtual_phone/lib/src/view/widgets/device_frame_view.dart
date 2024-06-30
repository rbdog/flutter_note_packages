import 'package:flutter/material.dart';

import '../../logic/device_model/types/device_model.dart';
import 'screen_clipper.dart';

/// Simulate a physical device and embedding a virtual
class DeviceFrameView extends StatelessWidget {
  const DeviceFrameView({
    super.key,
    required this.deviceModel,
    required this.orientation,
    required this.child,
  });

  /// All information related to the device.
  final OldDeviceModel deviceModel;

  /// The current frame simulated orientation.
  final Orientation orientation;

  /// The screen that should be inserted into the simulated
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final frameSize = deviceModel.frameSize;
    final bounds = deviceModel.screenPath.getBounds();
    final isRotated = orientation == Orientation.landscape;
    final screenSize = deviceModel.screenSize;
    final width = isRotated ? screenSize.height : screenSize.width;
    final height = isRotated ? screenSize.width : screenSize.height;
    final viewPadding =
        isRotated ? deviceModel.rotatedSafeAreas : deviceModel.safeAreas;

    final stack = SizedBox(
      width: frameSize.width,
      height: frameSize.height,
      child: Stack(
        children: [
          Positioned.fill(
            key: const Key('frame'),
            child: CustomPaint(
              key: ValueKey(deviceModel.id),
              painter: deviceModel.framePainter,
            ),
          ),
          Positioned(
            key: const Key('Screen'),
            left: bounds.left,
            top: bounds.top,
            width: bounds.width,
            height: bounds.height,
            child: ClipPath(
              clipper: ScreenClipper(
                deviceModel.screenPath,
              ),
              child: FittedBox(
                child: RotatedBox(
                  quarterTurns: isRotated ? 1 : 0,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: MediaQuery(
                      data: mediaQuery.copyWith(
                        size: Size(width, height),
                        padding: viewPadding,
                        viewInsets: EdgeInsets.zero,
                        viewPadding: viewPadding,
                        devicePixelRatio: deviceModel.pixelRatio,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return FittedBox(
      child: RotatedBox(
        quarterTurns: isRotated ? -1 : 0,
        child: stack,
      ),
    );
  }
}
