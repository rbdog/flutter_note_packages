import 'package:flutter/material.dart';

import '../../../logic/device_model/types/device_model.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final model = OldDeviceModel(
  id: 'iphone-13',
  platform: TargetPlatform.iOS,
  name: 'iPhone 13',
  pixelRatio: 3.0,
  frameSize: const Size(873.0, 1771.0),
  screenSize: const Size(390.0, 844.0),
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 47.0,
    right: 0.0,
    bottom: 34.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 47.0,
    top: 0.0,
    right: 47.0,
    bottom: 21.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
);