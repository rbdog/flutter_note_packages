import 'package:device_preview_minus/src/frame/devices/generic/base/draw_extensions.dart';
import 'package:device_preview_minus/src/frame/info/device_type.dart';
import 'package:device_preview_minus/src/frame/info/identifier.dart';
import 'package:device_preview_minus/src/frame/info/info.dart';
import 'package:flutter/material.dart';

part 'frame.dart';

/// Creates a generic tablet device definition.
DeviceInfo buildGenericTabletDevice({
  required TargetPlatform platform,
  required String id,
  required String name,
  required Size screenSize,
  EdgeInsets safeAreas = EdgeInsets.zero,
  EdgeInsets rotatedSafeAreas = EdgeInsets.zero,
  double pixelRatio = 2.0,
  GenericTabletFramePainter framePainter = const GenericTabletFramePainter(),
}) {
  return DeviceInfo(
    identifier: DeviceIdentifier(
      platform,
      DeviceType.tablet,
      id,
    ),
    name: name,
    pixelRatio: pixelRatio,
    frameSize: framePainter.calculateFrameSize(screenSize),
    screenSize: screenSize,
    safeAreas: safeAreas,
    rotatedSafeAreas: rotatedSafeAreas,
    framePainter: framePainter,
    screenPath: framePainter.createScreenPath(screenSize),
  );
}
