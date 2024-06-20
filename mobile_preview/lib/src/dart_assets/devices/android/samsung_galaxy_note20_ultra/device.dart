import 'package:flutter/material.dart';

import '../../../../logic/device/types/device.dart';
import '../../../../logic/device/types/id.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final info = Device(
  id: const DeviceId(
    TargetPlatform.android,
    'samsung-galaxy-note20-ultra',
  ),
  name: 'Samsung Galaxy Note 20 Ultra',
  pixelRatio: 3.5,
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 36.0,
    right: 0.0,
    bottom: 24.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 36.0,
    top: 24.0,
    right: 36.0,
    bottom: 0.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
  frameSize: const Size(801, 1713.86),
  screenSize: const Size(412, 883),
);
