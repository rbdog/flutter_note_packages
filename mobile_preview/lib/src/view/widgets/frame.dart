import 'package:flutter/material.dart';
import 'package:mobile_preview/src/view/widgets/screen_clipper.dart';

import '../../logic/device/types/device.dart';

/// Simulate a physical device and embedding a virtual
/// [screen] into it.
///
/// The [screen] media query's `padding`, `devicePixelRatio`, `size` are also
/// simulated from the device's info by overriding the default values.
///
/// The [screen]'s [Theme] will also have the `platform` of the simulated device.
///
/// Using the [DeviceFrame.identifier] constructor will load an
/// svg file from assets first to get device frame visuals, but also
/// device info.
///
/// To preload the info, the [DeviceFrame.info] constructor can be
/// used instead.
///
/// See also:
///
/// * [Devices] to get all available devices.
///
class DeviceFrame extends StatelessWidget {
  const DeviceFrame({
    super.key,
    required this.device,
    required this.screen,
    this.orientation = Orientation.portrait,
  });

  /// The screen that should be inserted into the simulated
  /// device.
  ///
  /// It is cropped with the device screen shape and its size
  /// is the [info]'s screensize.
  final Widget screen;

  /// All information related to the device.
  final Device device;

  /// The current frame simulated orientation.
  ///
  /// It will also affect the media query.
  final Orientation orientation;

  /// Creates a [MediaQuery] from the given device [info], and for the current device [orientation].
  ///
  /// All properties that are not simulated are inherited from the current [context]'s inherited [MediaQuery].
  static MediaQueryData mediaQuery({
    required BuildContext context,
    required Device? info,
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
      platform: device.id.platform,
      visualDensity: null,
    );
  }

  Widget _screen(BuildContext context, Device? info) {
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
          data: DeviceFrame.mediaQuery(
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
    final frameSize = device.frameSize;
    final bounds = device.screenPath.getBounds();
    final stack = SizedBox(
      width: frameSize.width,
      height: frameSize.height,
      child: Stack(
        children: [
          Positioned.fill(
            key: const Key('frame'),
            child: CustomPaint(
              key: ValueKey(device.id),
              painter: device.framePainter,
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
                device.screenPath,
              ),
              child: FittedBox(
                child: _screen(context, device),
              ),
            ),
          ),
        ],
      ),
    );

    final isRotated = device.isLandscape(orientation);

    return FittedBox(
      child: RotatedBox(
        quarterTurns: isRotated ? -1 : 0,
        child: stack,
      ),
    );
  }
}
