import 'package:flutter/material.dart';

import '../../logic/device_model/types/device_model.dart';
import 'screen_clipper.dart';

/// Simulate a physical device and embedding a virtual
class DeviceView extends StatelessWidget {
  const DeviceView({
    super.key,
    required this.deviceModel,
    this.orientation = Orientation.portrait,
    required this.screen,
  });

  /// The screen that should be inserted into the simulated
  final Widget screen;

  /// All information related to the device.
  final DeviceModel deviceModel;

  /// The current frame simulated orientation.
  ///
  /// It will also affect the media query.
  final Orientation orientation;

  /// Creates a [MediaQuery] from the given device [info], and for the current device [orientation].
  ///
  /// All properties that are not simulated are inherited from the current [context]'s inherited [MediaQuery].
  static MediaQueryData mediaQuery({
    required BuildContext context,
    required DeviceModel? info,
    required Orientation orientation,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final isRotated = info?.isLandscape(orientation) ?? false;
    final viewPadding = isRotated
        ? (info?.rotatedSafeAreas ?? info?.safeAreas)
        : (info?.safeAreas ?? mediaQuery.padding);

    final screenSize = info != null ? info.screenSize : mediaQuery.size;
    final width = isRotated ? screenSize.height : screenSize.width;
    final height = isRotated ? screenSize.width : screenSize.height;

    return mediaQuery.copyWith(
      size: Size(width, height),
      padding: viewPadding,
      viewInsets: EdgeInsets.zero,
      viewPadding: viewPadding,
      devicePixelRatio: info?.pixelRatio ?? mediaQuery.devicePixelRatio,
    );
  }

  ThemeData _theme(BuildContext context) {
    return Theme.of(context).copyWith(
      platform: deviceModel.id.platform,
      visualDensity: null,
    );
  }

  Widget _screen(BuildContext context, DeviceModel? info) {
    final mediaQuery = MediaQuery.of(context);
    final isRotated = info?.isLandscape(orientation) ?? false;
    final screenSize = info != null ? info.screenSize : mediaQuery.size;
    final width = isRotated ? screenSize.height : screenSize.width;
    final height = isRotated ? screenSize.width : screenSize.height;

    return RotatedBox(
      quarterTurns: isRotated ? 1 : 0,
      child: SizedBox(
        width: width,
        height: height,
        child: MediaQuery(
          data: DeviceView.mediaQuery(
            info: info,
            orientation: orientation,
            context: context,
          ),
          child: Theme(
            data: _theme(context),
            child: screen,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final frameSize = deviceModel.frameSize;
    final bounds = deviceModel.screenPath.getBounds();
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
                child: _screen(context, deviceModel),
              ),
            ),
          ),
        ],
      ),
    );

    final isRotated = deviceModel.isLandscape(orientation);

    return FittedBox(
      child: RotatedBox(
        quarterTurns: isRotated ? -1 : 0,
        child: stack,
      ),
    );
  }
}
