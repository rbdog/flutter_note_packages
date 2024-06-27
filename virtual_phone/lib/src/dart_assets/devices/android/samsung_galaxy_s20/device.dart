import 'package:flutter/material.dart';

import '../../../../logic/device_model/types/device_model.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final model = DeviceModel(
  id: 'samsung-galaxy-s20',
  platform: TargetPlatform.android,
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
