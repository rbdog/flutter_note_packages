import 'package:flutter/material.dart';

import '../../../logic/device_model/types/device_model.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final model = OldDeviceModel(
  id: 'sony-xperia-1-ii',
  platform: TargetPlatform.android,
  name: 'Sony Xperia 1 II',
  pixelRatio: 4.0,
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 24.0,
    right: 0.0,
    bottom: 0.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 24.0,
    right: 0.0,
    bottom: 0.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
  frameSize: const Size(760, 1757.63),
  screenSize: const Size(1644 / 4, 3840 / 4),
);
