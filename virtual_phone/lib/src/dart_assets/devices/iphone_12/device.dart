import 'package:flutter/material.dart';

import '../../../logic/device_model/types/device_model.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final model = OldDeviceModel(
  id: 'iphone-12',
  platform: TargetPlatform.iOS,
  name: 'iPhone 12',
  pixelRatio: 2.0,
  frameSize: const Size(873.0, 1771.0),
  screenSize: const Size(1024.0, 1366.0),
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 24.0,
    right: 0.0,
    bottom: 20.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 24.0,
    right: 0.0,
    bottom: 20.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
);