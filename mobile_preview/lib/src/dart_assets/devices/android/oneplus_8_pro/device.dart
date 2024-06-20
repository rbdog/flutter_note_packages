import 'package:flutter/material.dart';

import '../../../../logic/device/types/device.dart';
import '../../../../logic/device/types/id.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final info = Device(
  id: const DeviceId(
    TargetPlatform.android,
    'oneplus-8-pro',
  ),
  name: 'OnePlus 8 Pro',
  pixelRatio: 4.0,
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 40.0,
    right: 0.0,
    bottom: 20.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 40.0,
    top: 24.0,
    right: 40.0,
    bottom: 0.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
  frameSize: const Size(852, 1865.0),
  screenSize: const Size(360.0, 800.0),
);
