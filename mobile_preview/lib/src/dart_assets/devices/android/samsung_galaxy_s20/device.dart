import 'package:flutter/material.dart';

import '../../../../logic/device/types/device.dart';
import '../../../../logic/device/types/id.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final info = Device(
  id: const DeviceId(
    TargetPlatform.android,
    'samsung-galaxy-s20',
  ),
  name: 'Samsung Galaxy S20',
  pixelRatio: 4.0,
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 32.0,
    right: 0.0,
    bottom: 32.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 32.0,
    top: 24.0,
    right: 32.0,
    bottom: 0.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
  frameSize: const Size(856.54, 1899.0),
  screenSize: const Size(360.0, 800.0),
);
