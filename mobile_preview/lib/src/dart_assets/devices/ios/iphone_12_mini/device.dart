import 'package:mobile_preview/src/logic/device/types/id.dart';
import 'package:mobile_preview/src/logic/device/types/device.dart';
import 'package:flutter/material.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final info = Device(
  id: const DeviceId(
    TargetPlatform.iOS,
    'iphone-12-mini',
  ),
  name: 'iPhone 12 Mini',
  pixelRatio: 2.0,
  frameSize: const Size(871.0, 1768.0),
  screenSize: const Size(375.0, 812.0),
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 44.0,
    right: 0.0,
    bottom: 34.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 44.0,
    top: 0.0,
    right: 44.0,
    bottom: 21.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
);
